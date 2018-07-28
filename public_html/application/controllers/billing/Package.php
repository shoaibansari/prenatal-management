<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Package extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'billing/package_model',
			'billing/service_model' 
		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1) 
			redirect('login');
	}
 
	public function index()
	{ 
		$data['title'] = display('package_list');
        #-------------------------------#
        #
        #pagination starts
        #
        $config["base_url"] = base_url('billing/package/index');
        $config["total_rows"] = $this->db->count_all('bill_package');
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
        $data['packages'] = $this->package_model->read($config["per_page"], $page);
        $data["links"] = $this->pagination->create_links();
        #
        #pagination ends
        #    
		$data['content'] = $this->load->view('billing/package/list',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	} 



	public function form()
	{
		$data['title'] = display('add_package');
		#-------------------------------#
		$this->form_validation->set_rules('name', display('package_name'),'required|max_length[255]|regex_match[/^[A-Z a-z \-]+$/]');

		$this->form_validation->set_rules('service_id[]', display('description'),'max_length[255]');
		$this->form_validation->set_rules('service_name[]', display('service_name'),'max_length[255]|regex_match[/^[A-Z a-z \-]+$/]');
		$this->form_validation->set_rules('quantity[]', display('quantity'),'max_length[11]|numeric');
		$this->form_validation->set_rules('amount[]', display('rate'),'max_length[11]|numeric');
		$this->form_validation->set_rules('discount', display('discount'),'required|max_length[11]|numeric');
		$this->form_validation->set_rules('status', display('status'),'required'); 
		#-------------------------------#
		$sID   = $this->input->post('service_id');
		$sName = $this->input->post('service_name');
		$sQty  = $this->input->post('quantity');
		$sAmt  = $this->input->post('amount');
		$services = array();
		for ($i=0; $i < sizeof($sID); $i++)
		{
			if(!empty($sID[$i])) 
			$services[$i] = array(
				'id' => $sID[$i],
				'name' => $sName[$i],
				'quantity' => $sQty[$i],
				'amount' => $sAmt[$i]
			);
		} 
		$services = json_encode($services); 
		#-------------------------------#
		$data['package'] = (object)$postData = array(
			'name'         => $this->input->post('name'), 
			'description'  => $this->input->post('description'), 
			'services'     => $services, 
			'discount'     => $this->input->post('discount'), 
			'status'       => $this->input->post('status'),
		); 
		#-------------------------------#
		if ($this->form_validation->run() === true) {
			if ($this->package_model->create($postData)) {
				$this->session->set_flashdata('message', display('save_successfully'));
			} 
			else 
			{
				$this->session->set_flashdata('exception', display('please_try_again'));
			} 
			redirect('billing/package/form/');

		} else {  
			$data['service_list'] = $this->service_model->readList();
			$data['content'] = $this->load->view('billing/package/form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}
  

	public function edit($id = null)
	{
		#-------------------------------#
		$this->form_validation->set_rules('name', display('package_name'),'required|max_length[255]');

		$this->form_validation->set_rules('service_id[]', display('description'),'max_length[255]');
		$this->form_validation->set_rules('service_name[]', display('service_name'),'max_length[255]');
		$this->form_validation->set_rules('quantity[]', display('quantity'),'max_length[11]');
		$this->form_validation->set_rules('amount[]', display('rate'),'max_length[11]');
		$this->form_validation->set_rules('discount', display('discount'),'required|max_length[11]');
		$this->form_validation->set_rules('status', display('status'),'required'); 
		#-------------------------------#
		$sID   = $this->input->post('service_id');
		$sName = $this->input->post('service_name');
		$sQty  = $this->input->post('quantity');
		$sAmt  = $this->input->post('amount');
		$services = array();
		for ($i=0; $i < sizeof($sID); $i++)
		{
			if(!empty($sID[$i])) 
			$services[$i] = array(
				'id' => $sID[$i],
				'name' => $sName[$i],
				'quantity' => $sQty[$i],
				'amount' => $sAmt[$i]
			);
		} 
		$services = json_encode($services); 

		#-------------------------------#
		$data['package'] = (object)$postData = array(
			'id'           => $this->input->post('id'), 
			'name'         => $this->input->post('name'), 
			'description'  => $this->input->post('description'), 
			'services'     => $services, 
			'discount'     => $this->input->post('discount'), 
			'status'       => $this->input->post('status'),
		); 
		#-------------------------------#
		if ($this->form_validation->run() === true) {
			if ($this->package_model->update($postData)) {
				$this->session->set_flashdata('message', display('update_successfully'));
			} 
			else 
			{
				$this->session->set_flashdata('exception', display('please_try_again'));
			} 
			redirect('billing/package/edit/'.$id);

		} else {  
			$data['service_list'] = $this->service_model->readList();
			$data['title'] = display('edit_package');
			$data['package'] = $this->package_model->read_by_id($id);
			$data['content'] = $this->load->view('billing/package/edit',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}




	public function view($id = null)
	{
		$data['title'] = display('package_details');
		$data['package'] = $this->package_model->read_by_id($id);
		$data['content'] = $this->load->view('billing/package/view',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}

  

    public function delete($id = null) 
    {
        if ($this->package_model->delete($id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
		redirect('billing/package/index');
    }


}
