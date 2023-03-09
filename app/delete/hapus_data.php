<?php
include('../../conf/config.php'); 
$nip = $_GET['nip']; 
$query = mysqli_query($koneksi, "DELETE FROM `peserta` WHERE nip='$nip'");
header('Location: ../index.php?page=data-peserta');
?>