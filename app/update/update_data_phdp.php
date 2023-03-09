<?php
include('../../conf/config.php'); 
$nip = $_GET['nip']; 
$nominal_phdp = $_GET['nominal_phdp']; 
$query = mysqli_query($koneksi, "UPDATE phdp SET `nip`='$nip',`nominal_phdp`='$nominal_phdp' WHERE nip='$nip'");
header('Location: ../index.php?page=data-phdp');
?>