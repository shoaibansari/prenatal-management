<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class advance extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'billing/advance_model' 
		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1) 
			redirect('login');
	}
 
	public function index()
	{ 
		$data['title'] = display('advance_list');
        #-------------------------------#
        #
        #pagination starts
        #
        $config["base_url"] = base_url('billing/advance/index');
        $config["total_rows"] = $this->db->count_all('bill_advanced');
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
        $data['advances'] = $this->advance_model->read($config["per_page"], $page);
        $data["links"] = $this->pagination->create_links();
        #
        #pagination ends
        #    
		$data['content'] = $this->load->view('billing/advance/list',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	} 



	public function form($id = null)
	{
		$data['title'] = display('add_advance');
		#-------------------------------#
		$this->form_validation->set_rules(
		    'admission_id', display('admission_id'),
		    array(
		        'required',
			    array(
	                'admission_callable',
			        function($value)
			        {
						$rows = $this->db->select("admission_id")
			             	->from("bill_admission")
			             	->where("admission_id", $value)
			             	->get()
			             	->num_rows();

			            if ($rows>0) 
			            {
			            	return true;
			            }
			            else 
			            {
			            	$this->form_validation->set_message('admission_callable', 'The {field} is not valid!');
	                       
			            	return false;
			            }
			        }
			    )
		    )
		);

		$this->form_validation->set_rules(
		    'patient_id', display('patient_id'),
		    array(
		        'required',
			    array(
	                'patient_callable',
			        function($value)
			        {
						$rows = $this->db->select("patient_id")
			             	->from("patient")
			             	->where("patient_id", $value)
			             	->get()
			             	->num_rows();

			            if ($rows>0) 
			            {
			            	return true;
			            }
			            else 
			            {
			            	$this->form_validation->set_message('patient_callable', 'The {field} is not valid!');
			            	return false;
			            }
			        }
			    )
		    )
		);  
		$this->form_validation->set_rules('amount', display('amount'),'required|max_length[11]');
		$this->form_validation->set_rules('payment_method', display('payment_method'),'max_length[255]');
		$this->form_validation->set_rules('cash_card_or_cheque', display('cash_card_or_cheque'),'max_length[10]');
		$this->form_validation->set_rules('receipt_no', display('receipt_no'),'max_length[100]');
		#-------------------------------#
		$data['advance'] = (object)$postData = array(
			'id'           => $this->input->post('id'), 
			'admission_id' => $this->input->post('admission_id'), 
			'patient_id'   => $this->input->post('patient_id'), 
			'amount'       => $this->input->post('amount'), 
			'payment_method'      => $this->input->post('payment_method'), 
			'cash_card_or_cheque' => $this->input->post('cash_card_or_cheque'), 
			'receipt_no'   => $this->input->post('receipt_no'), 
			'date'         => date("Y-m-d H:i:s") 
		); 
		#-------------------------------#
		if ($this->form_validation->run() === true) {

			#if empty $id then insert data
			if (empty($id)) 
			{
				if ($this->advance_model->create($postData)) {
					$this->session->set_flashdata('message', display('save_successfully'));
				} 
				else 
				{
					$this->session->set_flashdata('exception', display('please_try_again'));
				} 
				redirect('billing/advance/form/');
			}
			else 
			{

				if ($this->advance_model->update($postData)) {
					$this->session->set_flashdata('message', display('update_successfully'));
				} 
				else 
				{
					$this->session->set_flashdata('exception', display('please_try_again'));
				} 
				redirect('billing/advance/form/'.$id);
			}

		} else { 
			if (!empty($id))
			{
				$data['advance'] = $this->advance_model->read_by_id($id);
			}
			$data['content'] = $this->load->view('billing/advance/form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}

  

    public function delete($id = null) 
    {
        if ($this->advance_model->delete($id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
		redirect('billing/advance/index');
    }


}
