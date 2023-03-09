<?php
include('../../conf/config.php'); 
$nip = $_GET['nip']; 
$nama = $_GET['nama']; 
$unit_kerja = $_GET['unit_kerja']; 
$gender = $_GET['gender']; 
$status_kawin = $_GET['status_kawin']; 
$tanggungan_anak = $_GET['tanggungan_anak']; 
$tanggal_lahir = $_GET['tanggal_lahir']; 
$tanggal_peserta = $_GET['tanggal_peserta'];
$tanggal_pensiun = $_GET['tanggal_pensiun'];
$query = mysqli_query($koneksi, "UPDATE `peserta` SET `nip`='$nip',`nama`='$nama',`unit_kerja`='$unit_kerja',`gender`='$gender',`status_kawin`='$status_kawin',`tanggungan_anak`='$tanggungan_anak',`tanggal_lahir`='$tanggal_lahir',`tanggal_peserta`='$tanggal_peserta',`tanggal_pensiun`='$tanggal_pensiun' WHERE nip='$nip'");
// $query = mysqli_query($koneksi, "UPDATE `peserta` SET `nip`='$nip',`nama`='$nama',`unit_kerja`='$unit_kerja'WHERE nip='$nip'");
header('Location: ../index.php?page=data-peserta');
?>
<!-- $query = mysqli_query($koneksi, "UPDATE `peserta` SET `nip`='$nip',`nama`='$nama',`unit_kerja`='$unit_kerja',`gender`='$gender',`status_kawin`='$status_kawin',`tanggungan_anak`='$tanggungan_anak',`tanggal_lahir`='$tanggal_lahir',`tanggal_peserta`='$tanggal_peserta' WHERE nip='$nip'"); -->