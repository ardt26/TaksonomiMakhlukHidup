<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="<?= base_url(); ?>/src/style/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<?= base_url(); ?>/src/style/style.css">
</head>
<body class="background">
<nav class="navbar navbar-expand-lg navbar-light">
	<a class="navbar-brand" href="<?= base_url('TControl'); ?>">SGAR</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="<?= base_url('TControl'); ?>">Home</a>
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
	<form method="POST" action="<?= base_url('TControl/identification'); ?>">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Nama</label>
			<div class="col-sm-10">
				<input type="text" name="nama" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Mendapat Nutrisi</label>
			<div class="col-sm-4">
				<select class="custom-select" name="nutrisi" required>
					<option selected disabled>Select</option>
					<?php foreach ($data1->result_object() as $data) : ?>
						<option value=<?= $data->id_nutrisi ?>><?= $data->detail_nutrisi ?></option>
					<?php endforeach; ?>
				</select>
			</div>

			<label class="col-sm-2 col-form-label"><center>Hidup di</center></label>
			<div class="col-sm-4">
				<select class="custom-select" name="hidup" required>
					<option selected disabled>Select</option>
					<?php foreach ($data3->result_object() as $data) : ?>
						<option value=<?= $data->hidup_id ?>><?= $data->hidup_detail ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Cara Reproduksi</label>
			<div class="col-sm-4">
				<select class="custom-select" name="reproduksi" required>
					<option selected disabled>Select</option>
					<?php foreach ($data6->result_object() as $data) : ?>
						<option value=<?= $data->kembang_id ?>><?= $data->kembang_detail ?></option>
					<?php endforeach; ?>
				</select>
			</div>

			<label class="col-sm-2 col-form-label"><center>Cara Bernapas</center></label>
			<div class="col-sm-4">
				<select class="custom-select" name="napas" required>
					<option selected disabled>Select</option>
					<?php foreach ($data7->result_object() as $data) : ?>
						<option value=<?= $data->napas_id ?>><?= $data->napas_detail ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Ukuran Mikroskopis</label>
			<div class="col-sm-4">
				<select class="custom-select" name="mikro" required>
					<option selected disabled>Select</option>
					<?php foreach ($data5->result_object() as $data) : ?>
						<option value=<?= $data->id_mikroskopis ?>><?= $data->detail_mikroskopis ?></option>
					<?php endforeach; ?>
				</select>
			</div>

			<label class="col-sm-2 col-form-label"><center>Inti Sel</center></label>
			<div class="col-sm-4">
				<select class="custom-select" name="inti" required>
					<option selected disabled>Select</option>
					<?php foreach ($data4->result_object() as $data) : ?>
						<option value=<?= $data->id_inti_sel ?>><?= $data->detail_inti_sel ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>
		<div class="form-group row" align="center">
			<label class="col-sm-3 col-form-label"></label>
			<label class="col-sm-2 col-form-label">Ada Dinding Sel</label>
			<div class="col-sm-4">
				<select class="custom-select" name="dinding" required>
					<option selected disabled>Select</option>
					<?php foreach ($data2->result_object() as $data) : ?>
						<option value=<?= $data->id_dinding_sel ?>><?= $data->detail_dinding_sel ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>

		<center>
			<button type="submit" class="button-right" style="vertical-align:middle">
				<span>Add</span>
			</button>
		</center>

	</form>
</div>
</body>
</html>
