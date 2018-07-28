<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Patient_model extends CI_Model {

	private $table = "patient";
 
	public function create($data = [])
	{	
		unset($data['patient_detail']);
		
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
 
	public function read()
	{
		return $this->db->select("*")
			->from($this->table)
			->order_by('id','desc')
			->get()
			->result();
	}

	public function readAllPatientDetail()
	{
		return $this->db->select("*")
			->from('patient_detail')
			->order_by('id','desc')
			->get()
			->result();
	} 

	public function readPatientDetail($patient_id)
	{
		$patient = $this->db->select('patient_id')
				->from($this->table)
				->where('id', $patient_id)
				->get()
				->row();
        
		return $this->db->select("*")
			->from('patient_detail')
			->where('patient_id',$patient->patient_id)
			->get()
			->row();


	} 
 
	public function read_by_id($id = null)
	{
		return $this->db->select("*")
			->from($this->table)
			->where('id',$id)
			->get()
			->row();
	} 

	public function read_by_patient_id($id = null)
	{
		$patient_id = $this->db->select('patient_id')
						->from($this->table)
						->where('id', $id)
						->get()
						->row();   
			
		$patient = $this->db->select("*")
						->from($this->table)
						->where('id', $id)
						->get()
						->row();

		$patient->patient_detail = $this->db->select("*")
						->from('patient_detail')
						->where('patient_id',$patient_id->patient_id)
						->get()
						->row();
						
		return (object)$patient;
	}
 
	public function update($data = [])
	{
		return $this->db->where('id',$data['id'])
			->update($this->table,$data); 
	} 
    
    public function updatePatientDetail($data = [])
	{
		$data2 = (array)$data['patient_detail'];
		unset($data['patient_detail']);
		
		$patient = $this->db->where('id',$data['id'])
					->update($this->table,$data);

		$patient->patient_detail = $this->db
					->where('patient_id',$data['patient_id'])
					->update('patient_detail',$data2);

		return (object)$patient;
	} 
  
}
