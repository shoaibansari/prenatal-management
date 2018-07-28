<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
* @author    : bdtask 
* @created at: 25.11.2017
*/

class Bill extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array(
			'billing/bill_model',
			'billing/service_model', 
		));

		if ($this->session->userdata('isLogIn') == false
			|| $this->session->userdata('user_role') != 1) 
			redirect('login');
	}
 
	public function index()
	{ 
		$data['title'] = display('bill_list');
        #-------------------------------#
        #
        #pagination starts
        #
        $config["base_url"] = base_url('billing/bill/index');
        $config["total_rows"] = $this->db->count_all('bill');
        $config["per_page"] = 25;
        $config["uri_segment"] = 4;
        $config["last_link"] = "Last"; 
        $config["first_link"] = "First"; 
        $config['next_link'] = 'Next';
        $config['prev_link'] = 'Prev';  
        $config['full_tag_open'] = "<ul class='pagination col-xs pull-right'>";
        $config['full_tag_close'] = "</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tag_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";
        /* ends of bootstrap */
        $this->pagination->initialize($config);
        $page = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
        $data['bills'] = $this->bill_model->read($config["per_page"], $page);
        $data["links"] = $this->pagination->create_links();
        #
        #pagination ends
        #    
		$data['content'] = $this->load->view('billing/bill/list',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	} 



	public function form()
	{
		$data['title'] = display('add_bill');
		#-------------------------------#
		$this->form_validation->set_rules(
		    'admission_id', display('admission_id'),
		    array(
		        'required',
			    array(
	                'admission_callable',
			        function($value)
			        {
						$rows = $this->db->select("admission_id")
			             	->from("bill_admission")
			             	->where("admission_id", $value)
			             	->get()
			             	->num_rows();

			            if ($rows>0) 
			            {
			            	return true;
			            }
			            else 
			            {
			            	$this->form_validation->set_message('admission_callable', 'The {field} is not valid!');
	                       
			            	return false;
			            }
			        }
			    )
		    )
		);
 
		$this->form_validation->set_rules('bill_date', display('bill_date'),'required|max_length[10]');
		$this->form_validation->set_rules('total', display('total'),'required|max_length[11]');
		$this->form_validation->set_rules('payment_method', display('payment_method'),'required|max_length[255]'); 
		$this->form_validation->set_rules('note', display('note'),'max_length[1024]');

		#-------------------------------#
		$bill_id = 'BL'.$this->randStrGen(2, 7);
		$admission_id = $this->input->post('admission_id');
		$package_id   = $this->input->post('package_id');
		#-------------------------------#
		$data['bill'] = (object)$postData = array(
			'bill_id'      => $bill_id, 
			'bill_type'    => 'ipd', 
			'bill_date'    => date('Y-m-d', strtotime($this->input->post('bill_date'))),
			'admission_id' => $admission_id, 
			'discount'     => $this->input->post('discount'), 
			'tax'          => $this->input->post('tax'), 
			'total'        => $this->input->post('total'), 
			'payment_method' => $this->input->post('payment_method'),   
			'card_cheque_no' => $this->input->post('card_cheque_no'),
			'receipt_no'     => $this->input->post('receipt_no'),
			'note'           => $this->input->post('note'),
			'date'           => date('Y-m-d H:i:s'),
			'status'       => $this->input->post('status'),
		);  

		#-------------------------------#
		if ($this->form_validation->run()) {

			if ($this->bill_model->create($postData)) {


				#------------bill details--------------#
				$sID   = $this->input->post('service_id');
				$sName = $this->input->post('service_name');
				$sQty  = $this->input->post('quantity');
				$sAmt  = $this->input->post('amount');
				$services = array();
				for ($i=0; $i < sizeof($sID); $i++)
				{
					if(!empty($sID[$i]))  
					$this->db->insert('bill_details', array(
						'bill_id' 	   => $bill_id,
						'admission_id' => $admission_id,
						'package_id'   => $package_id,
						'service_id'   => $sID[$i],
						'quantity'     => $sQty[$i],
						'amount'       => $sAmt[$i],
						'date'         => date('Y-m-d')
					));
				} 
				#-------------------------------#

				$this->session->set_flashdata('message', display('save_successfully'));

				if ($postData['status']==1)
				{
					redirect("billing/bill/view/".$postData['bill_id']);
				}

			} 
			else 
			{
				$this->session->set_flashdata('exception', display('please_try_again'));
			} 
			redirect('billing/bill/form/');
		} else {  
			$data['service_list'] = $this->service_model->readList();
			$data['content'] = $this->load->view('billing/bill/form',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}



	public function view($bill_id = null)
	{
		$data['title'] = display('bill_details');
		$data['bill'] = $this->bill_model->bill_by_id($bill_id);
		$data['services'] = $this->bill_model->services_by_id($bill_id);  
		$data['advance'] = $this->bill_model->advance_payment($bill_id);  
		$data['website'] = $this->bill_model->website();  
		$data['content'] = $this->load->view('billing/bill/view',$data,true);
		$this->load->view('layout/main_wrapper',$data);
	}




	public function edit($bill_id = null)
	{
		#-------------------------------#
		$this->form_validation->set_rules(
		    'admission_id', display('admission_id'),
		    array(
		        'required',
			    array(
	                'admission_callable',
			        function($value)
			        {
						$rows = $this->db->select("admission_id")
			             	->from("bill_admission")
			             	->where("admission_id", $value)
			             	->get()
			             	->num_rows();

			            if ($rows>0) 
			            {
			            	return true;
			            }
			            else 
			            {
			            	$this->form_validation->set_message('admission_callable', 'The {field} is not valid!');
	                       
			            	return false;
			            }
			        }
			    )
		    )
		);

		$this->form_validation->set_rules('bill_date', display('bill_date'),'required|max_length[10]');
		$this->form_validation->set_rules('total', display('total'),'required|max_length[11]');
		$this->form_validation->set_rules('payment_method', display('payment_method'),'required|max_length[255]'); 
		$this->form_validation->set_rules('note', display('note'),'max_length[1024]');

		#-------------------------------#
		$admission_id = $this->input->post('bill_id');
		$admission_id = $this->input->post('admission_id');
		$package_id   = $this->input->post('package_id');
		#-------------------------------#
		$data['bill'] = (object)$postData = array(
			'bill_id'      => $bill_id, 
			'bill_type'    => 'ipd', 
			'bill_date'    => date('Y-m-d', strtotime($this->input->post('bill_date'))),
			'admission_id' => $admission_id, 
			'discount'     => $this->input->post('discount'), 
			'tax'          => $this->input->post('tax'), 
			'total'        => $this->input->post('total'), 
			'payment_method' => $this->input->post('payment_method'),   
			'card_cheque_no' => $this->input->post('card_cheque_no'),
			'receipt_no'     => $this->input->post('receipt_no'),
			'note'           => $this->input->post('note'),
			'date'           => date('Y-m-d H:i:s'),
			'status'       => $this->input->post('status'),
		);  

		#-------------------------------#
		if ($this->form_validation->run()) 
		{


			if ($this->bill_model->delete($bill_id))
			{
				if ($this->bill_model->create($postData)) 
				{
					#------------bill details--------------#
					$sID   = $this->input->post('service_id');
					$sName = $this->input->post('service_name');
					$sQty  = $this->input->post('quantity');
					$sAmt  = $this->input->post('amount');
					$services = array();
					for ($i=0; $i < sizeof($sID); $i++)
					{
						if(!empty($sID[$i]))  
						$this->db->insert('bill_details', array(
							'bill_id' 	   => $bill_id,
							'admission_id' => $admission_id,
							'package_id'   => $package_id,
							'service_id'   => $sID[$i],
							'quantity'     => $sQty[$i],
							'amount'       => $sAmt[$i],
							'date'         => date('Y-m-d')
						));
					} 
					#-------------------------------#

					$this->session->set_flashdata('message', display('save_successfully'));

					if ($postData['status']==1)
					{
						redirect("billing/bill/view/".$postData['bill_id']);
					}
				} 
				else 
				{
					$this->session->set_flashdata('exception', display('please_try_again'));
				} 
			} 
			else
			{
				$this->session->set_flashdata('exception', display('please_try_again'));

			}

			redirect('billing/bill/edit/'.$postData['bill_id']);
		} else {   
			$data['title'] = display('update_bill');
			$data['bill'] = $this->bill_model->bill_by_id($bill_id);
			$data['services'] = $this->bill_model->services_by_id($bill_id); 
			$data['advance'] = $this->bill_model->advance_payment($bill_id); 
			$data['service_list'] = $this->service_model->readList(); 
			$data['content'] = $this->load->view('billing/bill/edit',$data,true);
			$this->load->view('layout/main_wrapper',$data);
		} 
	}

  

    public function delete($id = null) 
    {
        if ($this->bill_model->delete($id)) {
            #set success message
            $this->session->set_flashdata('message', display('delete_successfully'));
        } else {
            #set exception message
            $this->session->set_flashdata('exception', display('please_try_again'));
        }
		redirect('billing/bill/index');
    }




    /*
    |----------------------------------------------
    |        id genaretor
    |----------------------------------------------     
    */
    public function randStrGen($mode = null, $len = null)
    {
        $result = "";
        if($mode == 1):
            $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        elseif($mode == 2):
            $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        elseif($mode == 3):
            $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        elseif($mode == 4):
            $chars = "0123456789";
        endif;

        $charArray = str_split($chars);
        for($i = 0; $i < $len; $i++) {
                $randItem = array_rand($charArray);
                $result .="".$charArray[$randItem];
        }
        return $result;
    }
    /*
    |----------------------------------------------
    |         Ends of id genaretor
    |----------------------------------------------
    */






	/*
	*------------------------------------------------------------
	* 
	*  BILL AJAX REQUEST 
	*
	*------------------------------------------------------------
	*/

	public function getInformation()
	{
		$aid = $this->input->post('admission_id');
		$data = array();

		/*--------------patient informatoin-----------------*/
		$info = $this->db->select("
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
				bp.discount as discount,
				bp.services as services
			")
			->from("bill_admission AS ba")
			->join("patient AS pa", "pa.patient_id = ba.patient_id", "left")
			->join("user AS dr", "dr.user_id = ba.doctor_id", "left")
			->join("inc_insurance AS in", "in.id = ba.insurance_id", "left")
			->join("bill_package AS bp", "bp.id = ba.package_id", "left")
			->where("ba.admission_id", $aid)
			->get(); 

		if ($info->num_rows()>0)
		{
			$data['status'] = true;
			$data['result'] = $info->row();
		} 
		else 
		{
			$data['status'] = false;
			$data['result'] = "Invalid AID!";
		}
		/*--------------patient informatoin-----------------*/



		/*--------------advance payment-----------------*/
		$advance = $this->db->select("
			DATE(date) AS date, 
			receipt_no, 
			amount
			")
			->from("bill_advanced")
			->where("admission_id",$aid)
			->get();


		$pay_advance = 0;
		if ($advance->num_rows()>0)
		{
			$result = "";
			foreach ($advance->result() as $adv) {
				$result .= "<tr>";
				$result .= "<td>$adv->date</td>";
				$result .= "<td>$adv->receipt_no</td>";
				$result .= "<td>$adv->amount</td>";
				$result .= "</tr>";
				$pay_advance = $pay_advance + $adv->amount;
			} 
			$data['pay_advance'] = $pay_advance;
			$data['advance_data'] = $result;
		}
		else 
		{
			$data['pay_advance']  = $pay_advance;
			$data['advance_data'] = "<tr><td colspan=\"3\" align=\"center\">No record found!</td></tr>";
		}
		/*--------------advance payment-----------------*/
 
		echo json_encode($data);
	}


}
