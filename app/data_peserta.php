
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- /.card -->

            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">PESERTA</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-lg">
                  Tambah Data Peserta
                </button>
                <br></br>
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
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
                    <th>Tanggal Pensiun</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    <?php
                    $no = 0;  
                    $query = mysqli_query($koneksi, "SELECT * FROM peserta");
                    while($psrt = mysqli_fetch_array($query)){
                      $no++
                    ?>
                  <tr>
                    <td><?php echo $no; ?></td>
                    <td><?php echo $psrt['nip']; ?></td>
                    <td><?php echo $psrt['nama']; ?></td>
                    <td><?php echo $psrt['unit_kerja']; ?></td>
                    <td><?php echo $psrt['gender']; ?></td>
                    <td><?php echo $psrt['status_kawin']; ?></td>
                    <td><?php echo $psrt['tanggungan_anak']; ?></td>
                    <td><?php echo $psrt['tanggal_lahir']; ?></td>
                    <td><?php echo $psrt['tanggal_peserta']; ?></td>
                    <td><?php echo $psrt['tanggal_pensiun']; ?></td>
                    <td>
                      <a onclick="hapus_data(<?php echo $psrt['nip']; ?>)" class="btn btn-sm btn-danger">Hapus</a>
                      <a href="index.php?page=edit-data&&nip=<?php echo $psrt['nip']; ?>" class="btn btn-sm btn-warning">Ubah</a>
                    </td>  
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
                    <th>Tanggal Pensiun</th>
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
              <h4 class="modal-title">Form Input Data Peserta</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form method="get" action="add/tambah_data.php">
            <div class="modal-body">              
                <div class="form-col">
                  <div class="col">
                    <label>NIP</label>
                    <input type="text" class="form-control" placeholder="NIP" name="nip" required>
                  </div>
                  <div class="col">
                    <label>Nama</label>
                    <input type="text" class="form-control" placeholder="Nama" name="nama" required>
                  </div>
                  <div class="col">
                      <label>Unit Kerja</label>
                      <select class="custom-select" placeholder="Unit Kerja" name="unit_kerja">
                          <option selected>Unit Kerja..</option>
                          <option value="FSM">FSM</option>
                          <option value="FKIP">FKIP</option>
                          <option value="FTI">FTI</option>
                          <option value="FEB">FEB</option>
                      </select>
                  </div>
                  <div class="col">
                      <label>Jenis Kelamin</label>
                      <select class="custom-select" placeholder="Jenis Kelamin" name="gender">
                          <option selected>Jenis Kelamin..</option>
                          <option value="Pria">Pria</option>
                          <option value="Wanita">Wanita</option>
                      </select>
                  </div>
                  <div class="col">
                      <label>Status Kawin</label>
                      <select class="custom-select" placeholder="Status Kawin" name="status_kawin">
                            <option selected>Status Kawin..</option>
                            <option value="Kawin">Kawin</option>
                            <option value="Tidak Kawin">Tidak Kawin</option>
                      </select>
                  </div>
                  <div class="col">
                      <label>Tanggungan Anak</label>
                      <select class="custom-select" placeholder="Tanggungan Anak" name="tanggungan_anak">
                            <option selected>Tanggungan Anak..</option>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                      </select>
                  </div>
                  <div class="col">
                    <label>Tanggal Lahir</label>
                    <input type="date" class="form-control" placeholder="Tanggal Lahir" name="tanggal_lahir">
                  </div>
                  <div class="col">
                    <label>Tanggal Menjadi Peserta</label>
                    <input type="date" class="form-control" placeholder="Tanggal Peserta" name="tanggal_peserta">
                  </div>
                  <div class="col">
                    <label>Tanggal Pensiun</label>
                    <input type="date" class="form-control" placeholder="Tanggal Pensiun" name="tanggal_pensiun">
                  </div>
                </div>   
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Tutup</button>
              <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
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