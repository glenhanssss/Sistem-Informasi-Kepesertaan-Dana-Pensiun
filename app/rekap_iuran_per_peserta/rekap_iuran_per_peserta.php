<?php
$nip = $_GET['nip'];  
$query = mysqli_query($koneksi, "SELECT * FROM peserta WHERE nip='$nip'");
$view = mysqli_fetch_array($query);
?>
<section class="content">
  <div class="container-fluid">
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Rekap Data per-Peserta & Rekap Iuran per-Peserta</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <form method='get' action='update/update_data.php'>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>NIP</label>
                        <input type="text" class="form-control" placeholder="NIP" name='nip' value="<?php echo $view['nip']; ?>" disabled>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Nama</label>
                        <input type="text" class="form-control" placeholder="Nama" name='nama' value="<?php echo $view['nama']; ?>" disabled>
                        <input type="text" class="form-control" placeholder="Nama" name='nip' value="<?php echo $view['nip']; ?>" hidden>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->                  
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Unit Kerja</label>
                        <select class="custom-select" placeholder="Unit Kerja" name="unit_kerja" disabled>
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
                        <select class="custom-select" placeholder="Jenis Kelamin" name="gender" disabled>
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
                        <select class="custom-select" placeholder="Status Kawin" name="status_kawin" disabled>
                          <option value="<?php echo $view['status_kawin']; ?>" selected><?php echo $view['status_kawin']; ?></option>
                          <option value="Kawin">Kawin</option>
                          <option value="Tidak Kawin">Tidak Kawin</option>
                        </select>
                      </div>
                    </div> 
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggungan Anak</label>
                        <select class="custom-select" placeholder="Tanggungan Anak" name="tanggungan_anak" disabled>
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
                        <input type="date" class="form-control" placeholder="Tanggal Lahir" name='tanggal_lahir' value="<?php echo $view['tanggal_lahir']; ?>" disabled>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggal Menjadi Peserta</label>
                        <input type="date" class="form-control" placeholder="Tanggal Peserta" name='tanggal_peserta' value="<?php echo $view['tanggal_peserta']; ?>" disabled>
                      </div>
                    </div>
                  </div>
                  <!-- 1 baris form -->
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Tanggal Pensiun</label>
                        <input type="date" class="form-control" placeholder="Tanggal Pensiun" name='tanggal_pensiun' value="<?php echo $view['tanggal_pensiun']; ?>" disabled>
                      </div>
                    </div>
                  </div>     
                </form><br>

                <!-- Menampilkan List Iuran -->
                <label>Rekap Iuran</label>
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
                    $query = mysqli_query($koneksi, "SELECT * FROM iuran WHERE nip='$nip'");
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
                    <th>Nominal PhDP</th>
                    <th>Iuran Peserta 6%</th>
                    <th>Iuran Pemberi Kerja 12.4%</th>
                    <th>Iuran Lain-lain 1.6%</th>
                    <th>Iuran Total</th>
                    <th>Bulan</th>
                    <th>Tahun</th>
                  </tr>
                  </tfoot>
                </table><br><br>

              </div>
              <!-- /.card-body -->
            </div>
  </div>
</section>

<section class="content">
  <div class="container-fluid">
    <div class="card card-success">
      <div class="card-header">
        <h3 class="card-title">Penghitungan Manfaat Pensiun</h3>
      </div>
      <div class="card-body">

      <!-- Menampilkan Masa Kerja -->
      <div class="card">
        <div class="card-body">
          <h4>
            <label>
              Masa Kerja = <?php echo $view['masa_kerja']; ?> tahun
            </label>
          </h4>
          <label>
            *Tanggal Pensiun = <?php echo $view['tanggal_pensiun']; ?>
          </label><br>
          <label>
            *Tanggal menjadi Peserta = <?php echo $view['tanggal_lahir']; ?>
          </label>
        <br>
        </div>
      </div>

      <!-- Menampilkan Faktor Penghargaan Masa Kerja -->
      <div class="card">
        <div class="card-body">
          <h4>
            <label>
              Faktor Penghargaan Masa Kerja =
              <?php  
                if ($view['masa_kerja'] > "35"){
                  $a=10*(2/100);
                  $b=10*(2.25/100);
                  $c=15*(2.5/100);
                  echo $a+$b+$c;
                }
                else if ($view['masa_kerja'] > "20"){
                  $a=10*(2/100);
                  $b=10*(2.25/100);
                  $c=($view['masa_kerja']-20)*(2.5/100);
                  echo $a+$b+$c;
                }
                else if ($view['masa_kerja'] > "10"){
                  $a=10*(2/100);
                  $b=($view['masa_kerja']-10)*(2.25/100);
                  echo $a+$b;
                }
                else if ($view['masa_kerja'] > "0"){
                  $a=($view['masa_kerja'])*(2/100);
                  echo $a;
                }
                else {
                  echo "Error";
                }
              ?>
            </label>
          </h4>
          <label>
            <?php  
              if ($view['masa_kerja'] > "35"){
                $a=10*(2/100);
                $b=10*(2.25/100);
                $c=15*(2.5/100);
                echo "(Faktor Penghargaan Masa Kerja Maksimal Adalah 35 tahun sebesar 0.8) </br>" ;
                echo "Rincian: </br>" ;
                echo "*10 tahun pertama = $a </br>" ;
                echo "*10 tahun kedua = $b </br>" ;
                echo "*15 tahun terakhir  = $c" ;
              }
              else if ($view['masa_kerja'] > "20"){
                $a=10*(2/100);
                $b=10*(2.25/100);
                $c=($view['masa_kerja']-20)*(2.5/100);
                $t20 = $view['masa_kerja']-20;
                echo "(faktor penghargaan maksimal adalah 35 tahun sebesar 0.8) </br>" ;
                echo "Rincian: </br>" ;
                echo "*10 tahun pertama = $a </br>" ;
                echo "*10 tahun kedua = $b </br>" ;
                echo "*$t20 tahun terakhir = $c" ;
              }
              else if ($view['masa_kerja'] > "10"){
                $a=10*(2/100);
                $b=($view['masa_kerja']-10)*(2.25/100);
                $t10 = $view['masa_kerja']-10;
                echo "(faktor penghargaan maksimal adalah 35 tahun sebesar 0.8) </br>" ;
                echo "Rincian: </br>" ;
                echo "*10 tahun pertama = $a </br>" ;
                echo "*$t10 tahun terakhir = $b" ;
              }
              else if ($view['masa_kerja'] > "0"){
                $a=($view['masa_kerja'])*(2/100);
                $t0 = $view['masa_kerja'];
                echo "(faktor penghargaan maksimal adalah 35 tahun sebesar 0.8) </br>" ;
                echo "Rincian: </br>" ;
                echo "*$t0 tahun terakhir = $a";
              }
              else {
                echo "Error";
              }
            ?>
          </label>
        </div>
      </div>

      <!-- Menghitung Rata-rata PhDP 12 bulan terakhir -->
      <div class="card">
        <div class="card-body">
          <h4>
            <label>
              Rata-rata PhDP 12 bulan terakhir = 
              <?php
                echo "Rp ";
                $query = mysqli_query($koneksi, "SELECT AVG(nominal_phdp) AS `rerata12` FROM (SELECT nominal_phdp FROM iuran WHERE nip=$nip ORDER BY id DESC LIMIT 12) phdp");
                $data=mysqli_fetch_array($query);
                echo "$data[rerata12]";  
              ?>
            </label>
          </h4>

          <!-- Menampilkan List 12 PhDP terakhir -->
          <label>
            *Tabel 12 PhDP terakhir
          </label>
            <table id="example1" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>No</th>
                <th>NIP</th>
                <th>Nominal PhDP</th>
                <th>Bulan</th>
                <th>Tahun</th>
              </tr>
              </thead>
              <tbody>
                <?php
                $no = 0;  
                $query = mysqli_query($koneksi, "SELECT * FROM iuran WHERE nip='$nip' ORDER BY id DESC LIMIT 12");
                while($iur = mysqli_fetch_array($query)){
                  $no++
                ?>
              <tr>
                <td><?php echo $no; ?></td>
                <td><?php echo $iur['nip']; ?></td>
                <td><?php echo $iur['nominal_phdp']; ?></td>
                <td><?php echo $iur['bulan']; ?></td>
                <td><?php echo $iur['tahun']; ?></td> 
              </tr>
              <?php  } ?>
              </tbody>
            </table><br>
        </div>
      </div>

      <!-- Menghitung Manfaat Pensiun -->
      <div class="card">
        <div class="card-body">
          <h4>
            <label>
              Manfaat Pensiun = Rp
              <?php
                if ($view['masa_kerja'] > "35"){
                  $a=10*(2/100);
                  $b=10*(2.25/100);
                  $c=15*(2.5/100);
                  echo $view['masa_kerja']*($a+$b+$c)*"$data[rerata12]";
                }
                else if ($view['masa_kerja'] > "20"){
                  $a=10*(2/100);
                  $b=10*(2.25/100);
                  $c=($view['masa_kerja']-20)*(2.5/100);
                  echo $view['masa_kerja']*($a+$b+$c)*"$data[rerata12]";
                }
                else if ($view['masa_kerja'] > "10"){
                  $a=10*(2/100);
                  $b=($view['masa_kerja']-10)*(2.25/100);
                  echo $view['masa_kerja']*($a+$b)*"$data[rerata12]";
                }
                else if ($view['masa_kerja'] > "0"){
                  $a=($view['masa_kerja'])*(2/100);
                  echo $view['masa_kerja']*$a*"$data[rerata12]";
                }
                else {
                  echo "Error";
                }
              ?>
            </label>
          </h4>
          <label>
            <?php
              echo "(Manfaat Pensiun = Masa Kerja x Faktor Penghargaan Masa Kerja x Rata-rata PhDP 12 bulan terakhir) </br>" ;
              echo "*Manfaat Pensiun = " ;
              if ($view['masa_kerja'] > "35"){
                $a=10*(2/100);
                $b=10*(2.25/100);
                $c=15*(2.5/100);
                echo $view['masa_kerja'] ;
                echo " tahun x " ;
                echo $a+$b+$c ;
                echo " x Rp " ;
                echo "$data[rerata12]" ;
              }
              else if ($view['masa_kerja'] > "20"){
                $a=10*(2/100);
                $b=10*(2.25/100);
                $c=($view['masa_kerja']-20)*(2.5/100);
                echo $view['masa_kerja'] ;
                echo " tahun x " ;
                echo $a+$b+$c ;
                echo " x Rp " ;
                echo "$data[rerata12]" ;
              }
              else if ($view['masa_kerja'] > "10"){
                $a=10*(2/100);
                $b=($view['masa_kerja']-10)*(2.25/100);
                echo $view['masa_kerja'] ;
                echo " tahun x " ;
                echo $a+$b ;
                echo " x Rp " ;
                echo "$data[rerata12]" ;
              }
              else if ($view['masa_kerja'] > "0"){
                $a=($view['masa_kerja'])*(2/100);
                echo $view['masa_kerja'] ;
                echo " tahun x " ;
                echo $a ;
                echo " x Rp " ;
                echo "$data[rerata12]" ;
              }
              else {
                echo "Error";
              }
            ?>
          </label>
        </div>
      </div>

      </div>             
    </div>
  </div>  
</section>              