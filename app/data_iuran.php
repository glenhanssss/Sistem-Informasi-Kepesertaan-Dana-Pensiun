<?php  
include('../conf/config.php'); 
?>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- /.card -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">IURAN</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-lg">
                  Periksa PhDP <?php echo date('M-Y'); ?>
                </button>
                <br></br>
                <table id="example1" class="table table-bordered table-striped">
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
                    $query = mysqli_query($koneksi, "SELECT * FROM iuran");
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
                  <tfoot>
                  <tr>
                    <th>No</th>
                    <th>NIP</th>
                    <th>Nama</th>
                    <th>Unit Kerja</th>
                    <th>Jenis Kelamin</th>
                    <th>Status Kawin</th>
                    <th>Tanggungan Anak</th>
                    <th>Tanggal Lahir</th>
                    <th>Tanggal Peserta</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>

<!-- Untuk Mencetak Tagihan sesuai Bulan dan Tahun -->
<section class="content">
  <div class="container-fluid">
    <div class="card card-success">
      <div class="card-header">
        <h3 class="card-title">Pencetakan Tagihan Iuran</h3>
      </div>
      <div class="card-body">
        <form method="get" action="data_tagihan.php">
          <font size="5" face="Arial" color="red">Pencetakan Tagihan Iuran bulanan berdasarkan Bulan dan Tahun berdasarkan inputan dalam bentuk file excel (*.xls)</font><br><br>
          <div class="form-col">
            <div class="col">
              <label>Input Bulan</label>
              <input type="text" class="form-control" placeholder="Bulan dalam angka" name="bulan" required>
            </div>
            <div class="col">
              <label>Input Tahun</label>
              <input type="text" class="form-control" placeholder="Tahun dalam angka" name="tahun" required>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="submit" class="btn btn-warning" name="cari">Cetak</button>
            </div>
          </div>  
        </form>
      </div>  
    </div>
  </div>
</section>

<!-- modal untuk menampilkan total PhDP & catat hitung iuran -->
<div class="modal fade" id="modal-lg">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">TOTAL PhDP <?php echo date('M-Y'); ?> adalah &nbsp;</h4>
          <h1 class="modal-title">
            <?php
              echo "Rp ";
              $query = mysqli_query($koneksi, "SELECT SUM(`nominal_phdp`) AS nominalphdp FROM phdp");
              $data=mysqli_fetch_array($query);
              echo "$data[nominalphdp]";  
            ?>
          </h1>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form method="get" action="add/pindah_data_phdp_ke_iuran.php">
            <div>
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>No</th>
                    <th>NIP</th>
                    <th>PHDP</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 0;  
                    $query = mysqli_query($koneksi, "SELECT * FROM phdp");
                    while($ph = mysqli_fetch_array($query)){
                      $no++
                    ?>
                  <tr>
                    <td><?php echo $no; ?></td>
                    <td><?php echo $ph['nip']; ?></td>
                    <td><?php echo $ph['nominal_phdp']; ?></td>
                    <td>
                      <a onclick="hapus_data(<?php echo $ph['nip']; ?>)" class="btn btn-sm btn-danger">Hapus</a>
                      <a href="index.php?page=edit-data-phdp&&nip=<?php echo $ph['nip']; ?>" class="btn btn-sm btn-warning">Ubah</a>
                    </td>  
                  </tr>
                  <?php  } ?>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>No</th>
                    <th>NIP</th>
                    <th>PHDP</th>
                    <th>Action</th>
                  </tr>
                  </tfoot>
                    <div class="modal-footer justify-content-between">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Tutup</button>
                      <label>
                        Untuk Mencatat dan Menghitung Iuran <?php echo date('M-Y'); ?> tekan tombol 'Yakin'
                      </label>
                      <button type="submit" class="btn btn-info" name="pindah"><b>Yakin</b></button>
                    </div>
                </table>
            </div>    
        </form>    
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script>
  function hapus_data(data_nip){
    // alert('ok');
    // window.location=("delete/hapus_data.php?nip="+data_nip);
    Swal.fire({
      title: 'Yakin ingin menghapus data?',
      // showDenyButton: false,
      showCancelButton: true,
      confirmButtonText: 'Hapus Data',
      confirmButtonColor: 'Red',
      // denyButtonText: `Don't save`,
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        window.location=("delete/hapus_data.php?nip="+data_nip);
      }
    })
  }
</script>

<!-- /.MEMBUAT TANGGAL yyyy/mm/dd-->