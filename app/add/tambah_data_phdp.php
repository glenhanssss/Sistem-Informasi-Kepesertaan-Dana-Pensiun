<?php
include('../../conf/config.php'); 
$nip = $_GET['nip']; 
$nominal_phdp = $_GET['nominal_phdp']; 
// $unit_kerja = $_GET['unit_kerja']; 
// $gender = $_GET['gender']; 
// $status_kawin = $_GET['status_kawin']; 
// $tanggungan_anak = $_GET['tanggungan_anak']; 
// $tanggal_lahir = $_GET['tanggal_lahir']; 
// $tanggal_peserta = $_GET['tanggal_peserta'];
$query = mysqli_query($koneksi, "INSERT INTO `phdp`(`nip`, `nominal_phdp`) VALUES ('$nip','$nominal_phdp')");
header('Location: ../index.php?page=data-phdp');
?>