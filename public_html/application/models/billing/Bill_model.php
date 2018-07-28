<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Bill_model extends CI_Model {

	private $table = "bill";
 
	public function create($data = [])
	{	 
		return $this->db->insert($this->table, $data);
	}
 
	public function read($limit, $offset)
	{ 
		return $this->db->select("bi.*, ba.patient_id, CONCAT_WS(' ', pa.firstname, pa.lastname) AS patient_name")
		->from("bill as bi")
		->join("bill_admission AS ba", "ba.admission_id = bi.admission_id", "left")
		->join("patient AS pa", "pa.patient_id = ba.patient_id", "left")
		->limit($limit, $offset)
		->order_by('id','desc')
		->get()
		->result();
	}  
 
	public function bill_by_id($bill_id = null)
	{ 
		return $this->db->select("
				bi.id AS id,
				bi.bill_id AS bill_id,
				bi.admission_id AS admission_id,
				bi.bill_date AS bill_date,
				bi.payment_method AS payment_method,
				bi.card_cheque_no AS card_cheque_no,
				bi.receipt_no AS receipt_no,
				bi.discount AS discount,
				bi.tax AS tax,
				bi.note AS note,
				bi.status AS status,

				ba.patient_id AS patient_id,
				ba.admission_date AS admission_date,
				ba.discharge_date AS discharge_date, 
				DATEDIFF(ba.discharge_date, ba.admission_date) as total_days,
				ba.patient_id AS doctor_id,
				ba.insurance_id AS insurance_id,
				ba.policy_no AS policy_no,

				CONCAT_WS(' ', pa.firstname, pa.lastname) AS patient_name,
				pa.address AS address,
				pa.date_of_birth AS date_of_birth,
				pa.sex AS sex,
				pa.picture AS picture,

				CONCAT_WS(' ', dr.firstname, dr.lastname) AS doctor_name,

				in.insurance_name AS insurance_name,

				bp.id as package_id,
				bp.name as package_name, 
				bp.services as services
			")
			->from("bill AS bi")
			->join("bill_admission AS ba", "ba.admission_id = bi.admission_id", "left")
			->join("patient AS pa", "pa.patient_id = ba.patient_id", "left")
			->join("user AS dr", "dr.user_id = ba.doctor_id", "left")
			->join("inc_insurance AS in", "in.id = ba.insurance_id", "left")
			->join("bill_package AS bp", "bp.id = ba.package_id", "left")
			->where("bi.bill_id", $bill_id)
			->get()
			->row();
	}  
 

	public function services_by_id($bill_id = null)
	{
		return $this->db->select("
				bill_details.*, 
				bill_service.id AS id, 
				bill_service.name AS name
			")->from("bill_details")
			->join("bill_service", "bill_service.id = bill_details.service_id","left")
			->where("bill_details.bill_id", $bill_id)
			->get()
			->result();
	}


	public function update($data = [])
	{
		return $this->db->where('bill_id',$data['bill_id'])
			->update($this->table,$data); 
	} 
 
	public function delete($bill_id = null)
	{ 
		$this->db->where('bill_id',$bill_id)
			->delete($this->table);

		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}
	} 
 

	public function advance_payment($bill_id = null)
	{
		return $this->db->select("DATE(ba.date) AS date, ba.receipt_no, ba.amount")
			->from("bill AS b")
			->join("bill_advanced AS ba","ba.admission_id = b.admission_id")
			->where("b.bill_id", $bill_id)
			->get()
			->result();
	}


	public function website()
	{
		return $this->db->select('title, description, email, phone,logo')
			->from('setting')
			->get()
			->row();
	}
}
