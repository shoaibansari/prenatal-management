<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Appointment_model extends CI_Model {

	private $table = 'appointment';

	public function create($data = [])
	{	 
		return $this->db->insert($this->table,$data);
	}
 
	public function read()
	{
		return $this->db->select("
				appointment.*, 
				user.firstname, 
				user.lastname,  
				department.name
			")
			->from($this->table)
			->join('user','user.user_id = appointment.doctor_id')
			->join('department','department.dprt_id = appointment.department_id') 
			->order_by('appointment.id','desc')
			->get()
			->result();
	} 
 
	public function read_by_id($appointment_id = null)
	{ 
		return $this->db->select("
				appointment.*, 
				appointment.appointment_id, 
				appointment.serial_no, 
				appointment.problem, 
				appointment.date, 
				user.firstname, 
				user.lastname,  
				user.picture,  
				user.degree,  
				department.name as department,
				schedule.available_days,
				schedule.start_time,
				schedule.end_time,
				patient.firstname AS pfirstname,
				patient.lastname AS plastname,
				patient.date_of_birth,
				patient.sex,
				patient.mobile,
				patient.picture,
			")
			->from($this->table)
			->join('user','user.user_id = appointment.doctor_id','left')
			->join('department','department.dprt_id = appointment.department_id','left')
			->join('schedule','schedule.schedule_id = appointment.schedule_id','left')
			->where('appointment.appointment_id',$appointment_id)
			->order_by('appointment.id','desc')
			->get()
			->row();
	}   


	public function getPatientAppointment( $patient_id ){
		// die(date('Y-m-d'));
		$data = [];
		$abc = [];
		$data['available'] = $this->db->from('appointment')
						->where('appointment.patient_id', $patient_id)
						->where('date >' , date('Y-m-d') )
						->join('user','user.user_id = appointment.doctor_id','left')
						->join('schedule','schedule.schedule_id = appointment.schedule_id','left')	
						->select("
									appointment.*, 
									appointment.appointment_id, 
									appointment.serial_no, 
									appointment.problem, 
									appointment.date, 
									schedule.available_days,
									schedule.start_time,
									schedule.end_time,
									user.firstname as doctor_first_name, 
									user.lastname as doctor_last_name,  
									user.picture as doctor_picture,  
									user.email as doctor_email,  
									user.address as doctor_address,  
									user.phone as doctor_phone,  
									user.mobile as doctor_mobile,   
							")
						->order_by('appointment.id','desc')
						->get()
						->result();
		$data['used'] = $this->db->from('appointment')
						->where('appointment.patient_id', $patient_id)
						->where('date <' , date('Y-m-d') )
						->join('user','user.user_id = appointment.doctor_id','left')
						->join('schedule','schedule.schedule_id = appointment.schedule_id','left')	 
						->select("
								appointment.*, 
									appointment.appointment_id, 
									appointment.serial_no, 
									appointment.problem, 
									appointment.date, 
									schedule.available_days,
									schedule.start_time,
									schedule.end_time,
									user.firstname as doctor_first_name, 
									user.lastname as doctor_last_name,  
									user.picture as doctor_picture,  
									user.email as doctor_email,  
									user.address as doctor_address,  
									user.phone as doctor_phone,  
									user.mobile as doctor_mobile,  
							")
						->order_by('appointment.id','desc')
						->get()
						->result();

		$data['history'] = $this->db->from('appointment')
						->where('appointment.patient_id', $patient_id)
						->join('user','user.user_id = appointment.doctor_id','left')
						->join('patient','patient.patient_id = appointment.patient_id')
						->join('schedule','schedule.schedule_id = appointment.schedule_id','left')	 
						->select("
									appointment.*, 
									appointment.appointment_id, 
									appointment.serial_no, 
									appointment.problem, 
									appointment.date, 
									schedule.available_days,
									schedule.start_time,
									schedule.end_time,
									user.firstname as doctor_first_name, 
									user.lastname as doctor_last_name,  
									user.picture as doctor_picture,  
									user.email as doctor_email,  
									user.address as doctor_address,  
									user.phone as doctor_phone,  
									user.mobile as doctor_mobile,  
							")
				
			
						->order_by('appointment.id','desc')
						->get()
						->result();
			return $data;			
	}

	public function getAppointmentInfo( $patient_id ){
		return $this->db->select("
				appointment.*, 
				appointment.appointment_id, 
				appointment.serial_no, 
				appointment.problem, 
				appointment.date, 
				user.firstname as doctor_firstname, 
				user.lastname as doctor_lastname,  
				user.picture as doctor_picture,  
				user.address as doctor_address,
				user.email as doctor_email,
				user.mobile as doctor_mobile,
				user.phone as doctor_phone,
				schedule.available_days,
				schedule.start_time,
				schedule.end_time,
				
			")
			->from($this->table)
			->join('user','user.user_id = appointment.doctor_id','left')
			->join('schedule','schedule.schedule_id = appointment.schedule_id','left')
			->where('appointment.patient_id', $patient_id)
			->where('appointment.date >' , date('Y-m-d'))
			->order_by('appointment.id','desc')
			->get()
			->result();
	}

	public function addAlert($data){
		
		$data['is_read'] = 0;
		return $this->db->insert('emergency_alert', $data);
	}

	public function getalert($alert_id)
	{
		return $this->db->select('type')
				->from('alert_type')
				->where('id' , $alert_id)
				->get();
		
	}

	public function getPatientAddress($patient_id){
		return $this->db->select('address')
					->from('patient')
					->where('patient_id', $patient_id)
					->get()
					->result_array();
	}
 }
