<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Limit_approval extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'insurance/insurance_model',
			'insurance/limit_approval_model',
			'dashboard_model'
		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1) 
			redirect('login');
	}
 
	public function index()
	{ 
		$data['title'] = display('limit_approval_list');
        #-------------------------------#
        #
        #pagination starts
        #
        $config["base_url"] = base_url('insurance/limit_approval/index');
        $config["total_rows"] = $this->db->count_all('inc_limit_approval');
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
        $data['approvals'] = $this->limit_approval_model->read($config["per_page"], $page);
        $data["links"] = $this->pagination->create_links();
        #
        #pagination ends
        #    
		$data['content'] = $this->load->view('insurance/limit_approval_list',$data,true);
		$data['count']    = $this->dashboard_model->getAlertCount(); 
		$this->load->view('layout/main_wrapper',$data);
	} 



	public function form()
	{
		$data['title'] = display('add_limit_approval');
		#-------------------------------#
		$this->form_validation->set_rules('patient_id', display('patient_id'),'required|max_length[30]');
		$this->form_validation->set_rules('room_no', display('room_no'),'max_length[100]');
		$this->form_validation->set_rules('consultant_id', display('consultant_name'),'required|max_length[11]');
		$this->form_validation->set_rules('policy_name', display('policy_name'),'max_length[255]');
		$this->form_validation->set_rules('policy_no', display('policy_no'),'max_length[100]');
		$this->form_validation->set_rules('policy_holder_name', display('policy_holder_name'),'max_length[255]');
		$this->form_validation->set_rules('insurance_id', display('insurance_name'),'required|max_length[11]');
		$this->form_validation->set_rules('total', display('total'),'max_length[50]');
		$this->form_validation->set_rules('status', display('status'),'required'); 
		#-------------------------------#
		$DName   = $this->input->post('disease_name');
		$DCharge = $this->input->post('disease_details');
		$disease_details = array();
		for ($i=0; $i < sizeof($DName); $i++)
		{
			if(!empty($DName[$i]))
			$disease_details[$DName[$i]] = $DCharge[$i]; 
		} 
		$disease_details = json_encode($disease_details); 
		#-------------------------------#
		$BName   = $this->input->post('breakup_name');
		$BCharge = $this->input->post('breakup_charge');
		$approval_breakup = array();
		for ($i=0; $i < sizeof($BName); $i++)
		{
			if(!empty($BName[$i]))
			$approval_breakup[$BName[$i]] = $BCharge[$i]; 
		} 
		$approval_breakup = json_encode($approval_breakup);  
		#-------------------------------#
		$data['approval'] = (object)$postData = array(
			'patient_id'      => $this->input->post('patient_id'), 
			'room_no'     	  => $this->input->post('room_no'), 
			'disease_details' => $disease_details, 
			'consultant_id'   => $this->input->post('consultant_id'), 
			'policy_name'     => $this->input->post('policy_name'), 
			'policy_no'       => $this->input->post('policy_no'), 
			'policy_holder_name'  => $this->input->post('policy_holder_name'), 
			'insurance_id'        => $this->input->post('insurance_id'), 
			'approval_breakup'    => $approval_breakup, 
			'total'               => $this->input->post('total'), 
			'date'                => date("Y-m-d"), 
			'status'              => $this->input->post('status'),
		);  
		#-------------------------------#
		if ($this->form_validation->run() === true) {

			#if empty $id then insert data
			if ($this->limit_approval_model->create($postData)) {
				$patient_id = $this->db->insert_id();
				#set success message
				$this->session->set_flashdata('message', display('save_successfully'));
			} else {
				#set exception message
				$this->session->set_flashdata('exception', display('please_try_again'));
			} 
			redirect('insurance/limit_approval/form');

		} else { 
			$data['consultant_list'] = $this->limit_approval_model->doctor_list();
			$data['insurance_list'] = $this->insurance_model->dropdown();
			$data['content'] = $this->load->view('insurance/limit_approval_form',$data,true);
			$data['count']    = $this->dashboard_model->getAlertCount(); 
			$this->load->view('layout/main_wrapper',$data);
		} 
	}

 
	public function update($id = null)
	{
		$data['title'] = display('add_limit_approval');
		#-------------------------------#
		$this->form_validation->set_rules('patient_id', display('patient_id'),'required|max_length[30]');
		$this->form_validation->set_rules('room_no', display('room_no'),'max_length[100]');
		$this->form_validation->set_rules('consultant_id', display('consultant_name'),'required|max_length[11]');
		$this->form_validation->set_rules('policy_name', display('policy_name'),'max_length[255]');
		$this->form_validation->set_rules('policy_no', display('policy_no'),'max_length[100]');
		$this->form_validation->set_rules('policy_holder_name', display('policy_holder_name'),'max_length[255]');
		$this->form_validation->set_rules('insurance_id', display('insurance_name'),'required|max_length[11]');
		$this->form_validation->set_rules('total', display('total'),'max_length[50]');
		$this->form_validation->set_rules('status', display('status'),'required'); 
		#-------------------------------#
		$DName   = $this->input->post('disease_name');
		$DCharge = $this->input->post('disease_details');
		$disease_details = array();
		for ($i=0; $i < sizeof($DName); $i++)
		{
			if(!empty($DName[$i]))
			$disease_details[$DName[$i]] = $DCharge[$i]; 
		} 
		$disease_details = json_encode($disease_details); 
		#-------------------------------#
		$BName   = $this->input->post('breakup_name');
		$BCharge = $this->input->post('breakup_charge');
		$approval_breakup = array();
		for ($i=0; $i < sizeof($BName); $i++)
		{
			if(!empty($BName[$i]))
			$approval_breakup[$BName[$i]] = $BCharge[$i]; 
		} 
		$approval_breakup = json_encode($approval_breakup);  
		#-------------------------------# 
		$data['approval'] = (object)$postData = array(
			'id'              => $this->input->post('id'), 
			'patient_id'      => $this->input->post('patient_id'), 
			'room_no'     	  => $this->input->post('room_no'), 
			'disease_details' => $disease_details, 
			'consultant_id'   => $this->input->post('consultant_id'), 
			'policy_name'     => $this->input->post('policy_name'), 
			'policy_no'       => $this->input->post('policy_no'), 
			'policy_holder_name'  => $this->input->post('policy_holder_name'), 
			'insurance_id'        => $this->input->post('insurance_id'), 
			'approval_breakup'    => $approval_breakup, 
			'total'               => $this->input->post('total'), 
			'date'                => date("Y-m-d"), 
			'status'              => $this->input->post('status'),
		);  
		#-------------------------------#
		if ($this->form_validation->run() === true) 
		{

			if ($this->limit_approval_model->update($postData)) {
				#set success message
				$this->session->set_flashdata('message', display('update_successfully'));
			} else {
				#set exception message
				$this->session->set_flashdata('exception', display('please_try_again'));
			}

			redirect('insurance/limit_approval/update/'.$id);

		} else { 
			$data['consultant_list'] = $this->limit_approval_model->doctor_list();
			$data['insurance_list']  = $this->insurance_model->dropdown();
			$data['approval']        = $this->limit_approval_model->read_by_id($id);
			$data['content'] = $this->load->view('insurance/limit_approval_update',$data,true);
			$data['count']    = $this->dashboard_model->getAlertCount(); 
			$this->load->view('layout/main_wrapper',$data);
		} 
	}


	public function view($id = null)
	{
		$data['title'] = display('limit_approval');
		#-------------------------------#  
		$data['approval'] = $this->limit_approval_model->read_by_id($id);
		$data['content'] = $this->load->view('insurance/limit_approval_view',$data,true);
		$data['count']    = $this->dashboard_model->getAlertCount(); 
		$this->load->view('layout/main_wrapper',$data);
	}



    public function delete($id = null) 
    {
        if ($this->limit_approval_model->delete($id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
		redirect('insurance/limit_approval');
    }


}
