<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Admission_model extends CI_Model {

	private $table = "bill_admission";
 
	public function create($data = [])
	{	 
		return $this->db->insert($this->table, $data);
	}
 
	public function read($limit, $offset)
	{ 
		return $this->db->select("
			ad.*,
			CONCAT_WS(' ', pa.firstname, pa.lastname) AS patient_name,
			CONCAT_WS(' ', dr.firstname, dr.lastname) AS doctor_name,
			in.insurance_name,
			bp.name AS package_name,
		")
		->from("bill_admission AS ad")
		->join("patient AS pa", "pa.patient_id = ad.patient_id", "left")
		->join("user AS dr", "dr.user_id = ad.doctor_id", "left")
		->join("inc_insurance AS in", "in.id = ad.insurance_id", "left")
		->join("bill_package AS bp", "bp.id = ad.package_id", "left")
		->limit($limit, $offset)
		->order_by('id','desc')
		->get()
		->result();
	} 
 
	public function read_by_id($admission_id = null)
	{ 
		return $this->db->select("*")
		->from($this->table) 
		->where('admission_id', $admission_id)
		->get()
		->row();
	}  

	public function update($data = [])
	{
		return $this->db->where('admission_id',$data['admission_id'])
			->update($this->table,$data); 
	} 
 
	public function delete($admission_id = null)
	{ 
		$this->db->where('admission_id',$admission_id)
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

		$list[''] = display('doctor_name');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->user_id] = $value->firstname.' '.$value->lastname; 
			}
			return $list;
		} else {
			return false;
		}
	}

	public function package_list()
	{
		$result = $this->db->select("*")
			->from("bill_package") 
			->where('status',1)
			->get()
			->result();

		$list[''] = display('package_name');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->id] = $value->name; 
			}
			return $list;
		} else {
			return false;
		}
	}

	public function insurance_list()
	{
		$result = $this->db->select("*")
			->from("inc_insurance") 
			->where('status',1)
			->get()
			->result();

		$list[''] = display('select_option');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->id] = $value->insurance_name; 
			}
			return $list;
		} else {
			return false;
		}
	}

 
}
