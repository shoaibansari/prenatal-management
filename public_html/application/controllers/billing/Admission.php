<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admission extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'billing/admission_model' 
		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1) 
			redirect('login');
	}
 
	public function index()
	{ 
		$data['title'] = display('admission_list');
        #-------------------------------#
        #
        #pagination starts
        #
        $config["base_url"] = base_url('billing/admission/index');
        $config["total_rows"] = $this->db->count_all('bill_admission');
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
        $data['admissions'] = $this->admission_model->read($config["per_page"], $page);
        $data["links"] = $this->pagination->create_links();
        #
        #pagination ends
        #    
		$data['content'] = $this->load->view('billing/admission/list',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	} 



	public function form($admission_id = null)
	{ 
		$data['title'] = display('add_admission');
		#-------------------------------# 
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

		$this->form_validation->set_rules('doctor_id', display('doctor_name'),'required|max_length[11]');
		$this->form_validation->set_rules('admission_date', display('admission_date'),'required|max_length[15]');
		$this->form_validation->set_rules('discharge_date', display('discharge_date'),'max_length[15]');

		$this->form_validation->set_rules('package_id', display('package_name'),'max_length[11]');
		$this->form_validation->set_rules('insurance_id', display('insurance_name'),'max_length[11]');
		$this->form_validation->set_rules('policy_no', display('policy_no'),'max_length[100]');
		$this->form_validation->set_rules('agent_name', display('agent_name'),'max_length[255]');
		$this->form_validation->set_rules('guardian_name', display('guardian_name'),'max_length[255]');
		$this->form_validation->set_rules('guardian_relation', display('guardian_relation'),'max_length[255]');
		$this->form_validation->set_rules('guardian_contact', display('guardian_contact'),'max_length[255]');
		$this->form_validation->set_rules('guardian_address', display('guardian_address'),'max_length[255]');
		$this->form_validation->set_rules('status', display('status'),'required'); 
		#-------------------------------# 
		$admission_date = $this->input->post('admission_date');
		$admission_date = (!empty($admission_date)?date("Y-m-d", strtotime($admission_date)):null);
		$discharge_date = $this->input->post('discharge_date');
		$discharge_date = (!empty($discharge_date)?date("Y-m-d", strtotime($discharge_date)):null);
		#-------------------------------#  
		$data['admission'] = (object)$postData = array(
			'admission_id'    => 'U'.$this->randStrGen(2, 7), 
			'patient_id'      => $this->input->post('patient_id'), 
			'doctor_id'       => $this->input->post('doctor_id'), 
			'admission_date'  => $admission_date,  
			'discharge_date'  => $discharge_date,  
			'package_id'      => $this->input->post('package_id'),  
			'insurance_id'    => $this->input->post('insurance_id'), 
			'policy_no'       => $this->input->post('policy_no'),  
			'agent_name'      => $this->input->post('agent_name'),  
			'guardian_name'   => $this->input->post('guardian_name'), 
			'guardian_relation' => $this->input->post('guardian_relation'), 
			'guardian_contact'  => $this->input->post('guardian_contact'), 
			'guardian_address'  => $this->input->post('guardian_address'), 
			'status'          => $this->input->post('status'),
		); 
		#-------------------------------#  
		if ($this->form_validation->run() === true) {
			if ($this->admission_model->create($postData)) {
				#set success message
				$this->session->set_flashdata('message', display('save_successfully'));
			} else {
				#set exception message
				$this->session->set_flashdata('exception', display('please_try_again'));
			} 
			redirect('billing/admission/form/');
		} else {  
			$data['doctor_list'] = $this->admission_model->doctor_list();
			$data['package_list'] = $this->admission_model->package_list();
			$data['insurance_list'] = $this->admission_model->insurance_list();
			$data['content'] = $this->load->view('billing/admission/form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}


 

	public function edit($admission_id = null)
	{ 
		$data['title'] = display('edit_admission');
		#-------------------------------# 
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

		$this->form_validation->set_rules('doctor_id', display('doctor_name'),'required|max_length[11]');
		$this->form_validation->set_rules('admission_date', display('admission_date'),'required|max_length[15]');
		$this->form_validation->set_rules('discharge_date', display('discharge_date'),'max_length[15]');

		$this->form_validation->set_rules('package_id', display('package_name'),'max_length[11]');
		$this->form_validation->set_rules('insurance_id', display('insurance_name'),'max_length[11]');
		$this->form_validation->set_rules('policy_no', display('policy_no'),'max_length[100]');
		$this->form_validation->set_rules('agent_name', display('agent_name'),'max_length[255]');
		$this->form_validation->set_rules('guardian_name', display('guardian_name'),'max_length[255]');
		$this->form_validation->set_rules('guardian_relation', display('guardian_relation'),'max_length[255]');
		$this->form_validation->set_rules('guardian_contact', display('guardian_contact'),'max_length[255]');
		$this->form_validation->set_rules('guardian_address', display('guardian_address'),'max_length[255]');
		$this->form_validation->set_rules('status', display('status'),'required'); 
		#-------------------------------# 
		$admission_date = $this->input->post('admission_date');
		$admission_date = (!empty($admission_date)?date("Y-m-d", strtotime($admission_date)):null);
		$discharge_date = $this->input->post('discharge_date');
		$discharge_date = (!empty($discharge_date)?date("Y-m-d", strtotime($discharge_date)):null);
		#-------------------------------#  
		$data['admission'] = (object)$postData = array(
			'admission_id'    => $admission_id, 
			'patient_id'      => $this->input->post('patient_id'), 
			'doctor_id'       => $this->input->post('doctor_id'), 
			'admission_date'  => $admission_date,  
			'discharge_date'  => $discharge_date,  
			'package_id'      => $this->input->post('package_id'),  
			'insurance_id'    => $this->input->post('insurance_id'), 
			'policy_no'       => $this->input->post('policy_no'),  
			'agent_name'      => $this->input->post('agent_name'),  
			'guardian_name'   => $this->input->post('guardian_name'), 
			'guardian_relation' => $this->input->post('guardian_relation'), 
			'guardian_contact'  => $this->input->post('guardian_contact'), 
			'guardian_address'  => $this->input->post('guardian_address'), 
			'status'          => $this->input->post('status'),
		); 
		#-------------------------------#  
		if ($this->form_validation->run() === true) {

			if ($this->admission_model->update($postData)) {
				#set success message
				$this->session->set_flashdata('message', display('update_successfully'));
			} else {
				#set exception message
				$this->session->set_flashdata('exception', display('please_try_again'));
			} 
			redirect('billing/admission/form/'.$admission_id);

		} else {  
			$data['admission'] = $this->admission_model->read_by_id($admission_id);
			$data['doctor_list'] = $this->admission_model->doctor_list();
			$data['package_list'] = $this->admission_model->package_list();
			$data['insurance_list'] = $this->admission_model->insurance_list();
			$data['content'] = $this->load->view('billing/admission/edit',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}


 


	public function view($id = null)
	{
		$data['title'] = display('admission');
		#-------------------------------#  
		$data['admission'] = $this->admission_model->read_by_id($id);
		$data['content'] = $this->load->view('admission/admission_view',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}



    public function delete($id = null) 
    {
        if ($this->admission_model->delete($id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
		redirect('billing/admission/index');
    }




    /*
    |----------------------------------------------
    |        id genaretor
    |----------------------------------------------     
    */
    public function randStrGen($mode = null, $len = null)
    {
        $result = "";
        if($mode == 1):
            $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        elseif($mode == 2):
            $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        elseif($mode == 3):
            $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        elseif($mode == 4):
            $chars = "0123456789";
        endif;

        $charArray = str_split($chars);
        for($i = 0; $i < $len; $i++) {
                $randItem = array_rand($charArray);
                $result .="".$charArray[$randItem];
        }
        return $result;
    }
    /*
    |----------------------------------------------
    |         Ends of id genaretor
    |----------------------------------------------
    */


}
