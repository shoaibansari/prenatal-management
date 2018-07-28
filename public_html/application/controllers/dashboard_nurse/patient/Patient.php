<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Patient extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'dashboard_nurse/patient/patient_model',
			'dashboard_nurse/patient/document_model',
			'doctor_model',
			'dashboard_model'
		));
 
		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 5) 
			redirect('login'); 
		
	}
 
	public function index()
	{  
		$data['title'] = display('patient_list');
		$data['patients'] = $this->patient_model->read($this->session->userdata('user_id'));
		$data['patients_detail'] = $this->patient_model->readAllPatientDetail();
		$data['content'] = $this->load->view('dashboard_nurse/patient/patient',$data,true);
		$data['count']    = $this->dashboard_model->getAlertCount(); 
		$this->load->view('dashboard_nurse/main_wrapper',$data);
	}

    public function email_check($email, $id)
    {
        $emailExists = $this->db->select('email')
            ->where('email',$email) 
            ->where_not_in('id',$id) 
            ->get('patient')
            ->num_rows();

        if ($emailExists > 0) {
            $this->form_validation->set_message('email_check', 'The {field} field must contain a unique value.');
            return false;
        } else {
            return true;
        }
    } 

	public function create()
	{
		$data['title'] = display('add_patient');
        $id = $this->input->post('id');
		#-------------------------------#
		$this->form_validation->set_rules('firstname', display('first_name'),'required|max_length[50]');
		$this->form_validation->set_rules('middlename', 'Middle Name','required|max_length[50]');
		$this->form_validation->set_rules('lastname', display('last_name'),'required|max_length[50]');
		if ($this->input->post('id') == null) {
			$this->form_validation->set_rules('email', display('email'),'required|max_length[100]|is_unique[patient.email]|valid_email');
		} else {        
			$this->form_validation->set_rules('email',display('email'), "required|max_length[50]|valid_email|callback_email_check[$id]");
		}
		$this->form_validation->set_rules('password', display('password'),'required|max_length[32]');
		$this->form_validation->set_rules('date_of_birth', display('date_of_birth'),'required|max_length[10]');
		$this->form_validation->set_rules('name_of_village', 'Name of Village','required|max_length[20]');
		$this->form_validation->set_rules('quarter', 'Quarter','required|max_length[10]');
		$this->form_validation->set_rules('phone', display('phone'),'required|max_length[13]');
		$this->form_validation->set_rules('income', 'Income Per Month','required');
		$this->form_validation->set_rules('education', 'Education level','required');
		$this->form_validation->set_rules('employment_status', 'Employment Status','required');
		$this->form_validation->set_rules('occupation', 'Occupation','required|max_length[50]');
		$this->form_validation->set_rules('marital_status', 'Marital Status','required');
		$this->form_validation->set_rules('language', 'Language','required');
		$this->form_validation->set_rules('religion', 'Religion','required');
		$this->form_validation->set_rules('sex', display('sex'),'required');
		$this->form_validation->set_rules('residence', 'Place of residence','required');
		$this->form_validation->set_rules('antenatal_visits', 'Antenatal visits number','required');
		$this->form_validation->set_rules('place_visits', 'Place of antenatal visit','required|max_length[300]');
		$this->form_validation->set_rules('delivery', 'Delivery','required');
		$this->form_validation->set_rules('head_of_household', 'Head of Household','required');
		$this->form_validation->set_rules('alive', 'Alive','required');
		$this->form_validation->set_rules('dead', 'Dead','required');
		$this->form_validation->set_rules('total_pregnancies', 'Number of Pregnancies','required');
		$this->form_validation->set_rules('medical_history', 'Medical History','required|max_length[300]');
		$this->form_validation->set_rules('history_of_diabetes', 'History of Diabetes','required|max_length[300]');
		$this->form_validation->set_rules('history_of_hypertension', 'History of Hypertension','required|max_length[300]');
		$this->form_validation->set_rules('examination', 'Examination','required|max_length[300]');
		$this->form_validation->set_rules('echography', 'Echography','required|max_length[300]');
		$this->form_validation->set_rules('foetal_movements', 'Foetal movements','required');
		$this->form_validation->set_rules('foetal_presentation', 'Feotal Presentation','required');
		$this->form_validation->set_rules('drug_history', 'Drug History','required|max_length[300]');
		$this->form_validation->set_rules('antenatal_history', 'Antenatal History','required|max_length[300]');
		$this->form_validation->set_rules('hiv_screening_test', 'HIV/screening/test','required|max_length[300]');
		$this->form_validation->set_rules('on_arv_anti_retrovirial', 'On ARV (Anti Retrovirial)','required|max_length[300]');
		$this->form_validation->set_rules('malaria_screening_test', 'Malaria/screening/test','required|max_length[300]');
		$this->form_validation->set_rules('hepatitis_b_screening_test', 'Hepatitis B/screening/test','required|max_length[300]');
		$this->form_validation->set_rules('physical_exams', 'Physical Exams','required|max_length[300]');
		$this->form_validation->set_rules('treatments', 'Treatments','required|max_length[300]');
		$this->form_validation->set_rules('pih_anaemia_screening', 'PIH and Anaemia Screening','required|max_length[300]');
		$this->form_validation->set_rules('advise_counsel', 'Advise/Counsel','required|max_length[300]');
		$this->form_validation->set_rules('preventive_measures', 'Preventive Measures','required|max_length[300]');
		$this->form_validation->set_rules('adherence_to_treatment', 'Adherence to Treatment (HIV, malaria)','required|max_length[300]');
		$this->form_validation->set_rules('bleeding_during_pregnancy', 'Bleeding during Pregnancy','required|max_length[300]');
		$this->form_validation->set_rules('vaccination_status', 'Vaccination Status','required|max_length[300]');
		#-------------------------------#
		//picture upload
		// $picture = $this->fileupload->do_upload(
		// 	'assets/images/patient/',
		// 	'picture'
		// );
		// // if picture is uploaded then resize the picture
		// if ($picture !== false && $picture != null) {
		// 	$this->fileupload->do_resize(
		// 		$picture, 293, 350
		// 	);
		// }
		// //if picture is not uploaded
		// if ($picture === false) {
		// 	$this->session->set_flashdata('exception', display('invalid_picture'));
		// }  
		#-------------------------------#
		if ($this->input->post('id') == null) { //create a patient
			$data['patient'] = (object)$postData = [
				'id'   		   => $this->input->post('id'),
				'patient_id'   => "P".$this->tokenGenerator(2,7),
				'firstname'    => $this->input->post('firstname'),
				'middlename'   => $this->input->post('middlename'),
				'lastname' 	   => $this->input->post('lastname'),
				'email' 	   => $this->input->post('email'),
				'password' 	   => md5($this->input->post('password')),
				'date_of_birth' => date('Y-m-d', strtotime($this->input->post('date_of_birth'))),
				'phone'   	   => $this->input->post('phone'),
				'sex' 		   => $this->input->post('sex'),
				'create_date'  => date('Y-m-d'),
				'created_by'   => $this->session->userdata('user_id'),
				'status'       => 1,
				'patient_detail' => (object)$patient_detail = [
					'quarter' 	=> $this->input->post('quarter'),
					'name_of_village' 	=> $this->input->post('name_of_village'),
					'income'   	   => $this->input->post('income'),
					'education'    => $this->input->post('education'),
					'employment_status' => $this->input->post('employment_status'),
					'occupation' => $this->input->post('occupation'),
					'marital_status' => $this->input->post('marital_status'),
					'language' => $this->input->post('language'),
					'religion' => $this->input->post('religion'),
					'residence' => $this->input->post('residence'),
					'antenatal_visits' => $this->input->post('antenatal_visits'),
					'place_visits' => $this->input->post('place_visits'),
					'delivery' => $this->input->post('delivery'),
					'head_of_household' => $this->input->post('head_of_household'),
					'alive' => $this->input->post('alive'),
					'dead' => $this->input->post('dead'),
					'total_pregnancies' => $this->input->post('total_pregnancies'),
					'medical_history' => $this->input->post('medical_history'),
					'history_of_diabetes' => $this->input->post('history_of_diabetes'),
					'history_of_hypertension' => $this->input->post('history_of_hypertension'),
					'examination' => $this->input->post('examination'),
					'echography' => $this->input->post('echography'),
					'foetal_movements' => $this->input->post('foetal_movements'),
					'foetal_presentation' => $this->input->post('foetal_presentation'),
					'foetal_presentation_detail' => $this->input->post('foetal_presentation_detail'),
					'drug_history' => $this->input->post('drug_history'),
					'antenatal_history' => $this->input->post('antenatal_history'),
					'hiv_screening_test' => $this->input->post('hiv_screening_test'),
					'on_arv_anti_retrovirial' => $this->input->post('on_arv_anti_retrovirial'),
					'malaria_screening_test' => $this->input->post('malaria_screening_test'),
					'hepatitis_b_screening_test' => $this->input->post('hepatitis_b_screening_test'),
					'physical_exams' => $this->input->post('physical_exams'),
					'treatments' => $this->input->post('treatments'),
					'pih_anaemia_screening' => $this->input->post('pih_anaemia_screening'),
					'advise_counsel' => $this->input->post('advise_counsel'),
					'preventive_measures' => $this->input->post('preventive_measures'),
					'adherence_to_treatment' => $this->input->post('adherence_to_treatment'),
					'adherence_to_treatment' => $this->input->post('adherence_to_treatment'),
					'bleeding_during_pregnancy' => $this->input->post('bleeding_during_pregnancy'),
					'vaccination_status' => $this->input->post('vaccination_status'),
					'latitude' 	   => $this->input->post('latitude'),
					'longitude' 	   => $this->input->post('longitude'),
				],		
			]; 
		} else { // update patient
			$data['patient'] = (object)$postData = [
				'id'   		   => $this->input->post('id'),
				'patient_id'   => $this->input->post('patient_id'),
				'firstname'    => $this->input->post('firstname'),
				'middlename'   => $this->input->post('middlename'),
				'lastname' 	   => $this->input->post('lastname'),
				'email' 	   => $this->input->post('email'),
				'password' 	   => md5($this->input->post('password')),
				'date_of_birth' 	=> date('Y-m-d', strtotime($this->input->post('date_of_birth'))),
				'phone'   	   => $this->input->post('phone'),
				'sex' 		   => $this->input->post('sex'),
				'create_date'  => date('Y-m-d'),
				'created_by'   => $this->session->userdata('user_id'),
				'status'       => 1,
				'patient_detail' => (object)$patient_detail = [
					'patient_id'   => $this->input->post('patient_id'),
					'quarter' 	=> $this->input->post('quarter'),
					'name_of_village' 	=> $this->input->post('name_of_village'),
					'income'   	   => $this->input->post('income'),
					'education'    => $this->input->post('education'),
					'employment_status' => $this->input->post('employment_status'),
					'occupation' => $this->input->post('occupation'),
					'marital_status' => $this->input->post('marital_status'),
					'language' => $this->input->post('language'),
					'religion' => $this->input->post('religion'),
					'residence' => $this->input->post('residence'),
					'antenatal_visits' => $this->input->post('antenatal_visits'),
					'place_visits' => $this->input->post('place_visits'),
					'delivery' => $this->input->post('delivery'),
					'head_of_household' => $this->input->post('head_of_household'),
					'alive' => $this->input->post('alive'),
					'dead' => $this->input->post('dead'),
					'total_pregnancies' => $this->input->post('total_pregnancies'),
					'medical_history' => $this->input->post('medical_history'),
					'history_of_diabetes' => $this->input->post('history_of_diabetes'),
					'history_of_hypertension' => $this->input->post('history_of_hypertension'),
					'examination' => $this->input->post('examination'),
					'echography' => $this->input->post('echography'),
					'foetal_movements' => $this->input->post('foetal_movements'),
					'foetal_presentation' => $this->input->post('foetal_presentation'),
					'foetal_presentation_detail' => $this->input->post('foetal_presentation_detail'),
					'drug_history' => $this->input->post('drug_history'),
					'antenatal_history' => $this->input->post('antenatal_history'),
					'hiv_screening_test' => $this->input->post('hiv_screening_test'),
					'on_arv_anti_retrovirial' => $this->input->post('on_arv_anti_retrovirial'),
					'malaria_screening_test' => $this->input->post('malaria_screening_test'),
					'hepatitis_b_screening_test' => $this->input->post('hepatitis_b_screening_test'),
					'physical_exams' => $this->input->post('physical_exams'),
					'treatments' => $this->input->post('treatments'),
					'pih_anaemia_screening' => $this->input->post('pih_anaemia_screening'),
					'advise_counsel' => $this->input->post('advise_counsel'),
					'preventive_measures' => $this->input->post('preventive_measures'),
					'adherence_to_treatment' => $this->input->post('adherence_to_treatment'),
					'adherence_to_treatment' => $this->input->post('adherence_to_treatment'),
					'bleeding_during_pregnancy' => $this->input->post('bleeding_during_pregnancy'),
					'vaccination_status' => $this->input->post('vaccination_status'),
					'latitude' 	   => $this->input->post('latitude'),
					'longitude' 	   => $this->input->post('longitude'),
				],
			];
		}
		#-------------------------------#
		if ($this->form_validation->run() === true) {

			#if empty $id then insert data
			if (empty($postData['id'])) {
				if ($insert_id = $this->patient_model->create($postData)) {

					$patient = $this->patient_model->getPatientid($insert_id);
                	$patient_detail['patient_id'] = $patient->patient_id;
               		$this->patient_model->patientDetail($patient_detail);

	                #-------------------------------------------------------#
	            #-------------------------SMS SEND -----------------------------#
	                #-------------------------------------------------------#
	                # SMS Setting
	      //           $setting = $this->db->select('registration')
	      //              ->from('sms_setting')
	      //              ->get()
	      //              ->row();

	      //           if (!empty($setting) && ($setting->registration==1))
	      //           { 
	      //               #-----------------------------------#
	      //               # SMS Gateway Setting
	      //               $gateway = $this->db->select('*')
	      //                  ->from('sms_gateway')
	      //                  ->where('default_status', 1)
	      //                  ->get()
	      //                  ->row();

	      //               #-----------------------------------#
	      //               # schedules list
	      //               $sms_teamplate = $this->db->select('teamplate')
	      //                   ->from('sms_teamplate')
	      //                   ->where('status', 1)
	      //                   ->where('default_status', 1)
							// ->like('type', 'Registration', 'both')
	      //                   ->get()
	      //                   ->row();  
	                        
	      //               #-----------------------------------#
	      //               # sms  

	      //               if(!empty($gateway) && !empty($sms_teamplate)) 
	      //               {
	      //                   $this->load->library('smsgateway');
	      //                   $template = $this->smsgateway->template([
	      //                       'patient_name'   => $postData['firstname'].' '.$postData['lastname'],
	      //                       'patient_id'     => $postData['patient_id'],
	      //                       'message'        => $sms_teamplate->teamplate
	      //                   ]); 

	      //                   $this->smsgateway->send([
	      //                       'apiProvider' => $gateway->provider_name,
	      //                       'username'    => $gateway->user,
	      //                       'password'    => $gateway->password,
	      //                       'from'        => $gateway->authentication,
	      //                       'to'          => $postData['mobile'],
	      //                       'message'     => $template
	      //                   ]);

	      //                   // save delivary data
	      //                   $this->db->insert('custom_sms_info', array(
	      //                      'gateway' => $gateway->provider_name,
	      //                      'reciver'          => $postData['mobile'],
	      //                      'message'          => $template ,
	      //                      'sms_date_time'    => date("Y-m-d h:i:s")
	      //                   ));
	      //               }
	      //           }
	                #-------------------------------------------------------#
	            #-------------------------SMS SEND -----------------------------#
	                #-------------------------------------------------------#
					
					#set success message
					$this->session->set_flashdata('message', display('save_successfully'));
				} else {
					#set exception message
					$this->session->set_flashdata('exception', display('please_try_again'));
				}


				redirect('dashboard_nurse/patient/patient/profile/' . $insert_id);
			} else {
				if ($this->patient_model->updatePatientDetail($postData)) {
					#set success message
					$this->session->set_flashdata('message', display('update_successfully'));
				} else {
					#set exception message
					$this->session->set_flashdata('exception', display('please_try_again'));
				}
				redirect('dashboard_nurse/patient/patient/edit/'.$postData['id']);
			}

		} else {
			$data['content'] = $this->load->view('dashboard_nurse/patient/patient_form',$data,true);
			$data['count']    = $this->dashboard_model->getAlertCount(); 
			$this->load->view('dashboard_nurse/main_wrapper',$data);
		} 



	}


	public function profile($patient_id = null)
	{ 
		$data['title'] =  display('patient_information');
		#-------------------------------#
		$data['profile'] = $this->patient_model->read_by_id($patient_id);
		$data['documents'] = $this->document_model->read_by_patient($patient_id);
		$data['profile_detail'] = $this->patient_model->readPatientDetail($patient_id);	
		$data['count']    = $this->dashboard_model->getAlertCount(); 
		$data['content'] = $this->load->view('dashboard_nurse/patient/patient_profile',$data,true);
		$this->load->view('dashboard_nurse/main_wrapper',$data);
	}


	public function edit($patient_id = null) 
	{ 
		$data['title'] = display('patient_edit');
		#-------------------------------#
		//$data['patient'] = $this->patient_model->read_by_id($patient_id);
		$data['patient'] = $this->patient_model->read_by_patient_id($patient_id);
		$data['content'] = $this->load->view('dashboard_nurse/patient/patient_form',$data,true);
		$data['count']    = $this->dashboard_model->getAlertCount(); 
		$this->load->view('dashboard_nurse/main_wrapper',$data);
	}
 
  

    /*
    |----------------------------------------------
    |        id genaretor
    |----------------------------------------------     
    */
    public function randStrGen($mode = null, $len = null){
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



	public function document()
	{ 
		$data['title'] = display('document_list');
		$data['documents'] = $this->document_model->read($this->session->userdata('user_id'));
		$data['content'] = $this->load->view('dashboard_nurse/patient/document',$data,true);
		$data['count']    = $this->dashboard_model->getAlertCount(); 
		$this->load->view('dashboard_nurse/main_wrapper',$data);
	} 



    public function document_form()
    {  
        $data['title'] = display('add_document'); 
        /*----------VALIDATION RULES----------*/
        $this->form_validation->set_rules('patient_id', display('patient_id') ,'required|max_length[30]'); 
        $this->form_validation->set_rules('description', display('description'),'trim');
        $this->form_validation->set_rules('hidden_attach_file', display('attach_file'),'required');
        /*-------------STORE DATA------------*/
        $urole = $this->session->userdata('user_role');
        $data['document'] = (object)$postData = array( 
            'patient_id'  => $this->input->post('patient_id'),
            'doctor_id'   => $this->session->userdata('user_id'),
            'description' => $this->input->post('description'),
            'hidden_attach_file' => $this->input->post('hidden_attach_file'),
            'date'        => date('Y-m-d'),
            'upload_by'   => (($urole==10)?0:$this->session->userdata('user_id'))
        );  

        /*-----------CREATE A NEW RECORD-----------*/
        if ($this->form_validation->run() === true) { 
 
            if ($this->document_model->create($postData)) {
                #set success message
                $this->session->set_flashdata('message', display('save_successfully'));
            } else {
                #set exception message
                $this->session->set_flashdata('exception',display('please_try_again'));
            }
            redirect('dashboard_nurse/patient/patient/document_form');
        } else {
            $data['doctor_list'] = $this->doctor_model->doctor_list(); 
            $data['content'] = $this->load->view('dashboard_nurse/patient/document_form',$data,true);
            $data['count']    = $this->dashboard_model->getAlertCount(); 
            $this->load->view('dashboard_nurse/main_wrapper',$data);
        }  
    } 


    public function do_upload()
    {
        ini_set('memory_limit', '3072M');
        ini_set('upload_max_filesize', '3072M');  
        ini_set('post_max_size', '3072M');  
        ini_set('max_input_time', 3600);  
        ini_set('max_execution_time', 3600);

        if (($_SERVER['REQUEST_METHOD']) == "POST") { 
            $filename = $_FILES['attach_file']['name'];
            $filename = strstr($filename, '.', true);
            $email    = $this->session->userdata('email');
            $filename = strstr($email, '@', true)."_".$filename;
            $filename = strtolower($filename);
            /*-----------------------------*/

            $config['upload_path']   = FCPATH .'./assets/attachments/';
            // $config['allowed_types'] = 'csv|pdf|ai|xls|ppt|pptx|gz|gzip|tar|zip|rar|mp3|wav|bmp|gif|jpg|jpeg|jpe|png|txt|text|log|rtx|rtf|xsl|mpeg|mpg|mov|avi|doc|docx|dot|dotx|xlsx|xl|word|mp4|mpa|flv|webm|7zip|wma|svg';
            $config['allowed_types'] = 'pdf|doc|docx|bmp|gif|jpg|jpeg|jpe|png';
           	$config['max_size']	= '3072';
			$config['max_width']  = '10024';
			$config['max_height']  = '7068';
            $config['encrypt_name'] = true; 
            $config['remove_spaces'] = true; 
            $config['file_ext_tolower'] = true; 
            $config['file_name']     =  $filename;
            $config['overwrite']     = false;

            $this->load->library('upload', $config);

            $name = 'attach_file';
            if ( ! $this->upload->do_upload($name) ) {
                $data['exception'] = $this->upload->display_errors();
                $data['status'] = false;
                echo json_encode($data);
            } else {
                $upload =  $this->upload->data();
                $data['message'] = display('upload_successfully');
                $data['filepath'] = './assets/attachments/'.$upload['file_name'];
                $data['status'] = true;
                echo json_encode($data);
            }
        }  
    } 


    public function document_delete($id = null)
    {
    	if ($this->document_model->delete($id)) {

	    	$file = $this->input->get('file');
	    	if (file_exists($file)) {
	    		@unlink($file);
	    	}
    		$this->session->set_flashdata('message', display('save_successfully'));

    	} else {
    		$this->session->set_flashdata('exception', display('please_try_again'));
    	}

    	redirect($_SERVER['HTTP_REFERER']);
    }


    /*
    |----------------------------------------------
    |        id genaretor
    |----------------------------------------------     
    */
    public function tokenGenerator($mode = null, $len = null){
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
