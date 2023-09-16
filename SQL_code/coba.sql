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

CREATE TABLE `peserta` (
  `nip` int(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `unit_kerja` enum('FSM','FKIP','FTI','FEB') DEFAULT NULL,
  `gender` enum('Pria','Wanita') DEFAULT NULL,
  `status_kawin` enum('Kawin','Tidak Kawin') DEFAULT NULL,
  `tanggungan_anak` enum('0','1','2') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_peserta` date DEFAULT NULL,
  `tanggal_pensiun` date DEFAULT NULL,
  `masa_kerja` decimal(13,2) GENERATED ALWAYS AS (timestampdiff(MONTH,`tanggal_peserta`,`tanggal_pensiun`) / 12) VIRTUAL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

CREATE TABLE `phdp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phdp_peserta` (`nip`),
  CONSTRAINT `fk_phdp_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('superadmin','operator') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4

-------------------------------------------
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

INSERT INTO `peserta`   (`nip`,     `nama`,       `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`)
  VALUES    ('662019002',   'VINSENSIUS ERIC',  'FSM',      'Pria',   'Kawin',    '2',        '2001-03-09', '2020-10-01'),
            ('662019003',   'ALFIDA TEGAR',   'FKIP',     'Wanita', 'Tidak Kawin',  '0',        '2005-12-14', '2020-08-01'),
            ('662019005',   'WIRA SETYAWAN',  'FEB',      'Pria',   'Kawin',    '0',        '1995-11-06', '2022-03-03'),
            ('662019008',   'BENITA DWITYA',  'FSM',      'Wanita', 'Kawin',    '2',        '1980-12-15', '2015-01-01'),
            ('662019009',   'DAVID YOGA',   'FKIP',     'Pria',   'Tidak Kawin',  '2',        '1995-06-10', '2010-09-01'),
            ('662019010',   'NUR INTAN',    'FSM',      'Wanita', 'Kawin',    '1',        '2000-04-15', '2015-12-01'),
            ('662019011',   'FEBIANE ALDITA', 'FEB',      'Wanita', 'Tidak Kawin',  '2',        '1980-12-28', '2001-08-01'),
            ('662019012',   'YUMITA CHRISTIN',  'FSM',      'Wanita',   'Tidak Kawin',  '1',        '1975-12-04',   '1990-11-01'),
            ('662019013',   'PUTRI ELIZABETH',  'FKIP',     'WANITA', 'Kawin',    '1',        '2001-03-09', '2022-10-01'),
            ('662019014',   'SHEILA ALFATIHA',  'FSM',      'Wanita', 'Tidak Kawin',  '1',        '1980-08-08', '2003-08-01'),
            ('662019015',   'FEBI SETIVANI',  'FKIP',      'Wanita', 'Tidak Kawin',  '2',        '1988-10-08', '2015-11-01'),
            ('662019016',   'AGNES DHIKA',  'FTI',      'Wanita', 'Kawin',  '1',        '1980-10-08', '2001-01-01'),
            ('662019018',   'LUTFI SIVANA',  'FSM',      'Wanita', 'Tidak Kawin',  '0',        '2005-10-08', '2018-12-01'),

INSERT INTO `phdp` (`nip`, `nominal_phdp`) 
VALUES  ('662019002', '4000000.00'), 
        ('662019003', '2500000.00'),
        ('662019005', '3000000.00'), 
        ('662019008', '3800000.00'), 
        ('662019009', '6550000.00'),
        ('662019010', '3255000.00'), 
        ('662019011', '3485250.00'),
        ('662019012', '7505259.86'), 
        ('662019013', '3850578.45'),
        ('662019014', '6700000.53'),
        ('662019015', '3554556.23'),

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `level`) 
VALUES    (NULL, 'glenhans', 'admin', '12345', 'superadmin'), 
          (NULL, 'glenhans', 'op1', '12345', 'operator'),
          (NULL, 'Guest', 'guest', 'guest', 'operator'),
-------------------------------------------






-- Coret coret
UPDATE `iuran2302` 
SET `thn_bln` = '2301' 
WHERE `nip` > 0;

INSERT INTO iuran_total (nip, phdp, thn_bln) 
SELECT nip, phdp, thn_bln 
FROM iuran2302;

help month;
help year;
help now;
select month(now());
select year(now());

/*Menambah besar phdp dengan melakukan CEK terlebih dahulu*/
START TRANSACTION;
SELECT SUM(nominal_phdp) as 'Total PHDP bulan ini' FROM phdp;
INSERT INTO iuran (nip, nominal_phdp) SELECT nip, nominal_phdp FROM phdp;
SELECT * FROM iuran;
-- COMMIT;
-- ROLLBACK;

/*Menampilkan 12 Data TERAKHIR https://www.pascal-id.org/thread/mysql/4587/menampilkan-data-pada-record-terakhir-dg-sql*/
-- $query    =mysqli_query($conn, "SELECT * FROM tb_siswa ORDER BY id_siswa DESC LIMIT 1");
SELECT id, nip, nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 12;
SELECT AVG(nominal_phdp) FROM (SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 12) phdp;
SELECT nip, TIMESTAMPDIFF(MONTH, tanggal_peserta, tanggal_pensiun) FROM peserta WHERE nip='662019007';
SELECT (TIMESTAMPDIFF(MONTH, tanggal_peserta, tanggal_pensiun))/12 FROM peserta WHERE nip='662019007';
/*Menampilkan 12 Data TERAKHIR*/

SELECT AVG(nominal_phdp) FROM iuran WHERE(SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2);
SELECT AVG(SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2) FROM iuran;
SELECT AVG(nominal_phdp) FROM (SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2);
SELECT AVG(data_trakir) FROM iuran WHERE(SELECT nominal_phdp as 'data_trakir' FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2);
SELECT AVG(nominal_phdp) FROM (SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2);
SELECT AVG(SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2);

SELECT nominal_phdp as 'data_trakir' FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2,
SELECT AVG(data_trakir);

SELECT AVG(nominal_phdp) as 'rata2' FROM (SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 2);

SELECT AVG(nominal_phdp) 
FROM (SELECT nominal_phdp FROM iuran WHERE nip=662019007 ORDER BY id DESC LIMIT 12) phdp;

SELECT
    id,
    fname,
    lname,
    STR_TO_DATE(tanggal_masuk, '%Y-%m-%d') tanggal_masuk,
    STR_TO_DATE(NOW(), '%Y-%m-%d') AS 'tanggal_sekarang',
    TIMESTAMPDIFF(YEAR, tanggal_masuk, NOW()) AS selisih_tahun,
    TIMESTAMPDIFF(MONTH, tanggal_masuk, NOW()) AS selisih_bulan
FROM
    b_users

SELECT
    nip,
    TIMESTAMPDIFF(MONTH, tanggal_peserta, NOW()) AS 'masa kerja'
FROM
    peserta
WHERE
    nip='662019007';


    
