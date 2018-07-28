<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Bed_model extends CI_Model {

	private $table = 'bm_bed';

 
	public function read()
	{
		return $this->db->select("*")
			->from($this->table)
			->order_by('type','asc')
			->get()
			->result();
	} 
 
	public function read_by_id($id = null)
	{
		return $this->db->select("*")
			->from($this->table)
			->where('id',$id)
			->get()
			->row();
	} 
 

	public function bed_list()
	{
		$result = $this->db->select("*")
			->from($this->table)
			->where('status',1)
			->get()
			->result();

		$list[''] = display('select_bed');
		if (!empty($result)) {
			foreach ($result as $value) {
				$list[$value->id] = $value->type; 
			}
			return $list;
		} else {
			return false;
		}
	}
	
 }
