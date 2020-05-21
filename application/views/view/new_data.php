<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<?= base_url(); ?>/src/style/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<?= base_url(); ?>/src/style/style.css">
</head>
<body class="background">
<nav class="navbar navbar-expand-lg navbar-light bg-transparent">
	<a class="navbar-brand" href="<?= base_url('TControl'); ?>">SGAR</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="<?= base_url('TControl'); ?>">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<?= base_url('TControl/initialData'); ?>">Initial Data</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="<?= base_url('TControl/newData'); ?>">Searched Data</a>
			</li>
		</ul>
	</div>
</nav>
<div class="container my-1">
	<center>
		<h1>See all data has been searched</h1>
	</center>
	<table align="center" class="table table-hover my-2 table-bordered table-secondary" style="text-align: center;">
		<thead class="thead-dark">
		<th>Nomor</th>
		<th>Nama Spesies</th>
		<th>Hasil Identifikasi</th>
		</thead>
		<tbody>
		<?php
		$i = 1;
		foreach ($datas->result_object() as $data) :
			$jenisSpesies = "";
			foreach ($hasil->result_object() as $data1) :
				if ($data1->hasil_id == $data->hasil_id){
					$jenisSpesies = $data1->hasil_detail;
				}
			endforeach;
			?>
			<tr>
				<td><?= $i ?></td>
				<td><?= $data->nama_spesies ?></td>
				<td><?= $jenisSpesies ?></td>
			</tr>
			<?php $i++; endforeach;
			if ($i == 1){ ?>
				<tr>
					<td colspan="3">Belum Ada Data</td>
				</tr>
			<?php } ?>
		</tbody>
	</table>
</div>
</body>
</html>
