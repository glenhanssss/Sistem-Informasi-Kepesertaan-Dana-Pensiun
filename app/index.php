<!DOCTYPE html>
<html lang="en">
<?php 
session_start();
if(!$_SESSION['nama']){
  header('Location: ../index.php?session=expired');
}
include('header.php'); ?>
<?php include('../conf/config.php'); ?>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <?php include('preloader.php'); ?>

  <!-- Navbar -->
  <?php include('navbar.php'); ?>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <?php include('logo.php'); ?>

    <!-- Sidebar -->
    <?php include('sidebar.php'); ?>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <?php include('content_header.php'); ?>
    <!-- /.content-header -->

    <!-- Main content -->
    <?php
    if (isset($_GET['page'])){
      if ($_GET['page']=='dashboard'){
        include('dashboard.php');
      }
      else if ($_GET['page']=='data-peserta'){
        include('data_peserta.php');
      }
      else if ($_GET['page']=='edit-data'){
        include('edit/edit_data.php');
      }
      else if ($_GET['page']=='data-phdp'){
        include('data_phdp.php');
      }
      else if ($_GET['page']=='edit-data-phdp'){
        include('edit/edit_data_phdp.php');
      }
      else if ($_GET['page']=='data-iuran'){
        include('data_iuran.php');
      }
      // else if ($_GET['page']=='detail-data-iuran'){
      //   include('edit/detail_data_iuran.php');
      // }
      else if ($_GET['page']=='data-tagihan'){
        include('data_tagihan.php');
      }
      else if ($_GET['page']=='data-iuran-per-peserta'){
        include('data_iuran_per_peserta.php');
      }
      else if ($_GET['page']=='hitung-data-phdp'){
        include('rekap_iuran_per_peserta/rekap_iuran_per_peserta.php');
      }
      else {
      include('not_found.php');
      }
    }
    else {
      include('dashboard.php');
    }
    ?>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <?php include('footer.php'); ?>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

</body>
</html>
