<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Emergency_alert extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'doctor_model',
			'dashboard_model',
			'familyPlanning_model',
			'Emergency_Alert_Model'

		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1 and $this->session->userdata('user_role') != 8 and $this->session->userdata('user_role') != 7 and $this->session->userdata('user_role') != 2 and $this->session->userdata('user_role') != 11 and $this->session->userdata('user_role') != 5)
		redirect('login'); 	
	}

 
	public function index()
	{  
		$data['title'] = display('alert');
		$data['audio_lists'] = $this->Emergency_Alert_Model->read();
		$data['content'] = $this->load->view('emergency_alert',$data,true);
		$data['count']    = $this->dashboard_model->getAlertCount();
		$this->load->view('layout/main_wrapper',$data);
	} 


public function create()
	{	
		$data['title'] = display('alert');
		$data['language'] = $this->familyPlanning_model->getLanguage();



		#-------------------------------#
		$this->form_validation->set_rules('name', display('name') ,'required|max_length[100]');
		$this->form_validation->set_rules('description', display('description'),'trim');
		$this->form_validation->set_rules('language', display('language') ,'required');
		//$this->form_validation->set_rules('picture', 'Audio' ,'required');
		#-------------------------------#
		$audio = $this->fileupload->do_upload(
            'assets/audio',
            'picture',
            true
        );

         $audio = str_replace("assets/audio","",$audio);
  			
		$data['family_planning'] = (object)$postData = [
			'id' 	  => $this->input->post('user_id',true),
			'name' 		  => $this->input->post('name',true),
			'description' => $this->input->post('description',true),
			'language' => $this->input->post('language',true),
			'status' => $this->input->post('status',true),
			//'file_name'      => $audio
			'file_name'      => (!empty($audio)?$audio:$this->input->post('old_picture')),
		]; 

		#-------------------------------#
		if ($this->form_validation->run() === true) {

			#if empty $id then insert data
			if (empty($postData['id'])) {
				if ($this->familyPlanning_model->create($postData)) {
					#set success message
					$this->session->set_flashdata('message', display('save_successfully'));
				} else {
					#set exception message
					$this->session->set_flashdata('exception',display('please_try_again'));
				}
				redirect('family_planning');
			} else { 

				if ($this->familyPlanning_model->update($postData)) {
					#set success message
					$this->session->set_flashdata('message', display('update_successfully'));
				} else {
					#set exception message
					$this->session->set_flashdata('exception',display('please_try_again'));
				}
				redirect('family_planning/edit/'.$postData['id']);
			}

		} else {
			$data['content'] = $this->load->view('family_planning_form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}
 

	/*public function profile($user_id = null)
	{ 		 
		$data['title'] = display('doctor_profile');
		#-------------------------------#
		$data['user'] = $this->doctor_model->read_by_id($user_id);
		$data['content'] = $this->load->view('doctor_profile',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}*/

	public function markedAsRead($user_id = null){

		$data['alert'] = $this->Emergency_Alert_Model->markedAsRead($user_id);
		redirect('Emergency_alert');
	}
	

/*
	public function edit($user_id = null) 
	{
		
		$user_role = $this->session->userdata('user_role');
		if ($user_role == 1 && $this->session->userdata('user_id') == $user_id)
			$data['title'] = display('edit_profile');  
		elseif ($user_role == 2)
			$data['title'] = display('edit_profile');  
		else
			$data['title'] = display('edit_doctor');  
		#-------------------------------#
		//$data['department_list'] = $this->department_model->department_list(); 
		//$data['doctor'] = $this->doctor_model->read_by_id($user_id);
		$data['alerts'] = $this->Emergency_Alert_Model->read_by_id($user_id);
		$data['type'] = $this->Emergency_Alert_Model->getAlert();

		
		#-------------------------------#
		//if (($data['doctor']->user_id != $this->session->userdata('user_id'))
		//&& $this->session->userdata('user_role') != 1)
			//redirect('login');
		#-------------------------------#
		$data['content'] = $this->load->view('emergency_alert_form',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}*/
 

	public function delete($id = null) 
	{ 
		if ($this->Emergency_Alert_Model->delete($id)) {
			#set success message
			$this->session->set_flashdata('message',display('delete_successfully'));
		} else {
			#set exception message
			$this->session->set_flashdata('exception',display('please_try_again'));
		}
		redirect('Emergency_Alert_Model');
	}

}
