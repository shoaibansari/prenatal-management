<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Insurance_model extends CI_Model {

	private $table = "inc_insurance";
 
	public function create($data = [])
	{	 
		return $this->db->insert($this->table, $data);
	}
 
	public function read($limit, $offset)
	{ 
		return $this->db->select("*")
		->from($this->table)
		->limit($limit, $offset)
		->order_by('id','desc')
		->get()
		->result();
	} 
 
	public function read_by_id($id = null)
	{ 
		return $this->db->select("*")
		->from($this->table) 
		->where('id', $id)
		->get()
		->row();
	}  

	public function update($data = [])
	{
		return $this->db->where('id',$data['id'])
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


	public function dropdown()
	{
		$result = $this->db->select("*")
			->from($this->table) 
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
