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
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  KEY `fk_phdp_peserta` (`nip`),
  CONSTRAINT `fk_phdp_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE `phdp2` (
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) DEFAULT NULL,
  KEY `fk_phdp2_peserta` (`nip`),
  CONSTRAINT `fk_phdp2_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE `phdp3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phdp3_peserta` (`nip`),
  CONSTRAINT `fk_phdp3_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `bulan` int(2) DEFAULT month(now()),
  `tahun` int(4) DEFAULT year(now()),
  PRIMARY KEY (`id`),
  KEY `fk_iuran_phdp` (`nip`),
  CONSTRAINT `fk_iuran_phdp` FOREIGN KEY (`nip`) REFERENCES `phdp` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

INSERT INTO iuran (nip, nominal_phdp) SELECT nip, nominal_phdp FROM phdp;

CREATE TABLE `iuran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  bulan smallint GENERATED ALWAYS AS (MONTH(stat_date)) NOT NULL,
  tahun SMALLINT GENERATED ALWAYS AS (YEAR(stat_date)) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_iuran_phdp` (`nip`),
  CONSTRAINT `fk_iuran_phdp` FOREIGN KEY (`nip`) REFERENCES `phdp` (`nip`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;

---
CREATE TABLE rectangles(a INT, b INT,
  area INT GENERATED ALWAYS AS (a * b));

/*QUERY OTOMATIS karena pake GENERATED ALWAYS AS*/
CREATE TABLE `iuran2` (
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  iuran_peserta decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 6/100)
) ENGINE=InnoDB;

CREATE TABLE `iuran3` (
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  iuran_peserta decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 6/100),
  iuran_pemberi_kerja decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 124/1000),
  iuran_lain_lain decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 16/1000),
  iuran_total decimal(13,2) GENERATED ALWAYS AS (iuran_peserta+iuran_pemberi_kerja+iuran_lain_lain)
) ENGINE=InnoDB;

/*bulan dan tahun OTOMATIS kalo kasusnya tabel per bulan karena sudah deklarasi pake DEFAULT*/
CREATE TABLE `iuran4` (
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `bulan` int(2) DEFAULT 3,
  `tahun` int(4) DEFAULT 2019,
  iuran_peserta decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 6/100),
  iuran_pemberi_kerja decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 124/1000),
  iuran_lain_lain decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 16/1000),
  iuran_total decimal(13,2) GENERATED ALWAYS AS (iuran_peserta+iuran_pemberi_kerja+iuran_lain_lain)
) ENGINE=InnoDB;

CREATE TABLE `iuran5` (
  `id` int(5) NOT NULL AUTO_INCREMENT, 
    PRIMARY KEY (`id`),
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `bulan` int(2) DEFAULT 3,
  `tahun` int(4) DEFAULT 2019,
  iuran_peserta decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 6/100),
  iuran_pemberi_kerja decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 124/1000),
  iuran_lain_lain decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 16/1000),
  iuran_total decimal(13,2) GENERATED ALWAYS AS (iuran_peserta+iuran_pemberi_kerja+iuran_lain_lain)
) ENGINE=InnoDB;

---
/*Input bulan dan tahun MANUAL kalo kasusnya tabel per bulan*/
CREATE TABLE `iuran6` (
  `id` int(5) NOT NULL AUTO_INCREMENT, 
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `bulan` int(2) NULL,
  `tahun` int(4) NULL,
  iuran_peserta_6p decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 6/100),
  iuran_pemberi_kerja decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 124/1000),
  iuran_lain_lain decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 16/1000),
  iuran_total decimal(13,2) GENERATED ALWAYS AS (iuran_peserta+iuran_pemberi_kerja+iuran_lain_lain),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO iuran6 (nip, nominal_phdp) SELECT nip, nominal_phdp FROM phdp;

UPDATE `iuran6` 
SET `bulan` = '4', tahun = '2005' 
WHERE `iuran6`.`nip` > 0;
---

CREATE TABLE `iuran7` (
  `id` int(5) NOT NULL AUTO_INCREMENT, 
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `bulan` int(2) DEFAULT month(current_timestamp()),
  `tahun` int(4) DEFAULT year(current_timestamp()),
  iuran_peserta decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 6/100),
  iuran_pemberi_kerja decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 124/1000),
  iuran_lain_lain decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 16/1000),
  iuran_total decimal(13,2) GENERATED ALWAYS AS (iuran_peserta+iuran_pemberi_kerja+iuran_lain_lain),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_iuran7_phdp` FOREIGN KEY (`nip`) REFERENCES `phdp` (`nip`)
) ENGINE=InnoDB;

CREATE TABLE `iuran8` (
  `id` int(5) NOT NULL AUTO_INCREMENT, 
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `bulan` int(2) DEFAULT month(current_timestamp()),
  `tahun` int(4) DEFAULT year(current_timestamp()),
  iuran_peserta decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 6/100),
  iuran_pemberi_kerja decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 12.4/100),
  iuran_lain_lain decimal(13,2) GENERATED ALWAYS AS (nominal_phdp * 1.6/100),
  iuran_total decimal(13,2) GENERATED ALWAYS AS (iuran_peserta+iuran_pemberi_kerja+iuran_lain_lain),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_iuran8_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`)
) ENGINE=InnoDB;

CREATE TABLE `iuran` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nip` int(20) NOT NULL,
  `nominal_phdp` decimal(13,2) NOT NULL,
  `iuran_peserta_6%` decimal(13,2) GENERATED ALWAYS AS (`nominal_phdp` * 6 / 100) VIRTUAL,
  `iuran_pemberi_kerja_12.4%` decimal(13,2) GENERATED ALWAYS AS (`nominal_phdp` * 12.4 / 100) VIRTUAL,
  `iuran_lain_lain_1.6%` decimal(13,2) GENERATED ALWAYS AS (`nominal_phdp` * 1.6 / 100) VIRTUAL,
  `iuran_total` decimal(13,2) GENERATED ALWAYS AS (`iuran_peserta_6%` + `iuran_pemberi_kerja_12.4%` + `iuran_lain_lain_1.6%`) VIRTUAL,
  `bulan` int(2) DEFAULT month(current_timestamp()),
  `tahun` int(4) DEFAULT year(current_timestamp()),
  PRIMARY KEY (`id`),
  KEY `fk_iuran_peserta` (`nip`),
  CONSTRAINT `fk_iuran_peserta` FOREIGN KEY (`nip`) REFERENCES `peserta` (`nip`)
) ENGINE=InnoDB;

SELECT i.id as 'id iuran', i.nip as 'NIP', p.nama as 'NAMA', p.phdp as 'PHDP'
FROM iuran as i JOIN phdp as n
ON (i.nip = n.nip);

SELECT 

SELECT *
FROM iuran7 as i JOIN phdp as n
ON (i.nip = n.nip);

SELECT *
FROM iuran7 as i JOIN peserta as p
ON (i.nip = p.nip);

