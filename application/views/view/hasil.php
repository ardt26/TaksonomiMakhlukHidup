<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<?= base_url(); ?>/src/style/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<?= base_url(); ?>/src/style/style.css">
</head>
<body class="background">
<nav class="navbar navbar-expand-lg navbar-light">
	<a class="navbar-brand" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="<?= base_url('TControl/index'); ?>">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<?= base_url('TControl/initialData'); ?>">Initial Data</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<?= base_url('TControl/newData'); ?>">Searched Data</a>
			</li>
		</ul>
	</div>
</nav>

<div align="center" class="mt-4">
	<h1>Let's identified what do you want!</h1>
</div>

<div class="container jumbotron" >
	<form action="<?= base_url('TControl/index'); ?>">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Nama</label>
			<div class="col-sm-10">
				<input type="text" name="nama" class="form-control" value="<?= $hasil['nama_spesies'] ?>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Hasil Identifikasi</label>
			<?php
				$jenisSpesies = "";
				foreach ($datas->result_object() as $data) :
					if ($data->hasil_id == $hasil['hasil_id']){
						$jenisSpesies = $data->hasil_detail;
					}
				endforeach;
			?>
			<div class="col-sm-10">
				<input type="text" name="nama" class="form-control" value="<?= $jenisSpesies ?>" readonly>
			</div>
		</div>

		<center>
			<button type="submit" class="button-left" style="vertical-align:middle">
				<span>Back</span>
			</button>
		</center>

	</form>
</div>
</body>
</html>
