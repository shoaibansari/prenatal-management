<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Limit_approval_model extends CI_Model {

	private $table = "inc_limit_approval";
 
	public function create($data = [])
	{	 
		return $this->db->insert($this->table, $data);
	}
 
	public function read($limit = null, $offset = null)
	{ 
		return $this->db->select("
				la.*,
				CONCAT_WS(' ', co.firstname, co.lastname) as consultant_name,
				in.insurance_name
			")
			->from("inc_limit_approval AS la")
			->join("user AS co", "co.user_id = la.consultant_id", "left")
			->join("inc_insurance AS in", "in.id = la.insurance_id", "left")
			->limit($limit, $offset)
			->order_by('la.id','desc')
			->get()
			->result();
	} 
 
	public function read_by_id($id = null)
	{ 
		return $this->db->select("
				la.*,
				CONCAT_WS(' ', co.firstname, co.lastname) as consultant_name,
				in.insurance_name,
				CONCAT_WS(' ', p.firstname, p.lastname) AS patient_name,
				p.address,
				p.mobile,
				p.date_of_birth,
				p.sex
			")
			->from("inc_limit_approval AS la")
			->join("user AS co", "co.user_id = la.consultant_id", "left")
			->join("inc_insurance AS in", "in.id = la.insurance_id", "left")
			->join("patient AS p","p.patient_id = la.patient_id","left")
			->where('la.id', $id)
			->order_by('la.id','desc')
			->get()
			->row(); 
	}  

	public function update($data = [])
	{
		return $this->db->where('id', $data['id'])
			->update($this->table,$data); 
	} 
 
	public function delete($id = null)
	{ 
		$this->db->where('id',$id)
			->delete($this->table);

		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}
	} 


	public function doctor_list()
	{
		$result = $this->db->select("*")
			->from("user")
			->where('user_role',2)
			->where('status',1)
			->get()
			->result();

		$list[''] = display('select_doctor');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->user_id] = $value->firstname.' '.$value->lastname; 
			}
			return $list;
		} else {
			return false;
		}
	}

 
}
