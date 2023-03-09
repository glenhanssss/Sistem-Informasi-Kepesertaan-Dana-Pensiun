<?php
$nip = $_GET['nip'];  
$nominal_phdp = $_GET['nominal_phdp'];  
$query = mysqli_query($koneksi, "SELECT * FROM iuran WHERE nip='$nip' AND nominal_phdp='$nominal_phdp' ");
$view = mysqli_fetch_array($query);
?>
<section class="content">
  <div class="container-fluid">
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Detail Data Iuran</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form method='get' action='update/update_data_iuran.php'>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>NIP</label>
                          <select class="custom-select" placeholder="NIP" name="nip" disabled> 
                              <option value ="<?php echo $view['nip'] ; ?>" selected><?php echo $view['nip'] ; ?></option>
                              <?php  
                              $query = mysqli_query($koneksi, "SELECT * FROM phdp") or die(mysqli_error($koneksi));
                              while($data = mysqli_fetch_array($query)){
                                echo "<option value=$data[nip]> $data[nip] </option>";
                              }  
                              ?>
                          </select>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Nominal PHDP</label>
                        <input type="number" class="form-control" placeholder="Nominal PHDP" name='nominal_phdp' onchange="setTwoNumberDecimal" step="0.01" value="<?php echo $view['nominal_phdp']; ?>" disabled>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Iuran Peserta 6%</label>
                        <input class="form-control" name='iuran_peserta_6' value="<?php echo $view['iuran_peserta_6']; ?>" disabled>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Iuran Pemberi Kerja 12.4%</label>
                        <input class="form-control" name='iuran_pemberi_kerja_12koma4' value="<?php echo $view['iuran_pemberi_kerja_12koma4']; ?>" disabled>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Iuran Lain-lain 1.6%</label>
                        <input class="form-control" name='iuran_lain_lain_1koma6' value="<?php echo $view['iuran_lain_lain_1koma6']; ?>" disabled>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Iuran Total</label>
                        <input class="form-control" name='iuran_total' value="<?php echo $view['iuran_total']; ?>" disabled>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Bulan</label>
                        <input class="form-control" placeholder="Bulan" name='bulan' value="<?php echo $view['bulan']; ?>" disabled>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tahun</label>
                        <input class="form-control" placeholder="Tahun" name='tahun' value="<?php echo $view['tahun']; ?>" disabled>
                      </div>
                    </div>
                  </div>    
                <!-- <button type="submit" class="btn btn-sm btn-info">Simpan</button>   -->
                </form>
              </div>
              <!-- /.card-body -->
            </div>
  </div>
</section>          

