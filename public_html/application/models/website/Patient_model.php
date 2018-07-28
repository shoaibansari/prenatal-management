<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Patient_model extends CI_Model {

	private $table = "patient";
 
	public function create($data = [])
	{	 
		$this->db->insert($this->table,$data);
        $insert_id = $this->db->insert_id();

  		return  $insert_id;
	}

	public function getPatientid($insert_id)
	{	 
		$patient_id = $this->db->select('patient_id')
						     ->from($this->table)
						     ->where('id',$insert_id)
						     ->get()
						     ->row();

  		return  $patient_id;
	}

	public function patientDetail($data = [])
	{	
		return $this->db->insert('patient_detail',$data);
	}
 
	public function read($patient_id)
	{
		return $this->db->select("*")
			->from($this->table)
			->where('patient_id',$patient_id)
			->get()
			->row();
	}

	public function readPatientDetail($patient_id)
	{
		return $this->db->select("*")
			->from('patient_detail')
			->where('patient_id',$patient_id)
			->get()
			->row();
	} 
  
}
