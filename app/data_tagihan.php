<?php  
include('../conf/config.php'); 
$bulan=$_GET['bulan'];
$tahun=$_GET['tahun'];
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=Iuran_bulanan.xls"); 
?>
<h3 class="card-title">Tagihan Iuran Bulan <?php echo $bulan; ?> Tahun <?php echo $tahun; ?></h3>
<table border ="1" id="example1" class="table table-bordered table-striped">
<thead>
<tr>
  <th>No</th>
  <th>NIP</th>
  <th>Nominal PhDP</th>
  <th>Iuran Peserta 6%</th>
  <th>Iuran Pemberi Kerja 12.4%</th>
  <th>Iuran Lain-lain 1.6%</th>
  <th>Iuran Total</th>
  <th>Bulan</th>
  <th>Tahun</th>
</tr>
</thead>
<tbody>
  <?php
      $no = 0;  
      if(isset($_GET['bulan']) && isset($_GET['tahun'])){
        $bulan=$_GET['bulan'];
        $tahun=$_GET['tahun'];
        $query = mysqli_query($koneksi, "SELECT * FROM iuran WHERE bulan=$bulan and tahun=$tahun");
      }
      else{
        $query = mysqli_query($koneksi, "SELECT * FROM iuran");
      }
      while($iur = mysqli_fetch_array($query)){
        $no++
  ?>
<tr>
  <td><?php echo $no; ?></td>
  <td><?php echo $iur['nip']; ?></td>
  <td><?php echo $iur['nominal_phdp']; ?></td>
  <td><?php echo $iur['iuran_peserta_6']; ?></td>
  <td><?php echo $iur['iuran_pemberi_kerja_12koma4']; ?></td>
  <td><?php echo $iur['iuran_lain_lain_1koma6']; ?></td>
  <td><?php echo $iur['iuran_total']; ?></td>
  <td><?php echo $iur['bulan']; ?></td>
  <td><?php echo $iur['tahun']; ?></td>
</tr>
<?php  } ?>
</tbody>
</table>