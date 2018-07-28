<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sms_sender extends CI_Controller {

	/*
	|--------------------------------------
	|   constructor function
	|--------------------------------------
	*/ 
	
	public function __construct() 
	{
		parent::__construct(); 
		
		$this->load->library('smsgateway');
		try { 
	 		$result = $this->db->select('time_zone')->from('setting')->get()->row();
			if(empty($result)) {
				throw new Exception('Time zone is not set in application setting!');
			} 
			@date_default_timezone_set($result->time_zone);	
		} catch (Exception $e) {
		    echo 'Exception: ',  $e->getMessage(), "\n";
		}  
	}

	/*
	|--------------------------------------
	|   index
	|--------------------------------------
	*/ 
	public function index()
	{
		#-----------------------------------#
		# SMS Setting
		try { 
		    $setting = $this->db->select('schedule')
		       ->from('sms_setting')
		       ->get()
		       ->row();

			if(empty($setting) || ($setting->schedule==0)) {
				throw new Exception('Schedule SMS disabled in Gateway Setting.');
			} 
		} catch (Exception $e) {
		    echo 'Exception: ',  $e->getMessage(), "\n";
		    exit;
		}   

		#-----------------------------------#
		# SMS Gateway Setting
	    $gateway = $this->db->select('*')
	       ->from('sms_gateway')
	       ->where('default_status', 1)
	       ->get()
	       ->row();

		#-----------------------------------#
		# schedules list
		$schedules = $this->db->select("
				sms_schedule.*,
				sms_teamplate.*
			")
			->from('sms_schedule')
			->join('sms_teamplate', 'sms_teamplate.teamplate_id = sms_schedule.ss_teamplate_id', 'left')
			->where('sms_schedule.ss_status', 1)
			->get()
			->result();
 
		if(!empty($gateway) && !empty($schedules)) 
		{
			foreach($schedules as $schedule)
			{ 
				$sTime   = explode(':', $schedule->ss_schedule);
				$days    = (($sTime[0]<10)?"0".$sTime[0]:$sTime[0]); 
				$hours   = (($sTime[1]<10)?"0".$sTime[1]:$sTime[1]);
				$minutes = (($sTime[2]<10)?"0".$sTime[2]:$sTime[2]); 

				$date    = date("Y-m-$days $hours:$minutes:00");
				$minDate = date('Y-m-d H:i:s', strtotime("$date -1 hour"));
				$maxDate = date('Y-m-d H:i:s', strtotime("$date +2 hour"));
				#-----------------------------------#
				# sms info

			    $smsInfos = $this->db->select("
			    		s.*,
			    		CONCAT_WS(' ', d.firstname, d.lastname) AS doctor_name,
			    		CONCAT_WS(' ', p.firstname, p.lastname) AS patient_name,
			    		a.serial_no
			    	")
				    ->from('sms_info AS s')
				    ->join('user AS d', 'd.user_id=s.doctor_id', 'left')
				    ->join('patient AS p', 'p.patient_id=s.patient_id', 'left')
				    ->join('appointment AS a', 'a.appointment_id=s.appointment_id', 'left')
				    ->where('s.status', 0)
				    ->where("s.appointment_date BETWEEN '$minDate' AND '$maxDate'", null, false) 
				    ->get()
				    ->result();

				foreach ($smsInfos as $info) 
				{  
					$template = $this->smsgateway->template([
						'doctor_name'    => $info->doctor_name,
						'appointment_id' => $info->appointment_id,
						'patient_name'   => $info->patient_name,
						'patient_id'     => $info->patient_id,
						'sequence'       => $info->serial_no, 
						'appointment_date' => date('d F Y',strtotime($info->appointment_date)),
						'message'        => $schedule->teamplate
	                ]); 
	       
	                $this->smsgateway->send([
						'apiProvider' => $gateway->provider_name,
						'username'    => $gateway->user,
						'password'    => $gateway->password,
						'from'        => $gateway->authentication,
						'to'          => $info->phone_no,
						'message'     => $template
	                ]);

	             	//update sms_info teable
	            	$this->db->set('status', 1)
						->set('sms_counter', 'sms_counter+1', false)
						->where('sms_info_id',$info->sms_info_id)
						->update('sms_info');
		              
					//delivery information insert
					$this->db->insert('sms_delivery', array(
						'ss_id' => $schedule->ss_id,
						'delivery_date_time' => date('Y-m-d H:i:s'),
						'sms_info_id' => $info->sms_info_id,
						'message' => $template
					));
				}
				#-----------------SMS Info-----------------
			}
			#-----------------SCHEDULES-----------------
		}
		#---------------------------------------	
	}	

}

