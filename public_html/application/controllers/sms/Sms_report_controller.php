<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sms_report_controller extends CI_Controller {

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
	    $this->load->model(array(
                    'sms/sms_report_model',
                    'dashboard_model'
                ));	
    }

    /*
    |--------------------------------------
    |   CUSTOM SMS
    |--------------------------------------
    */
    public function custom_sms_list() 
    { 
        $data['title'] = display('custom_sms_list');
        $start_date = $this->input->get('start_date');
        $end_date = $this->input->get('end_date');
        $data['search'] = (object)$getData = array(
            'start_date' => date('Y-m-d', strtotime((!empty($start_date)?$start_date:date('Y-m-d')))),
            'end_date' => date('Y-m-d', strtotime((!empty($end_date)?$end_date:date('Y-m-d'))))
        );
        #
        #pagination starts
        #
        $config["base_url"] = base_url('sms/sms_report_controller/custom_sms_list');
        $config['suffix'] = '?'.http_build_query($_GET, '', "&"); 
        $config['first_url'] = $config['base_url'].$config['suffix'];
        $config["total_rows"] = $this->sms_report_model->customSmsCount($getData['start_date'], $getData['end_date']);
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
        $data['custom_sms'] = $this->sms_report_model->customSmsList($config["per_page"], $page, $getData['start_date'], $getData['end_date']);
        $data["links"] = $this->pagination->create_links();

        $data['content'] = $this->load->view('sms/view_custom_sms_list', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        $this->load->view('layout/main_wrapper',$data);
    }

    /*
    |--------------------------------------
    |   SCHEDULE/AUTO SMS
    |--------------------------------------
    */
    public function auto_sms_list()
    {
        $data['title'] = display('auto_sms_report');
        $start_date = $this->input->get('start_date');
        $end_date = $this->input->get('end_date');
        $data['search'] = (object)$getData = array(
            'start_date' => date('Y-m-d', strtotime((!empty($start_date)?$start_date:date('Y-m-d')))),
            'end_date' => date('Y-m-d', strtotime((!empty($end_date)?$end_date:date('Y-m-d'))))
        );
        #
        #pagination starts
        #
        $config["base_url"] = base_url('sms/sms_report_controller/auto_sms_list');
        $config['suffix'] = '?'.http_build_query($_GET, '', "&"); 
        $config['first_url'] = $config['base_url'].$config['suffix'];
        $config["total_rows"] = $this->sms_report_model->autoSmsCount($getData['start_date'], $getData['end_date']);
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
        $data['auto_sms'] = $this->sms_report_model->autoSmsList($config["per_page"], $page, $getData['start_date'], $getData['end_date']);
        $data["links"] = $this->pagination->create_links();

        $data['content'] = $this->load->view('sms/view_auto_sms_list', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        $this->load->view('layout/main_wrapper',$data); 
    }



    #--------------------------------------
    # User SMS Report
    #--------------------------------------
    public function user_sms_list()
    {
        $data['title'] = display('user_sms_list');
        $start_date = $this->input->get('start_date');
        $end_date = $this->input->get('end_date');
        $data['search'] = (object)$getData = array(
            'start_date' => date('Y-m-d', strtotime((!empty($start_date)?$start_date:date('Y-m-d')))),
            'end_date'   => date('Y-m-d', strtotime((!empty($end_date)?$end_date:date('Y-m-d'))))
        );
        #
        #pagination starts
        #
        $config["base_url"] = base_url('sms/sms_report_controller/user_sms_list');
        $config['suffix'] = '?'.http_build_query($_GET, '', "&"); 
        $config['first_url'] = $config['base_url'].$config['suffix'];
        $config["total_rows"] = $this->sms_report_model->userSmsCount($getData['start_date'], $getData['end_date']);
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
        $data['users_sms'] = $this->sms_report_model->userSmsList($config["per_page"], $page, $getData['start_date'], $getData['end_date']);
        $data["links"] = $this->pagination->create_links();

        $data['content'] = $this->load->view('sms/view_user_sms_list', $data, true);
        $data['count']    = $this->dashboard_model->getAlertCount(); 
        $this->load->view('layout/main_wrapper',$data); 
    } 
}



