<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Operation extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        
        $this->load->model(array(
            'dashboard_doctor/hospital_activities/operation_model',
            'doctor_model',
            'dashboard_model'
        ));
        
        if ($this->session->userdata('isLogIn') == false 
            || $this->session->userdata('user_role') != 2
        ) 
        redirect('login'); 

    }
 
    public function index()
    {
        $data['title'] = display('operation_report');
        #-------------------------------#
        $data['operations'] = $this->operation_model->read();
        $data['content'] = $this->load->view('dashboard_doctor/hospital_activities/operation_view',$data,true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 

        $this->load->view('dashboard_doctor/main_wrapper',$data);
    } 

    public function form($id = null)
    { 
        /*----------FORM VALIDATION RULES----------*/
        $this->form_validation->set_rules('patient_id', display('patient_id') ,'required|max_length[20]');
        $this->form_validation->set_rules('date', display('date') ,'required|max_length[10]');
        $this->form_validation->set_rules('title', display('title') ,'required|max_length[255]');
        $this->form_validation->set_rules('description', display('description'),'trim');
        $this->form_validation->set_rules('doctor_id', display('doctor_name') ,'max_length[100]');
        $this->form_validation->set_rules('status', display('status') ,'required');

        /*-------------STORE DATA------------*/
        $date = $this->input->post('date');

        $data['operation'] = (object)$postData = array( 
            'id'          => $this->input->post('id'),
            'patient_id'  => $this->input->post('patient_id'),
            'date'        => date('Y-m-d', strtotime((!empty($date) ? $date : date('Y-m-d')))),
            'title'       => $this->input->post('title'),
            'description' => $this->input->post('description',false),
            'doctor_id'   => $this->session->userdata('user_id'),
            'status'      => $this->input->post('status')
        );  

        /*-----------CHECK ID -----------*/
        if (empty($id)) {
            /*-----------CREATE A NEW RECORD-----------*/
            if ($this->form_validation->run() === true) { 
                if ($this->operation_model->create($postData)) {
                    #set success message
                    $this->session->set_flashdata('message', display('save_successfully'));
                } else {
                    #set exception message
                    $this->session->set_flashdata('exception',display('please_try_again'));
                }
                redirect('dashboard_doctor/hospital_activities/operation/form');
            } else {
                $data['title'] = display('add_operation_report');
                $data['doctor_list'] = $this->doctor_model->doctor_list();
                $data['content'] = $this->load->view('dashboard_doctor/hospital_activities/operation_form',$data,true);
                $data['count']    = $this->dashboard_model->getAlertCount(); 

                $this->load->view('dashboard_doctor/main_wrapper',$data);
            } 

        } else { 
            /*-----------UPDATE A RECORD-----------*/
            if ($this->form_validation->run() === true) { 
                if ($this->operation_model->update($postData)) {
                    #set success message
                    $this->session->set_flashdata('message', display('update_successfully'));
                } else {
                    #set exception message
                    $this->session->set_flashdata('exception',display('please_try_again'));
                }
                redirect('dashboard_doctor/hospital_activities/operation/form/'.$postData['id']);
            } else {
                $data['title'] = display('operation_report_edit');
                $data['operation'] = $this->operation_model->read_by_id($id);
                $data['doctor_list'] = $this->doctor_model->doctor_list();
                $data['content'] = $this->load->view('dashboard_doctor/hospital_activities/operation_form',$data,true);
                $data['count']    = $this->dashboard_model->getAlertCount(); 

                $this->load->view('dashboard_doctor/main_wrapper',$data);
            } 
        } 
        /*---------------------------------*/
    }
 

    public function details($id = null)
    {
        $data['title'] = display('operation_report');
        #-------------------------------#
        $data['details'] = $this->operation_model->read_by_id($id);
        $data['content'] = $this->load->view('dashboard_doctor/hospital_activities/details', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        
        $this->load->view('dashboard_doctor/main_wrapper',$data);
    } 
  
}
