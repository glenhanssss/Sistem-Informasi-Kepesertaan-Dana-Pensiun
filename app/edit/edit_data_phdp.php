<?php
$nip = $_GET['nip'];  
$query = mysqli_query($koneksi, "SELECT * FROM phdp WHERE nip='$nip'");
$view = mysqli_fetch_array($query);
?>
<section class="content">
  <div class="container-fluid">
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Ubah Data PHDP</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form method='get' action='update/update_data_phdp.php'>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>NIP</label>
                          <select class="custom-select" placeholder="NIP" name="nip">
                              <option value ="<?php echo $view['nip'] ; ?>" selected><?php echo $view['nip'] ; ?></option>
                              <?php  
                              $query = mysqli_query($koneksi, "SELECT * FROM peserta") or die(mysqli_error($koneksi));
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
                        <input type="number" class="form-control" placeholder="Nominal PHDP" name='nominal_phdp' onchange="setTwoNumberDecimal" step="0.01" value="<?php echo $view['nominal_phdp']; ?>">
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

