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
$query = mysqli_query($koneksi, "INSERT INTO `peserta`(`nip`, `nama`, `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`,`tanggal_pensiun`) VALUES ('$nip','$nama','$unit_kerja','$gender','$status_kawin','$tanggungan_anak','$tanggal_lahir','$tanggal_peserta','$tanggal_pensiun')");
header('Location: ../index.php?page=data-peserta');
?>