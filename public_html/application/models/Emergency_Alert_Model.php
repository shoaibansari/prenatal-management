<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Emergency_Alert_Model extends CI_Model {

	private $table = "emergency_alert";
 
	public function create($data = [])
	{
		return $this->db->insert($this->table,$data);
	}
 
	public function read()
	{
		return $this->db->select("emergency_alert.*,alert_type.type")
			->from("emergency_alert")
			->join('alert_type','alert_type.id = emergency_alert.alert_id','left')
			//->where('emergency_alert.is_read',0)
			//->where('status',1)
			->order_by('emergency_alert.id','desc')
			->get()
			->result();
	} 

	public function markedAsRead($id){
		$data = $this->db->select("is_read")
				->from("emergency_alert")
				->where('id' , $id)
				->get()
				->result();
		$abc['is_read'] = $data[0]->is_read;

		if($abc['is_read'] == 1){
			$abc['is_read'] = 0 ; 
		}else{
			$abc['is_read'] = 1;
		}
		
		return $this->db->where('id',$id)
			->update($this->table,$abc);
	}

	public function getAlert($withEmpty = false){
		$result = $this->db->select("*")
			->from('alert_type')
			//->where('status',1)
			->get()
			->result();


		$list['0'] = display('select_audio');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->id] = $value->type; 
			}
			return $list;
		} else {
			return false;
		}
	
	}
 
	public function read_by_id($user_id = null)
	{
		return $this->db->select("*")
			->from($this->table)
			->where('id',$user_id)
			//->where('status',1)
			->get()
			->row();
	} 
 
	public function update($data = [])
	{
		return $this->db->where('id',$data['id'])
			->update($this->table,$data); 
	} 
 
	public function delete($user_id = null)
	{
		$this->db->where('id',$user_id)
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
			->from($this->table)
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

	public function getAudioLanguage($language=null){
		$abc = $this->db->select('*')->from('audio_language');
		if ($language) {
			return $abc->where('name',$language)
				->get()
				->result();
		}
		return $abc->get()->result();
	}

	public function getAudioList($language){
		return $this->db->select("*")
			->from('family_planning')
			->where('language' , $language )
			->where('status', 1)
			->get()
			->result();
	}


}
