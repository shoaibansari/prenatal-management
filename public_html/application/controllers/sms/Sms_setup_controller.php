<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sms_setup_controller extends CI_Controller {

    /*
    |--------------------------------------
    |   constructor function
    |--------------------------------------
    */ 
	public function __construct() 
	{
        parent::__construct();
        if (!$this->session->userdata('isLogIn')
            || $this->session->userdata('user_role') != 1) 
            redirect('login');

        try { 
            $result = $this->db->select('time_zone')->from('setting')->get()->row();
            if(empty($result)) {
                throw new Exception('Time zone is not set in application setting!');
            } 
            @date_default_timezone_set($result->time_zone); 
        } catch (Exception $e) {
            echo 'Exception: ',  $e->getMessage(), "\n";
        }  
        
         
        $this->load->library('Smsgateway');
		$session_id = $this->session->userdata('session_id');   
	    $this->load->model( array(
            'sms/sms_setup_model',
            'dashboard_model'
        ));	

    }

    /*
    |--------------------------------------
    |   View sms setup
    |--------------------------------------
    */
    public function sms_gateway() 
    {
        $data['title'] = display('gateway_setting');

        #--------------------------------------
        if ($this->db->count_all('sms_setting') == 0) {
            $this->db->insert('sms_setting', array( 
            'appointment'  => 1,
            'registration' => 1,
            'schedule'     => 1,
            ));
        }
        $data['sms_setting']  = $this->db->select("*")->from('sms_setting')->get()->row();
        #--------------------------------------

        $data['gateway_list'] = $this->sms_setup_model->sms_gateway_list();
        $data['content'] = $this->load->view('sms/view_sms_gateway', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        $this->load->view('layout/main_wrapper',$data);
    }

    /*
    |--------------------------------------
    |   sms setting
    |--------------------------------------
    */
    public function sms_setting(){  
        $this->db->where('id', $this->input->post('id'))->update('sms_setting', array( 
          'appointment'  => (($this->input->post('appointment'))?1:0),
          'registration' => (($this->input->post('registration'))?1:0),
          'schedule'     => (($this->input->post('schedule'))?1:0),
        )); 

        $this->session->set_flashdata('message', display('update_successfully'));
        redirect("sms/sms_setup_controller/sms_gateway");
    }    

    /*
    |--------------------------------------
    |   sms save_gateway
    |--------------------------------------
    */
    public function save_gateway(){ 
        $data = array(
          'user'=> $this->input->post('user'),
          'password'=> $this->input->post('password'),
          'authentication'=> $this->input->post('authentication'),
          'default_status'=> 1
        );
        $this->db->where('gateway_id', $this->input->post('id'))
            ->update('sms_gateway',$data);

        $this->db->set('default_status',0)
            ->where('gateway_id !=', $this->input->post('id'))
            ->update('sms_gateway');


        $this->session->set_flashdata('message', display('update_successfully'));
        redirect("sms/sms_setup_controller/sms_gateway");
    }   


    /*
    |--------------------------------------
    |   sms sms_template
    |--------------------------------------
    */
    public function sms_template(){
        $data['teamplate'] = $this->sms_setup_model->teamplate_list();
        $data['title'] = display('sms_template'); 
        $data['content'] = $this->load->view('sms/view_sms_template', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        $this->load->view('layout/main_wrapper',$data);
    }

    /*
    |--------------------------------------
    |    save_sms_template
    |--------------------------------------
    */
    public function save_sms_template(){ 
        $this->db->insert('sms_teamplate', array(
          'teamplate_name' => trim($this->input->post('teamplate_name')),
          'type'           => trim($this->input->post('type')),
          'teamplate'      => trim($this->input->post('teamplate'))
        ));
        $this->session->set_flashdata('message', display('save_successfully'));
        redirect('sms/sms_setup_controller/sms_template');
    }

    #--------------------------------------
    public function template_edit()
    { 
        $this->db->where('teamplate_id', $this->input->post('id'))
            ->update('sms_teamplate', array(
              'teamplate_name' => $this->input->post('teamplate_name'),
                'type'           => $this->input->post('type'),
              'teamplate' => $this->input->post('teamplate')
            ));

        $this->session->set_flashdata('message', display('update_successfully'));
        redirect('sms/sms_setup_controller/sms_template');
    }


    #-------------------------------------
    public function set_default_template($id=null, $status = null){
        $this->db->set('default_status', (($status == 1) ? 0 : 1))
            ->where('teamplate_id', $id)
            ->update('sms_teamplate');
        $this->session->set_flashdata('message', display('update_successfully'));
        redirect('sms/sms_setup_controller/sms_template');
    }

    #--------------------------------------  
    public function delete_teamplate($id){
        $this->db->where('teamplate_id',$id)->delete('sms_teamplate');
        $this->session->set_flashdata('message', display('delete_successfully'));
        redirect('sms/sms_setup_controller/sms_template');
    }

    /*
    |--------------------------------------
    |   sms_scheduler
    |--------------------------------------
    */
    public function sms_scheduler(){
        $data['teamplate'] = $this->sms_setup_model->teamplate_list();
        $data['schedule'] = $this->sms_setup_model->sms_schedule_list();
        $data['title'] = display('sms_schedule'); 
        $data['content'] = $this->load->view('sms/view_sms_scheduler', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        $this->load->view('layout/main_wrapper',$data);
    }

    /*
    |--------------------------------------
    |    save_sms_scheduler
    |--------------------------------------
    */
    public function save_sms_scheduler(){
        $day = $this->input->post('day');
        $hour = $this->input->post('hour');
        $minute = $this->input->post('minute');
        $schedule = $day.':'.$hour.':'.$minute;
        $check_exist = $this->db->select('ss_schedule')->from('sms_schedule')->where('ss_schedule',$schedule)->get()->row();
        if($check_exist){
            $this->session->set_flashdata('exception', display('already_exists'));
            redirect('sms/sms_setup_controller/sms_scheduler');
        } else {
            $data = array(
                'ss_teamplate_id' => $this->input->post('teamplate_id'),
                'ss_name' => $this->input->post('schedule_name'),
                'ss_schedule' => $schedule
            );

            $this->db->insert('sms_schedule',$data);
            $this->session->set_flashdata('message', display('save_successfully'));
            redirect('sms/sms_setup_controller/sms_scheduler');
        }
    }   

    #---------------------------------------
    // delete schedule
    public function delete_schedule($id){
        $this->db->where('ss_id',$id)->delete('sms_schedule');
        $this->session->set_flashdata('message', display('delete_successfully'));
        redirect('sms/sms_setup_controller/sms_scheduler');
    } 



    #--------------------------------------
    public function custom_sms(){
        //gate gateway_information
        $data['gateway_list'] = $this->db->select('*')->from('sms_gateway')->where('default_status',1)->get()->result();
        $data['title'] = display('send_custom_sms'); 
        $data['content'] = $this->load->view('sms/view_custom_sms', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        $this->load->view('layout/main_wrapper',$data);
    }



    #--------------------------------------
    // Send coustorm sms
    #--------------------------------------
    public function send_custom_sms()
    {
        $gateway_id = $this->input->post('gateway');
        $to         = $this->input->post('to');
        $teamplate  = $this->input->post('teamplate');
        $sms_gateway_info = $this->sms_setup_model->sms_gateway_by_id($gateway_id);

        // sent to gateway
        $this->smsgateway->send([
            'apiProvider' => $sms_gateway_info->provider_name,
            'username'    => $sms_gateway_info->user,
            'password'    => $sms_gateway_info->password,
            'from'        => $sms_gateway_info->authentication,
            'to'          => $to,
            'message'     => $teamplate
        ]);

        // save delivary data
        $data = array(
            'gateway' => $sms_gateway_info->provider_name,
            'reciver'          => $to,
            'message'          => $teamplate ,
            'sms_date_time'    => date("Y-m-d h:i:s")
        );
        $this->sms_setup_model->save_custom_dalivery($data);
        $this->session->set_flashdata('message', display('sms_sent').' '.$to);
        redirect('sms/sms_setup_controller/custom_sms');
    }  
}