<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Sms_model extends CI_model 
{

	public function save($data = array())
	{
		return $this->db->insert('sms_users', $data);
	}

	public function gateway()
	{
		return $this->db->select('*')
			->from('sms_gateway')
			->where('default_status',1)
			->get()
			->row();
	}

 	public function sms_list($limit, $offset, $start_date, $end_date, $user_id)
 	{ 
        return  $this->db->select("us.*, CONCAT_WS(' ', u.firstname, u.lastname) AS sender")
            ->from('sms_users AS us')
            ->join('user AS u', 'u.user_id=us.user_id', 'left')
	 	 	->where("DATE(us.date) BETWEEN '$start_date' AND '$end_date'", null, false)
	 	 	->where('u.user_id', $user_id)
	  		->limit($limit, $offset)
	  		->order_by('date', 'desc')
            ->get()
            ->result();
 	}
 
 	public function sms_count($start_date, $end_date, $user_id)
 	{ 
        return  $this->db->select("us.*")
            ->from('sms_users AS us')
            ->join('user AS u', 'u.user_id=us.user_id', 'left')
	 	 	->where("DATE(us.date) BETWEEN '$start_date' AND '$end_date'", null, false)
	 	 	->where('u.user_id', $user_id)
            ->get()
	 	 	->num_rows();

 	} 
 
}
