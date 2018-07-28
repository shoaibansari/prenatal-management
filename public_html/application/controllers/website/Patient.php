<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Patient extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'website/home_model',
			'website/patient_model'
		));
		
	}
 
	public function create()
	{
		$data['title'] = display('add_patient');
		#-------------------------------#
		$this->form_validation->set_rules('firstname', display('first_name'),'required|max_length[50]|regex_match[/^[A-Z a-z \-]+$/]');
		$this->form_validation->set_rules('middlename', 'Middle Name','required|max_length[50]|regex_match[/^[A-Z a-z \-]+$/]');
		$this->form_validation->set_rules('lastname', display('last_name'),'required|max_length[50]|regex_match[/^[A-Z a-z \-]+$/]');
		$this->form_validation->set_rules('email', display('email'),'required|max_length[100]|is_unique[patient.email]|valid_email');
		$this->form_validation->set_rules('password', display('password'),'required|max_length[32]|min_length[8]');
		$this->form_validation->set_rules('date_of_birth', display('date_of_birth'),'required|max_length[10]');
		$this->form_validation->set_rules('name_of_village', 'Name of Village','required|max_length[20]');
		$this->form_validation->set_rules('quarter', 'Quarter','required|max_length[10]');
		$this->form_validation->set_rules('phone', display('phone'),'required|max_length[13]|numeric');
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
		// if picture is uploaded then resize the picture
		// if ($picture !== false && $picture != null) {
		// 	$this->fileupload->do_resize(
		// 		$picture, 293, 350
		// 	);
		// }
		//if picture is not uploaded
		// if ($picture === false) {
		// 	$data['image_exception'] = display('invalid_picture'); 
		// }
		#-------------------------------#
		$postData = [
			'id'   		   => $this->input->post('id'),
			'patient_id'   => "P".$this->tokenGenerator(2,7),
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
			
			
			// 'blood_group'  => $this->input->post('blood_group'),
			// 'address' 	   => $this->input->post('address'),
			// 'picture'      => (!empty($picture)?$picture:$this->input->post('old_picture')),
			// 'affliate'     => null,
		];

		$patient_detail = [
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
		]; 
		#-------------------------------#
		if ($this->form_validation->run() === true) {

			#if empty $id then insert data
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
				$data['message'] = display('registration_successfully');
			} else {
				#set exception message
				$data['exception'] = display('please_try_again'); 
			} 

			redirect('patient_info/' . $postData['patient_id']);

		} else {
			$data['exception'] = validation_errors();
		} 
		$data['p_status'] = 2;
        $this->session->set_flashdata($data);
        redirect($_SERVER['HTTP_REFERER']."#appointment");
	}


	public function profile($patient_id = null)
	{ 
		$data['title'] = display('patient_information');
		#-------------------------------#
        $data['setting'] = $this->home_model->setting();
		$data['profile'] = $this->patient_model->read($patient_id);
		$data['profile_detail'] = $this->patient_model->readPatientDetail($patient_id);
        if(empty($data['profile'])) show_404();
		$this->load->view('website/patient_wrapper',$data);
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
