<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sms_report_model extends CI_model 
{ 
	#-------------------------------------------
 	public function customSmsList($limit, $offset, $start_date, $end_date){ 
 		return $this->db->select("*")
	 	 	->from('custom_sms_info')
	 	 	->where("DATE(sms_date_time) BETWEEN '$start_date' AND '$end_date'", null, false)
	  		->limit($limit, $offset)
	 	 	->get()
	 	 	->result();
 	}

 	public function customSmsCount($start_date, $end_date){ 
 		return $this->db->select("*")
	 	 	->from('custom_sms_info')
	 	 	->where("DATE(sms_date_time) BETWEEN '$start_date' AND '$end_date'", null, false)
	 	 	->get()
	 	 	->num_rows();
 	}


	#-------------------------------------------
 	public function autoSmsList($limit, $offset, $start_date, $end_date)
 	{
 		return $this->db->select('sms_delivery.*,sms_info.*')
	 	 	->from('sms_delivery')
	 	 	->join('sms_info','sms_info.sms_info_id=sms_delivery.sms_info_id')
	 	 	->where("DATE(sms_delivery.delivery_date_time) BETWEEN '$start_date' AND '$end_date'", null, false)
	  		->limit($limit, $offset)
	 	 	->get()
	 	 	->result();
 	}
 
 	public function autoSmsCount($start_date, $end_date)
 	{
 		return $this->db->select('sms_delivery.*,sms_info.*')
	 	 	->from('sms_delivery')
	 	 	->join('sms_info','sms_info.sms_info_id=sms_delivery.sms_info_id')
	 	 	->where("DATE(sms_delivery.delivery_date_time) BETWEEN '$start_date' AND '$end_date'", null, false)
	 	 	->get()
	 	 	->num_rows();
 	} 


 	

	#-------------------------------------------
 	public function userSmsList($limit, $offset, $start_date, $end_date)
 	{ 
        return  $this->db->select("us.*, CONCAT_WS(' ', u.firstname, u.lastname) AS sender")
            ->from('sms_users AS us')
            ->join('user AS u', 'u.user_id=us.user_id', 'left')
	 	 	->where("DATE(us.date) BETWEEN '$start_date' AND '$end_date'", null, false)
	  		->limit($limit, $offset)
	  		->order_by('date', 'desc')
            ->get()
            ->result();
 	}
 
 	public function userSmsCount($start_date, $end_date)
 	{ 
        return  $this->db->select("us.*")
            ->from('sms_users AS us')
            ->join('user AS u', 'u.user_id=us.user_id', 'left')
	 	 	->where("DATE(us.date) BETWEEN '$start_date' AND '$end_date'", null, false)
            ->get()
	 	 	->num_rows();

 	} 
 
}
