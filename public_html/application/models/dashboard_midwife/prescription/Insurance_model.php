<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Insurance_model extends CI_Model {

	private $table = "inc_insurance";
  

	public function insurance_list()
	{
		$result = $this->db->select("*")
			->from($this->table) 
			->where('status',1)
			->get()
			->result();

		$list[''] = "Select Insurance";
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
