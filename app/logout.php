<?php  
session_start();
// unset($_SESSION['nama']);
// unset($_SESSION['level']);
session_destroy();
header('Location:../');
?>