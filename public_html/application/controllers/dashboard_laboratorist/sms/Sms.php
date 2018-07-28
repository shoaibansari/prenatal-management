<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sms extends CI_Controller {

    /*
    |--------------------------------------
    |   constructor function
    |--------------------------------------
    */ 
	public function __construct() 
	{
        parent::__construct();
        if (!$this->session->userdata('isLogIn')
            || $this->session->userdata('user_role') != 4) 
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


	    $this->load->model('dashboard_laboratorist/sms/sms_model');	
    }
 
    #--------------------------------------
    # Form
    #--------------------------------------
    public function new_sms()
    {
        $data['title'] = display('send_sms'); 
        $data['content'] = $this->load->view('dashboard_laboratorist/sms/form', $data, true);
        $this->load->view('dashboard_laboratorist/main_wrapper',$data);
    }

    #--------------------------------------
    # Send SMS
    #--------------------------------------
    public function send()
    { 
        $this->load->library('smsgateway');
 
        $gateway = $this->sms_model->gateway();
        // sent to gateway
        $this->smsgateway->send([
            'apiProvider' => $gateway->provider_name,
            'username'    => $gateway->user,
            'password'    => $gateway->password,
            'from'        => $gateway->authentication,
            'to'          => $this->input->post('receiver'),
            'message'     => $this->input->post('message')
        ]);
 
        // save sms
        $this->sms_model->save(array(
            'user_id'  => $this->session->userdata('user_id'),
            'receiver' => $this->input->post('receiver'),
            'message'  => $this->input->post('message'),
            'date'     => date("Y-m-d h:i:s")
        ));  
        $this->session->set_flashdata('message', display('sms_sent'));
        redirect('dashboard_laboratorist/sms/sms/new_sms');
    }  


    #--------------------------------------
    # List
    #-------------------------------------- 
    public function sms_list() 
    { 
        $data['title'] = display('sms_list');
        #-------------------------------------- 
        $user_id    = $this->session->userdata('user_id');
        $start_date = $this->input->get('start_date');
        $end_date   = $this->input->get('end_date');
        $data['search'] = (object)$getData = array(
            'start_date' => date('Y-m-d', strtotime((!empty($start_date)?$start_date:date('Y-m-d')))),
            'end_date' => date('Y-m-d', strtotime((!empty($end_date)?$end_date:date('Y-m-d'))))
        );
        #-------------------------------------- 
        #
        #pagination starts
        #
        $config["base_url"] = base_url('dashboard_laboratorist/sms/sms/sms_list');
        $config['suffix'] = '?'.http_build_query($_GET, '', "&"); 
        $config['first_url'] = $config['base_url'].$config['suffix'];
        $config["total_rows"] = $this->sms_model->sms_count($getData['start_date'], $getData['end_date'], $user_id);
        $config["per_page"] = 10;
        $config["uri_segment"] = 4; 
        $config["num_links"]   =  10;
        $config["last_link"] = "Last"; 
        $config["first_link"] = "First"; 
        $config['next_link'] = 'Next';
        $config['prev_link'] = 'Prev'; 
        $config['full_tag_open'] = "<ul class='pagination pagination-xs'>";
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
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
        #
        #pagination ends
        #      
        $data['users_sms'] = $this->sms_model->sms_list($config["per_page"], $page, $getData['start_date'], $getData['end_date'], $user_id);
        $data["links"] = $this->pagination->create_links();

        $data['content'] = $this->load->view('dashboard_laboratorist/sms/list', $data, true);
        $this->load->view('dashboard_laboratorist/main_wrapper',$data);
    } 
}

