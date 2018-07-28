<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notice extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'dashboard_accountant/noticeboard/notice_model'
		));
 
		
		if ($this->session->userdata('isLogIn') == false 
			|| $this->session->userdata('user_role') != 3
		) 
		redirect('login'); 
	}
 
	public function index()
	{  
		$data['title'] = display('notice_list');  ;
		$data['notices'] = $this->notice_model->read();
		$data['content'] = $this->load->view('dashboard_accountant/noticeboard/view',$data,true);
		$this->load->view('dashboard_accountant/main_wrapper',$data);
	} 
 

	public function details($notice_id = null)
	{   
		$data['title'] = display('noticeboard');
		#-------------------------------#
		$data['notice'] = $this->notice_model->read_by_id($notice_id);
		$data['content'] = $this->load->view('dashboard_accountant/noticeboard/details',$data,true);
		$this->load->view('dashboard_accountant/main_wrapper',$data);
	} 

}
