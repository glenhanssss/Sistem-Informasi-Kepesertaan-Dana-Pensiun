
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- /.card -->

            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title"> PHDP </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-lg">
                  Tambah Data PHDP
                </button>
                <br></br>
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
    <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Form Input Data PHDP</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form method="get" action="add/tambah_data_phdp.php">
            <div class="modal-body">              
                <div class="form-col">
                  <div class="col">
                      <label>NIP dari Peserta yang sudah tercatat pada <b>Halaman PESERTA</b></label>
                      <select class="custom-select" placeholder="NIP" name="nip" required>
                          <option selected>...</option>
                          <?php  
                          $query = mysqli_query($koneksi, "SELECT * FROM peserta") or die(mysqli_error($koneksi));
                          while($data = mysqli_fetch_array($query)){
                            echo "<option value=$data[nip]> $data[nip] </option>";
                          }  
                          ?>
                      </select>
                  </div>
                  <div class="col">
                    <label>Isi Nominal PhDP</label>
                    <input type="number" class="form-control" placeholder="Nominal PhDP" name="nominal_phdp" onchange="setTwoNumberDecimal" step="0.01" required>
                  </div>
                </div>   
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Tutup</button>
              <button type="submit" class="btn btn-primary" name="simpan">Simpan</button>
            </div>
          </div>
          </form>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>  

<!-- Membuat fungsi menghapus data-->
<script>
  function hapus_data(data_phdp){
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
        window.location=("delete/hapus_data_phdp.php?nip="+data_phdp);
      }
    })
  }
</script>

<!-- Membuat fungsi input number menjadi desimall 2 angka belakang koma-->
<!-- function setTwoNumberDecimal(event) {
    this.value = parseFloat(this.value).toFixed(2);
} -->