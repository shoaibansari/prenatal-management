<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH . 'core/ApiController.php';
class PatientApiController extends ApiController {

    public function __construct()
    {
        parent::__construct();

        $this->load->model(array(
            'dashboard_model',
            'setting_model',
            'case_manager/patient_model',
            'case_manager/status_model',
            'FamilyPlanning_model',
            'dashboard_patient/appointment/appointment_model'
        )); 
    }


 
     public function patientLogin(){
       

        $this->form_validation->set_rules('email', display('email'),'required|max_length[50]|valid_email');
        $this->form_validation->set_rules('password', display('password'),'required|max_length[32]|md5');
        $this->form_validation->set_rules('user_role',display('user_role'),'required');

         $data['user'] = (object)$postData = [
            'email'     => $this->input->post('email',true),
            'password'  => md5($this->input->post('password',true)),
            'user_role' => $this->input->post('user_role',true),
        ]; 

      /*   if(!$this->apiAuth($_POST['api_key'])){
            echo $this->sendError('unauthenticate api key');
            return false;
        } */

        if ($this->form_validation->run() === true) {

            
            if($postData['user_role'] == 10){
                $check_user = $this->dashboard_model->check_patient($postData); 
                  if ($check_user->num_rows() === 1) {
                     $data = ([
                    'isLogIn'   => true,
                    'user_id' => (($postData['user_role']==10)?$check_user->row()->id:$check_user->row()->user_id),
                    'patient_id' => (($postData['user_role']==10)?$check_user->row()->patient_id:null),
                    'email'     => $check_user->row()->email,
                    'fullname'  => $check_user->row()->firstname.' '.$check_user->row()->lastname,
                    'user_role' => (($postData['user_role']==10)?10:$check_user->row()->user_role),
                    'picture'   => $check_user->row()->picture, 
                    'title'     => (!empty($setting->title)?$setting->title:null),
                    'address'   => (!empty($setting->description)?$setting->description:null),
                    'logo'      => (!empty($setting->logo)?$setting->logo:null),
                    'favicon'      => (!empty($setting->favicon)?$setting->favicon:null),
                    'footer_text' => (!empty($setting->footer_text)?$setting->footer_text:null),
                ]);

                     echo $this->sendResponse($data);
                  }else{
                    echo json_encode(array( 'invalid username or password' ));
                  }
            }

        }else{
           echo  $this->fieldError();
        }
    }


    // hospital details and locations 

    public function getPatientHospital(){
           $patient_id = '';
            if(isset($_POST['patient_id'])){
                $patient_id = $_POST['patient_id'];
            }
           if( !$hospital = $this->patient_model->getHospitalDetails($patient_id) ){
                echo json_encode(array( 'No hospital details are found for '. $patient_id ));
            }else{
                echo $this->sendResponse($hospital);
            }

        /*$this->form_validation->set_rules('patient_id', display('patient_id'),'required');
        if ( $this->form_validation->run() === true ){ die('asdasdasd');

         

        }else{
                $this->fieldError();
        }*/
    }

    public function getAudioByLanguage(){
        $language = '';
        if(isset($_POST['language'])){
            $language = $_POST['language'];
        }
        if($type = $this->FamilyPlanning_model->getAudioLanguage($language) ){
            
            if(!$language = $this->FamilyPlanning_model->getAudioList($type[0]->id)){
                 echo json_encode(array( 'No audio found in '. $language . 'language' ));
            }else{
                $lang = base_url('assets/audio');
                foreach ($language as $key => $value) {
                    $value->path = $lang;
                }
                
                echo $this->sendResponse($language);
            }
            
        }else{
            echo $this->sendResponse('Language not found');
        }
    }

    public function getLanguageList(){
        $language = '';
        if(isset($_POST['language'])){
            $language = $_POST['language'];
        }
        if(!$type = $this->FamilyPlanning_model->getAudioLanguage( $language ) ){
            echo json_encode(array( 'Fail to retrive listing' ));
        }else{
            echo $this->sendResponse($type);
        }
            
    }

    public function getPatientHistory(){
        if(isset($_POST['patient_id'])){
            $patient_id = $_POST['patient_id'];
        }

        $this->form_validation->set_rules('patient_id', display('patient_id'),'required');
        if ($this->form_validation->run() === true) {
            if(!$appointment = $this->appointment_model->getPatientAppointment($patient_id)){
                echo json_encode(array('No appointment history is found for '. $patient_id));
            }else{
                echo $this->sendResponse($appointment);
            }

        }else{
            echo  $this->fieldError();
        }
        

    }


    public function getAppointmentDetails(){
       if(isset($_POST['patient_id'])){
            $patient_id = $_POST['patient_id'];
        } 

        $this->form_validation->set_rules('patient_id', display('patient_id'),'required');
            if ($this->form_validation->run() === true) {
                if(!$appointment = $this->appointment_model->getAppointmentInfo($patient_id)){
                    echo json_encode(array('No appointment history is found for '. $patient_id));
                }else{
                    echo $this->sendResponse($appointment);
                }

            }else{
            echo  $this->fieldError();
            }

    }

    public function getAddress($lat, $lng){
        $url = 'http://maps.googleapis.com/maps/api/geocode/json?api_key=AIzaSyCyqagsx-e131bO-FdYb1LiNYxTgiZsmWU&latlng='.trim($lat).','.trim($lng).'&sensor=false';
        $json = file_get_contents($url);
        $data=json_decode($json);
        ;
        $status = $data->status;
        if($status=="OK")

        return  $data->results[0]->formatted_address;
        else
        return false;
    }

    public function getEmergencyAlert(){

        $data = [];
        if(isset($_POST)){
            $data = $_POST;
        }
       
        $this->form_validation->set_rules('patient_id', display('patient_id'),'required');
        $this->form_validation->set_rules('alert_id', display('message'),'required');
        $this->form_validation->set_rules('lat', display('message'),'required');
        $this->form_validation->set_rules('lng', display('message'),'required');


        $data['location'] = $this->getAddress($data['lat'], $data['lng']);
        
        unset( $data['lat'] );
        unset( $data['lng'] );


        if ($this->form_validation->run() === true) {
            if(!$appointment = $this->appointment_model->addAlert($data)){
                echo json_encode(array('There is no emergency alert is avialable'));
            }else{
                 echo $this->sendResponse($appointment);
            }
        }else{
            echo $this->fieldError();
        }
    }
        
 
}
