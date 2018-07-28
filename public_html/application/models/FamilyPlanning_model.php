<?php defined('BASEPATH') OR exit('No direct script access allowed');

class FamilyPlanning_model extends CI_Model {

	private $table = "family_planning";
 
	public function create($data = [])
	{
		return $this->db->insert($this->table,$data);
	}
 
	public function read()
	{
		return $this->db->select("family_planning.*")
			->from("family_planning")
			//->join('department','department.dprt_id = user.department_id','left')
			//->where('user.user_role',2)
			//->where('status',1)
			->order_by('family_planning.id','desc')
			->get()
			->result();
	} 

	public function getLanguage($withEmpty = false){
		$result = $this->db->select("*")
			->from('audio_language')
			//->where('status',1)
			->get()
			->result();


		$list['0'] = display('select_audio');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->id] = $value->name; 
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
