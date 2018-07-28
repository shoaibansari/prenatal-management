<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ApiController extends CI_Controller {

    public function __construct()
    {
        parent::__construct();

    }

    const NO_ERROR = 200;
    const ERROR_VALIDATION = 422;
    const ERROR_CRITICAL = 500;
    const ERROR_NOT_IMPLEMENTED = 501;

    public function fieldError(){
        return  json_encode( validation_errors() );
    }

    public function sendError($msg){
        return json_encode(array('error' => $msg));
    }

    public function apiAuth($key){

        if($key == '123456789'){
            return true;
        }else{
            return false;
        }
    }

    public function sendResponse($data){
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Headers: X-Custom-Header');
        
        if(empty($data)){
            $sendResponse['status'] = self::ERROR_CRITICAL; 
        }
        
        $sendResponse['status'] = self::NO_ERROR; 
        $sendResponse['data'] = $data; 

        // $sendResponse['header'] = $header; 
        return json_encode($sendResponse);
    }

}
