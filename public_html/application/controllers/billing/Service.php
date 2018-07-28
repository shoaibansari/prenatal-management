<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
* @author    : bdtask 
* @created at: 25.11.2017
*/

class Service extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'billing/service_model' 
		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1) 
			redirect('login');
	}
 
	public function index()
	{ 
		$data['title'] = display('service_list');
        #-------------------------------#
        #
        #pagination starts
        #
        $config["base_url"] = base_url('billing/service/index');
        $config["total_rows"] = $this->db->count_all('bill_service');
        $config["per_page"] = 25;
        $config["uri_segment"] = 4;
        $config["last_link"] = "Last"; 
        $config["first_link"] = "First"; 
        $config['next_link'] = 'Next';
        $config['prev_link'] = 'Prev';  
        $config['full_tag_open'] = "<ul class='pagination col-xs pull-right'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";
        /* ends of bootstrap */
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
        $data['services'] = $this->service_model->read($config["per_page"], $page);
        $data["links"] = $this->pagination->create_links();
        #
        #pagination ends
        #    
		$data['content'] = $this->load->view('billing/service/list',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	} 



	public function form($id = null)
	{
		$data['title'] = display('add_service');
		#-------------------------------#
		$this->form_validation->set_rules('name', display('service_name'),'required|max_length[255]|regex_match[/^[A-Z a-z \-]+$/]');
		$this->form_validation->set_rules('description', display('description'),'max_length[255]');
		$this->form_validation->set_rules('quantity', display('quantity'),'required|max_length[11]|numeric');
		$this->form_validation->set_rules('amount', display('rate'),'required|max_length[11]|numeric');
		$this->form_validation->set_rules('status', display('status'),'required'); 

		#-------------------------------#
		$data['service'] = (object)$postData = array(
			'id'           => $this->input->post('id'), 
			'name'         => $this->input->post('name'), 
			'description'  => $this->input->post('description'), 
			'quantity'     => $this->input->post('quantity'), 
			'amount'       => $this->input->post('amount'), 
			'status'       => $this->input->post('status'),
		); 
		#-------------------------------#
		if ($this->form_validation->run() === true) {

			#if empty $id then insert data
			if (empty($id)) 
			{
				if ($this->service_model->create($postData)) {
					$this->session->set_flashdata('message', display('save_successfully'));
				} 
				else 
				{
					$this->session->set_flashdata('exception', display('please_try_again'));
				} 
				redirect('billing/service/form/');
			}
			else 
			{

				if ($this->service_model->update($postData)) {
					$this->session->set_flashdata('message', display('update_successfully'));
				} 
				else 
				{
					$this->session->set_flashdata('exception', display('please_try_again'));
				} 
				redirect('billing/service/form/'.$id);
			}

		} else { 
			if (!empty($id))
			{
				$data['service'] = $this->service_model->read_by_id($id);
			}
			$data['content'] = $this->load->view('billing/service/form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}

  

    public function delete($id = null) 
    {
        if ($this->service_model->delete($id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
		redirect('billing/service/index');
    }


}
