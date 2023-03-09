/*https://dev.mysql.com/doc/refman/8.0/en/*/
/**/
/*
cd c:/
cd xampp
cd mysql
cd bin
mysql -uroot -p
*/

/*
SIMBAK DPSW 
SIK DPSW
SIRSAGlen DPSW
SIRIP DPSW
*/

/*
/*Membuat Database 'Kepesertaan'*/
CREATE DATABASE kepesertaan;

/*Membuat tabel peserta*/
CREATE TABLE `peserta` (
  `nip` int(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `unit_kerja` enum('FSM','FKIP','FTI','FEB') DEFAULT NULL,
  `gender` enum('Pria','Wanita') DEFAULT NULL,
  `status_kawin` enum('Kawin','Tidak Kawin') DEFAULT NULL,
  `tanggungan_anak` enum('0','1','2') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_peserta` date DEFAULT NULL,
  `phdp` decimal(13,2) NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB;

/*Membuat tabel iuran*/
CREATE TABLE `iuran2301` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `phdp` decimal(13,2) NOT NULL,
  `thn_bln` int(4) NULL,
  PRIMARY KEY (`id`),
  KEY `fk_iuran_peserta` (`nip`),
  CONSTRAINT `fk_iuran_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

/*Membuat tabel rekap iuran total*/
CREATE TABLE `iuran_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `phdp` decimal(13,2) NOT NULL,
  `thn_bln` int(4) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

UPDATE `iuran2302` 
SET `thn_bln` = '2301' 
WHERE `nip` > 0;

INSERT INTO iuran_total (nip, phdp, thn_bln) 
SELECT nip, phdp, thn_bln 
FROM iuran2302;

SELECT i.id as 'id iuran', i.nip as 'NIP', p.nama as 'NAMA', i.thn_bln as 'thn_bulan' ,i.phdp as 'PHDP', i.phdp*6/100 as 'iuran peserta 6%', i.phdp*12.4/100 as 'iuran pemberi kerja 12.4%', i.phdp*1.4/100 as 'iuran lain 1.4%'
FROM iuran_total as i JOIN peserta as p
ON (i.nip = p.nip) WHERE i.nip='662019007'
order by nip;

SELECT i.id as 'id iuran', i.nip as 'NIP', p.nama as 'NAMA', i.thn_bln as 'thn_bulan' ,i.phdp as 'PHDP', i.phdp*6/100 as 'iuran peserta 6%', i.phdp*12.4/100 as 'iuran pemberi kerja 12.4%', i.phdp*1.4/100 as 'iuran lain 1.4%'
FROM iuran_total as i JOIN peserta as p
ON (i.nip = p.nip)
order by nip;

SELECT i.id as 'id iuran', i.nip as 'NIP', p.nama as 'NAMA', i.thn_bln as 'thn_bulan' ,i.phdp as 'PHDP', i.phdp*6/100 as 'iuran peserta 6%', i.phdp*12.4/100 as 'iuran pemberi kerja 12.4%', i.phdp*1.4/100 as 'iuran lain 1.4%'
FROM iuran_total as i JOIN peserta as p
ON (i.nip = p.nip) WHERE i.nip='662019007'
order by nip;
SELECT SUM(phdp) as 'total PHDP glen' FROM iuran_total WHERE nip='662019007';

SET @no=0;
SELECT @no:=@no+1, i.nip as 'NIP', p.nama as 'NAMA', i.thn_bln as 'thn_bulan' ,i.phdp as 'PHDP', i.phdp*6/100 as 'iuran peserta 6%', i.phdp*12.4/100 as 'iuran pemberi kerja 12.4%', i.phdp*1.4/100 as 'iuran lain 1.4%'
FROM iuran_total as i JOIN peserta as p
ON (i.nip = p.nip)
order by thn_bln;

help month;
help year;
help now;
select month(now());
select year(now());










/*Membuat Database 'Kepesertaan'*/
CREATE DATABASE coba;

/*Membuat tabel peserta*/
CREATE TABLE `peserta` (
  `nip` int(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `unit_kerja` enum('FSM','FKIP','FTI','FEB') DEFAULT NULL,
  `gender` enum('Pria','Wanita') DEFAULT NULL,
  `status_kawin` enum('Kawin','Tidak Kawin') DEFAULT NULL,
  `tanggungan_anak` enum('0','1','2') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_peserta` date DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB;

INSERT INTO `peserta`   (`nip`,     `nama`,       `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`, `phdp`)
  VALUES    ('662019002',   'VINSENSIUS ERIC',  'FSM',      'Pria',   'Kawin',    '2',        '2001-03-09', '2020-10-01',   '4000000.00'),
            ('662019003',   'ALFIDA TEGAR',   'FKIP',     'Wanita', 'Tidak Kawin',  '0',        '2005-12-14', '2020-08-01',   '2500000.00'),
            ('662019005',   'WIRA SETYAWAN',  'FEB',      'Pria',   'Kawin',    '0',        '1995-11-06', '2022-03-03',   '3000000.00'),
            ('662019007',   'GLENHANS',     'FTI',      'Pria',   'Kawin',    '1',        '2001-10-09', '2018-05-01',   '1000000.00'),
            ('662019008',   'BENITA DWITYA',  'FSM',      'Wanita', 'Kawin',    '2',        '1980-12-15', '2015-01-01',   '3800000.00'),
            ('662019009',   'DAVID YOGA',   'FKIP',     'Pria',   'Tidak Kawin',  '2',        '1995-06-10', '2010-09-01',   '6550000.00'),
            ('662019010',   'NUR INTAN',    'FSM',      'Wanita', 'Kawin',    '1',        '2000-04-15', '2015-12-01',   '3255000.00'),
            ('662019011',   'FEBIANE ALDITA', 'FEB',      'Wanita', 'Tidak Kawin',  '2',        '1980-12-28', '2001-08-01',   '3485250.00'),
            ('662019012',   'YUMITA CHRISTIN',  'FSM',      'Wanita',   'Tidak Kawin',  '1',        '1975-12-04',   '1990-11-01',     '7505259.86'),
            ('662019013',   'PUTRI ELIZABETH',  'FKIP',     'WANITA', 'Kawin',    '1',        '2001-03-09', '2022-10-01',   '3850578.45'),
            ('662019014',   'SHEILA ALFATIHA',  'FSM',      'Wanita', 'Tidak Kawin',  '1',        '1980-08-08', '2003-08-01',   '6700000.53'),
            ('662019015',   'FEBI SETIVANI',  'FKIP',      'Wanita', 'Tidak Kawin',  '2',        '1988-10-08', '2015-11-01',   '3554556.23'),

/*Membuat tabel phdp*/
CREATE TABLE `phdp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phdp_peserta` (`nip`),
  CONSTRAINT `fk_phdp_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

INSERT INTO `phdp` (`nip`, `nominal_phdp`) 
VALUES  ('662019002', '4000000.00'), 
        ('662019003', '2500000.00'),
        ('662019005', '3000000.00'), 
        ('662019007', '1000000.00'),
        ('662019008', '3800000.00'), 
        ('662019009', '6550000.00'),
        ('662019010', '3255000.00'), 
        ('662019011', '3485250.00'),
        ('662019012', '7505259.86'), 
        ('662019013', '3850578.45'),
        ('662019014', '6700000.53'),
        ('662019015', '3554556.23'),

/*Membuat tabel iuran*/
CREATE TABLE `iuran` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `iuran_peserta_6` decimal(13,2) GENERATED ALWAYS AS (`nominal_phdp` * 6 / 100) VIRTUAL,
  `iuran_pemberi_kerja_12koma4` decimal(13,2) GENERATED ALWAYS AS (`nominal_phdp` * 12.4 / 100) VIRTUAL,
  `iuran_lain_lain_1koma6` decimal(13,2) GENERATED ALWAYS AS (`nominal_phdp` * 1.6 / 100) VIRTUAL,
  `iuran_total` decimal(13,2) GENERATED ALWAYS AS (`iuran_peserta_6` + `iuran_pemberi_kerja_12koma4` + `iuran_lain_lain_1koma6`) VIRTUAL,
  `bulan` int(2) DEFAULT month(current_timestamp()),
  `tahun` int(4) DEFAULT year(current_timestamp()),
  PRIMARY KEY (`id`),
  KEY `fk_iuran_peserta` (`nip`),
  CONSTRAINT `fk_iuran_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`)
) ENGINE=InnoDB;

/*Menambah besar phdp dengan melakukan CEK terlebih dahulu*/
START TRANSACTION;
SELECT SUM(nominal_phdp) as 'Total PHDP bulan ini' FROM phdp;
INSERT INTO iuran (nip, nominal_phdp) SELECT nip, nominal_phdp FROM phdp;
SELECT * FROM iuran;
-- COMMIT;
-- ROLLBACK;

/*Menampilkan Data Rekap*/
SELECT  peserta.nip as 'NIP',
        peserta.nama as 'Nama',
        peserta.unit_kerja as 'Unit Kerja',
        peserta.gender as 'Jenis Kelamin',
        peserta.status_kawin as 'Status Kawin',
        peserta.tanggungan_anak as 'Tanggungan Anak',
        peserta.tanggal_lahir as 'Tanggal Lahir',
        peserta.tanggal_peserta as 'Tanggal Peserta',
        iuran.nominal_phdp as 'PHDP',
        iuran.`iuran_peserta_6%` as 'Iuaran Peserta (6%)',
        iuran.`iuran_pemberi_kerja_12.4%` as 'Iuaran Peserta (12.4%)',
        iuran.`iuran_lain_lain_1.6%` as 'Iuaran Peserta (1.6%)',
        iuran.`iuran_total` as 'Iuran Total',
        iuran.bulan as 'Bulan',
        iuran.tahun as 'Tahun'
FROM iuran JOIN peserta 
ON (iuran.nip = peserta.nip);

/*Menampilkan 12 Data TERAKHIR https://www.pascal-id.org/thread/mysql/4587/menampilkan-data-pada-record-terakhir-dg-sql*/
-- $query    =mysqli_query($conn, "SELECT * FROM tb_siswa ORDER BY id_siswa DESC LIMIT 1");
SELECT id, nip, nama FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 12;

SELECT SUM(`nominal_phdp`) as 'Total PHDP' FROM iuran;
SELECT SUM(`iuran_peserta_6%`) as 'Total Iuaran Peserta (6%)' FROM iuran;
SELECT SUM(`iuran_pemberi_kerja_12.4%`) as 'Total Iuaran Peserta (12.4%)' FROM iuran;
SELECT SUM(`iuran_lain_lain_1.6%`) as 'Total Iuaran Peserta (1.6%)' FROM iuran;
SELECT SUM(`iuran_total`) as 'Total Iuran' FROM iuran;




