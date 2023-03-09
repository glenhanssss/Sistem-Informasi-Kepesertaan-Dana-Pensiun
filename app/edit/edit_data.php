<?php
$nip = $_GET['nip'];  
$query = mysqli_query($koneksi, "SELECT * FROM peserta WHERE nip='$nip'");
$view = mysqli_fetch_array($query);
?>
<section class="content">
  <div class="container-fluid">
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Ubah Data Peserta</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form method='get' action='update/update_data.php'>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>NIP</label>
                        <input type="text" class="form-control" placeholder="NIP" name='nip' value="<?php echo $view['nip']; ?>">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Nama</label>
                        <input type="text" class="form-control" placeholder="Nama" name='nama' value="<?php echo $view['nama']; ?>">
                        <input type="text" class="form-control" placeholder="Nama" name='nip' value="<?php echo $view['nip']; ?>" hidden>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->                  
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Unit Kerja</label>
                        <select class="custom-select" placeholder="Unit Kerja" name="unit_kerja">
                          <option value="<?php echo $view['unit_kerja']; ?>" selected><?php echo $view['unit_kerja']; ?></option>
                          <option value="FSM">FSM</option>
                          <option value="FKIP">FKIP</option>
                          <option value="FTI">FTI</option>
                          <option value="FEB">FEB</option>
                      </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Jenis Kelamin</label>
                        <select class="custom-select" placeholder="Jenis Kelamin" name="gender">
                          <option value="<?php echo $view['gender']; ?>" selected><?php echo $view['gender']; ?></option>
                          <option value="Pria">Pria</option>
                          <option value="Wanita">Wanita</option>
                        </select>
                      </div>
                    </div> 
                  </div>
                  <!-- 1 baris form -->                  
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Status Kawin</label>
                        <select class="custom-select" placeholder="Status Kawin" name="status_kawin">
                          <option value="<?php echo $view['status_kawin']; ?>" selected><?php echo $view['status_kawin']; ?></option>
                          <option value="Kawin">Kawin</option>
                          <option value="Tidak Kawin">Tidak Kawin</option>
                        </select>
                      </div>
                    </div> 
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggungan Anak</label>
                        <select class="custom-select" placeholder="Tanggungan Anak" name="tanggungan_anak">
                          <option value="<?php echo $view['tanggungan_anak']; ?>" selected><?php echo $view['tanggungan_anak']; ?></option>
                          <option value="0">0</option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                        </select>
                      </div>
                    </div> 
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggal Lahir</label>
                        <input type="date" class="form-control" placeholder="Tanggal Lahir" name='tanggal_lahir' value="<?php echo $view['tanggal_lahir']; ?>">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggal Menjadi Peserta</label>
                        <input type="date" class="form-control" placeholder="Tanggal Peserta" name='tanggal_peserta' value="<?php echo $view['tanggal_peserta']; ?>">
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggal Pensiun</label>
                        <input type="date" class="form-control" placeholder="Tanggal Pensiun" name='tanggal_pensiun' value="<?php echo $view['tanggal_pensiun']; ?>">
                      </div>
                    </div>
                  </div>     
                <button type="submit" class="btn btn-sm btn-info">Simpan</button>  
                </form>
              </div>
              <!-- /.card-body -->
            </div>
  </div>
</section>          