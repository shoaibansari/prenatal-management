<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class family_planning extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'doctor_model',
			'department_model',
			'familyPlanning_model'

		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1)
		redirect('login'); 	
	}

 
	public function index()
	{  
		$data['title'] = display('audio_messages');
		$data['doctors'] = $this->doctor_model->read();
		$data['audio_lists'] = $this->familyPlanning_model->read();
		$data['language'] = $this->familyPlanning_model->getLanguage();
		$data['content'] = $this->load->view('family_planning',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	} 


public function create()
	{	
		$data['title'] = display('add_audio');
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
 

	public function profile($user_id = null)
	{ 		 
		$data['title'] = display('doctor_profile');
		#-------------------------------#
		$data['user'] = $this->doctor_model->read_by_id($user_id);
		$data['content'] = $this->load->view('doctor_profile',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}


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
		$data['audio_list'] = $this->familyPlanning_model->read_by_id($user_id);
		$data['language'] = $this->familyPlanning_model->getLanguage();
		
		#-------------------------------#
		//if (($data['doctor']->user_id != $this->session->userdata('user_id'))
		//&& $this->session->userdata('user_role') != 1)
			//redirect('login');
		#-------------------------------#
		$data['content'] = $this->load->view('family_planning_form',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}
 

	public function delete($user_id = null) 
	{ 
		if ($this->familyPlanning_model->delete($user_id)) {
			#set success message
			$this->session->set_flashdata('message',display('delete_successfully'));
		} else {
			#set exception message
			$this->session->set_flashdata('exception',display('please_try_again'));
		}
		redirect('family_planning');
	}

}
