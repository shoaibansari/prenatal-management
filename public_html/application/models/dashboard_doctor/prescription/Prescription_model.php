<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Prescription_model extends CI_Model {

	protected $table = 'pr_prescription';

	public function create($data = [])
	{	 
		return $this->db->insert($this->table, $data);
	}
 
	public function read()
	{
		return $this->db->select("pr_prescription.*, CONCAT_WS(' ', user.firstname, user.lastname) AS doctor_name")
			->from('pr_prescription') 
			->join('user', 'user.user_id = pr_prescription.doctor_id', 'left')
			->where('pr_prescription.doctor_id',$this->session->userdata('user_id')) 
			->order_by('id','desc')
			->get()
			->result();
	} 
 
	public function single_view($id = null)
	{
		return $this->db->select("
				pr.*,  
				CONCAT_WS(' ', pe.firstname, pe.lastname) AS patient_name,  
				pe.sex,
				pe.date_of_birth,
				CONCAT_WS(' ', dr.firstname, dr.lastname) AS doctor_name,  
				dr.designation,
				dr.address,
				dr.specialist,
				dp.name as department_name,
				in.insurance_name
			")
			->from('pr_prescription AS pr') 
			->join('patient AS pe', 'pe.patient_id = pr.patient_id', 'left')
			->join('inc_insurance AS in', 'in.id = pr.insurance_id', 'left') 
			->join('user AS dr', 'dr.user_id = pr.doctor_id', 'left') 
			->join('department AS dp', 'dp.dprt_id = dr.department_id', 'left')
			->where('pr.id', $id) 
			->where('pr.doctor_id', $this->session->userdata('user_id')) 
			->get()
			->row();
	} 
 
 
	public function update($data = [])
	{
		return $this->db->where('id',$data['id'])
			->where('doctor_id',$this->session->userdata('user_id')) 
			->update($this->table,$data); 
	} 
 
	public function delete($id = null)
	{  
		$this->db->where('id',$id)
			->where('doctor_id',$this->session->userdata('user_id')) 
			->delete($this->table);

		if ($this->db->affected_rows()) {
			return true;
		} else {
			return false;
		}
	} 
	
	
	public function patient()
	{
		return $this->db->select('*')
			->from('patient')
			->where('patient_id', $this->input->post('patient_id'))
			->get();
	}

	public function website()
	{
		return $this->db->select('title, description, email, phone')
			->from('setting')
			->get()
			->row();
	}

 

 }
