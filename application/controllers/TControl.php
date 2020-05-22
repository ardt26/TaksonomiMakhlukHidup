<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class TControl extends CI_Controller {

	public function identification(){
		$nama		= $this->input->post('nama');
		$nutrisi	= $this->input->post('nutrisi');
		$hidup		= $this->input->post('hidup');
		$reproduksi	= $this->input->post('reproduksi');
		$napas		= $this->input->post('napas');
		$mikro		= $this->input->post('mikro');
		$inti		= $this->input->post('inti');
		$dinding	= $this->input->post('dinding');

		$data2 = $this->TModel->getDataByTableName("pendataan");
		$row = $data2->result();
		$i = 0;
		$hasil[] = 0;
		$data3[][] = 0;
		$index[] = 0;
		foreach ($row as $datas) :
			$hasil[$i] =	sqrt(pow((double)$datas->napas_id - $napas,2) +
							pow((double)$datas->kembang_id - $reproduksi,2) +
							pow((double)$datas->hidup_id - $hidup,2) +
							pow((double)$datas->nutri_id - $nutrisi,2) +
							pow((double)$datas->dinding_sel_id - $dinding,2) +
							pow((double)$datas->inti_sel_id - $inti,2) +
							pow((double)$datas->mikroskopis_id - $mikro,2));
			$index[$i] = $i;

			$data3[$i][0] = $datas->nama_spesies;
			$data3[$i][1] = $datas->napas_id;
			$data3[$i][2] = $datas->kembang_id;
			$data3[$i][3] = $datas->hidup_id;
			$data3[$i][4] = $datas->nutri_id;
			$data3[$i][5] = $datas->dinding_sel_id;
			$data3[$i][6] = $datas->inti_sel_id;
			$data3[$i][7] = $datas->mikroskopis_id;
			$data3[$i][8] = $datas->hasil_id;
			$i++;
		endforeach;

		for ($j = 0; $j < $i; $j++){
			for ($k = $j+1; $k < $i; $k++) {
				if ($hasil[$j] > $hasil[$k]) {
					$temp = $hasil[$j];
					$hasil[$j] = $hasil[$k];
					$hasil[$k] = $temp;

					$temp2 = $index[$j];
					$index[$j] = $index[$k];
					$index[$k] = $temp2;

					$temp2 = $data3[$j];
					$data3[$j] = $data3[$k];
					$data3[$k] = $temp2;
				}
			}
		}

		for ($j = 0; $j < 3; $j++){
			$banyak[$j] = 0;
			for ($k = 0; $k < 3; $k++){
				if ($hasil[$j] == $hasil[$k]){
					$banyak[$j]++;
				}
			}
		}

		$nilaiMax = $banyak[0];
		$indexMax = 0;
		for ($j = 0; $j < 3; $j++){
			if ($banyak[$j] > $nilaiMax){
				$nilaiMax = $banyak[$j];
				$indexMax = $j;
			}
		}

		$hasilAkhir = $data3[$indexMax][8];

		$datax= array(
			'nama_spesies'		=> $nama,
			'napas_id'			=> $napas,
			'kembang_id'		=> $reproduksi,
			'hidup_id'			=> $hidup,
			'nutri_id'			=> $nutrisi,
			'dinding_sel_id'	=> $dinding,
			'inti_sel_id'		=> $inti,
			'mikroskopis_id'	=> $mikro,
			'hasil_id'			=> $hasilAkhir);
		$this->TModel->create($datax);

		$data['hasil']= array(
			'nama_spesies'		=> $nama,
			'napas_id'			=> $napas,
			'kembang_id'		=> $reproduksi,
			'hidup_id'			=> $hidup,
			'nutri_id'			=> $nutrisi,
			'dinding_sel_id'	=> $dinding,
			'inti_sel_id'		=> $inti,
			'mikroskopis_id'	=> $mikro,
			'hasil_id'			=> $hasilAkhir);
		$data['datas'] = $this->TModel->getDataByTableName("hasil");
		$this->load->view('view/hasil', $data);
	}

	public function index(){
		$data['data1'] = $this->TModel->getDataByTableName("cara_penuh_nutrisi");
		$data['data2'] = $this->TModel->getDataByTableName("dinding_sel");
		$data['data3'] = $this->TModel->getDataByTableName("hidup");
		$data['data4'] = $this->TModel->getDataByTableName("inti_sel");
		$data['data5'] = $this->TModel->getDataByTableName("mikroskopis");
		$data['data6'] = $this->TModel->getDataByTableName("reproduksi");
		$data['data7'] = $this->TModel->getDataByTableName("respirasi");
		$this->load->view('view/home', $data);
	}

	public function initialData(){
		$data['datas'] = $this->TModel->getAllData(0);
		$data['hasil'] = $this->TModel->getDataByTableName("hasil");
		$this->load->view('view/init_data',$data);
	}

	public function newData(){
		$data['datas'] = $this->TModel->getAllData(1);
		$data['hasil'] = $this->TModel->getDataByTableName("hasil");
		$this->load->view('view/new_data',$data);
	}
}
