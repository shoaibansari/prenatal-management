<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Home_model extends CI_Model {


	public function notice()
	{
		return $this->db->select("notice.*, 
				CONCAT_WS(' ', user.firstname, user.lastname) as assign_by")
			->from("notice")
			->join('user', 'user.user_id = notice.assign_by', 'left')
			->where('notice.status', 1)
			->order_by('notice.id','desc')
			->limit(10)
			->get()
			->result();
	}

	public function chart(){
		$query1 =  $this->db->query('
            SELECT  
                DATE AS DATE,
                EXTRACT(MONTH FROM DATE) AS MONTH,
                COUNT(patient_id) AS patient
            FROM acm_invoice
            WHERE DATE >= DATE_SUB(NOW(),INTERVAL 1 YEAR)
            GROUP BY EXTRACT(YEAR_MONTH FROM DATE)
            
        ')
        ->result(); 

		$query2 = $this->db->query('
             SELECT 
                DATE AS DATE,
                EXTRACT(MONTH FROM DATE) AS MONTH,
                SUM(total) AS TOTAL
            FROM acm_invoice
            WHERE DATE >= DATE_SUB(NOW(),INTERVAL 1 YEAR)
            GROUP BY EXTRACT(YEAR_MONTH FROM DATE)
        ')
        ->result(); 

        return [$query1,$query2]; 
	}

	public function inbox($user_id)
	{
		return $this->db->select("message.*, 
				CONCAT_WS(' ', user.firstname, user.lastname) as sender_name")
			->from("message")
			->join('user', 'user.user_id = message.sender_id')
			->where('message.receiver_id', $user_id)
			->where_not_in('message.receiver_status', 2)
			->order_by('message.id','desc')
			->order_by('message.datetime','desc')
			->get()
			->result();
	}


	public function profile($user_id = null)
	{
		return $this->db->select("*")
			->from("user") 
			->where('user_id', $user_id)
			->get()
			->row();
	} 
 
	public function update($data = [])
	{
		return $this->db->where('user_id',$data['user_id'])
			->update("user" ,$data); 
	} 
 
	public function department_list()
	{
		$result = $this->db->select("*")
			->from('department')
			->where('status',1)
			->get()
			->result();

		$list[''] = display('select_doctor');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->dprt_id] = $value->name; 
			}
			return $list;
		} else {
			return false;
		}
	}


}
