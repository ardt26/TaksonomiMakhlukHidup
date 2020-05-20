<?php

class TModel extends CI_Model {

	public function create($data)
	{
		// Ini buat insert data ke dalam database
		$query = $this->db->insert('pendataan', $data);
		return $query;
	}

	public function getAllData($cek)
	{
		$this->db->select('*');
		$this->db->from('pendataan');
		$this->db->join('hasil', 'pendataan.hasil_id = hasil.hasil_id');
		$this->db->where('pendataan.cek', $cek);
		$query = $this->db->get();

		//$query = $db->query('SELECT * FROM pendataan JOIN hasil ON pendataan.hasil_id = hasil.hasil_id  WHERE pendataan.cek = $cek');
		return $query;
	}

	public function getDataByTableName($tableName){
		//$query = $this->db->select('*')->from('pendataan')->get()->result_object();
		$query = $this->db->get($tableName);
		return $query;
	}

}
