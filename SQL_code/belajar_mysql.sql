/*https://dev.mysql.com/doc/refman/8.0/en/*/
/*https://learn.microsoft.com/id-id/azure/databricks/sql/language-manual/sql-ref-syntax-ddl-create-table-using*/

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

/*MEMBUAT ISI TABEL PESERTA
INSERT INTO `peserta` 	(`nip`, 		`nama`, 			`unit_kerja`,	`gender`,	`status_kawin`,	`tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`, `phdp`)
	VALUES 		('662019002', 	'VINSENSIUS ERIC',	'FSM',			'Pria',		'Kawin',		'2',				'2001-03-09',	'2020-10-01',		'4000000.00'),
						('662019003', 	'ALFIDA TEGAR',		'FKIP',			'Wanita',	'Tidak Kawin',	'0',				'2005-12-14',	'2020-08-01',		'2500000.00'),
						('662019005', 	'WIRA SETYAWAN',	'FEB',			'Pria',		'Kawin',		'0',				'1995-11-06',	'2022-03-03',		'3000000.00'),
						('662019007', 	'GLENHANS',			'FTI',			'Pria', 	'Kawin',		'1',				'2001-10-09',	'2018-05-01',		'1000000.00'),
						('662019008', 	'BENITA DWITYA',	'FSM',			'Wanita',	'Kawin',		'2',				'1980-12-15',	'2015-01-01',		'3800000.00'),
						('662019009', 	'DAVID YOGA',		'FKIP',			'Pria',		'Tidak Kawin',	'2',				'1995-06-10',	'2010-09-01',		'6550000.00'),
						('662019010', 	'NUR INTAN',		'FSM', 			'Wanita',	'Kawin',		'1',				'2000-04-15',	'2015-12-01',		'3255000.00'),
						('662019011', 	'FEBIANE ALDITA',	'FEB',			'Wanita',	'Tidak Kawin',	'2',				'1980-12-28',	'2001-08-01',		'3485250.00'),
						('662019012', 	'YUMITA CHRISTIN', 	'FSM', 			'Wanita', 	'Tidak Kawin', 	'1', 				'1975-12-04', 	'1990-11-01', 		'7505259.86'),
						('662019013', 	'PUTRI ELIZABETH',	'FKIP',			'WANITA',	'Kawin',		'1',				'2001-03-09',	'2022-10-01',		'3850578.45'),
						('662019014', 	'SHEILA ALFATIHA',	'FSM',			'Wanita',	'Tidak Kawin',	'1',				'1980-08-08',	'2003-08-01',		'6700000.53'),
						('662019015',   'FEBI SETIVANI',  'FKIP',      'Wanita', 'Tidak Kawin',  '2',        '1988-10-08', '2015-11-01',   '3554556.23'),
*/

create database coba;		/* membuat database */

create table barang(		/* membuat tabel */
	id int,
	nama varchar(100),
	harga int,
	jumlah int,
	deskripsi text
) engine = InnoDB;

ALTER TABLE `peserta` CHANGE `phdp` `phdp` DECIMAL(13,2) NOT NULL;	/* merubah jeni data pada table */
ALTER TABLE `peserta` CHANGE `phdp` `phdp` FLOAT(13,2) NOT NULL;

describe barang;
desc barang;					/* melihat kerangka tabel */

show create table barang;		/* melihat cara membuat tabel */

alter table barang				/* merubah isi tabel*/
	add column nama_column text,
	drop column nama,
	rename column nama to nama_baru,
	modify nama varchar(100) after jumlah,
	modify nama varchar(100) first,
	modify id int not null,
	modify nama varchar(200) not null,
	modify harga int not null default 0,
	modify jumlah int not null default 0,
	ADD PRIMARY KEY (id),
	add column waktu_dibuat TIMESTAMP not null defaul CURRENT_TIMESTAMP
	
INSERT INTO barang (id, nama) VALUES (1, 'apel');

SELECT * FROM barang; /* menampilkan data pada tabel */

select id, nama from barang;

TRUNCATE barang;	/* menghapus data dalam tabel*/

DROP barang;	/* menghapus tabel*/

CREATE TABLE `barang` (
   `id` int(11) NOT NULL,
   `nama` varchar(200) NOT NULL,
   `harga` int(11) NOT NULL DEFAULT 0,
   `jumlah` int(11) NOT NULL DEFAULT 0,
   `deskripsi` text DEFAULT NULL,
   `waktu_dibuat` timestamp NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`id`)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1
 
CREATE TABLE `peserta` (									/* membuat table peserta DPSW */
  `nip` int(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `unit_kerja` enum('FSM','FKIP','FTI','FEB') DEFAULT NULL,
  `gender` enum('Pria','Wanita') DEFAULT NULL,
  `status_kawin` enum('Kawin','Tidak Kawin') DEFAULT NULL,
  `tanggungan_anak` enum('0','1','2') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_peserta` date DEFAULT NULL,
  `phdp` float NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

SELECT	nip as 'NIP',					/* menampilkan data pada tabel dengan ALIAS yaitu mengganti judul KOLOM*/
		nama as 'NAMA',
		unit_kerja 'UNIT KERJA',
		gender as 'JENIS KELAMIN',
		status_kawin as 'STATUS PERKAWINAN',
		tanggungan_anak as 'TANGGUNGAN ANAK',
		tanggal_lahir as 'TANGGAL LAHIR',
		tanggal_peserta as 'TANGGAL MENJADI PESERTA',
		phdp as 'PHDP'
FROM peserta;

show CREATE TABLE peserta;

SELECT * FROM peserta WHERE phdp > 3000000;		/* menampilkan sebagian data pada tabel dengan filter */

ALTER TABLE peserta
  MODIFY `nama` varchar(100) NOT NULL,
  MODIFY `unit_kerja` text NULL,
  MODIFY `gender` text NULL DEFAULT 'belum diisi',
  MODIFY `status_kawin` text NULL DEFAULT 'belum diisi',
  MODIFY `tanggungan_anak` text NULL DEFAULT 'belum diisi',
  MODIFY `tanggal_lahir` DATE NULL DEFAULT NULL,
  MODIFY `tanggal_peserta` DATE NULL DEFAULT NULL,
  MODIFY `phdp` float NOT NULL;
  
INSERT INTO `peserta` (`nip`, `nama`, `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`, `phdp`) 	/* mengisi data pada tabel*/
	VALUES 	('662019002', 'VINSENSIUS ERIK', NULL, NULL, NULL, NULL, NULL, NULL, '4000000'), 
			('662019003', 'ALFIDA TEGAR', NULL, NULL, NULL, NULL, NULL, NULL, '2500000');
			
INSERT INTO `peserta` (`nip`, `nama`, `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`, `phdp`) 
	VALUES 	('662019005','', NULL, NULL, NULL, NULL, NULL, NULL, '4000000');

UPDATE `peserta` 
SET `nama` = 'VINSENSIUS ERIC' 
WHERE `peserta`.`nip` = 662019002; /* mengubah isi data (1 kolom) */

UPDATE `iuran2302` 
SET `thn_bln` = '2302' 
WHERE `nip` > 0;

ALTER TABLE peserta
	MODIFY gender ENUM('Pria', 'Wanita'); 			/* membuat list pada isi data */
	MODIFY unit_kerja ENUM('FSM','FKIP','FTI','FEB'),
	MODIFY status_kawin ENUM ('Kawin','Tidak Kawin'),
	MODIFY tanggungan_anak ENUM ('0','1','2');
	
DELETE FROM peserta				/* menghapus data pada table */
	WHERE nip = "662019008";	
	
DELETE FROM peserta				
	WHERE nip = "6620190010" OR phdp < 600000;	/* 2 filter menggunakan AND atau OR */

/* menggunakan LIKE jangan saat datanya sangat besar, karena akan scanning dan lama sekali */
SELECT * FROM peserta WHERE nama LIKE '%en%';	/* menampilkan data dengan string tertentu */
SELECT * FROM peserta WHERE nama LIKE 'gl%';	
SELECT * FROM peserta WHERE nama LIKE '%s';	
SELECT * FROM peserta WHERE nama NOT LIKE '%s';	

SELECT nip, nama, phdp FROM peserta WHERE nama IS NULL;		/* menampilkan data dengan isi NULL */
SELECT nip, nama, phdp FROM peserta WHERE nama IS NOT NULL;	

SELECT * FROM peserta WHERE phdp BETWEEN 3000000 AND 5000000;		/* menampilkan data dengan isi angka DIANTARA */
SELECT * FROM peserta WHERE phdp NOT BETWEEN 3000000 AND 5000000;

SELECT * 						/* menampilkan data dengan LIST yg banyak */
FROM peserta 
WHERE unit_kerja IN ('FSM', 'FKIP');

SELECT * 							/* menampilkan data ORDER BY atau pengurutan berdasrkan */
FROM peserta 
WHERE unit_kerja NOT IN ('FSM', 'FKIP');

SELECT * 
FROM peserta 
ORDER BY tanggungan_anak;

SELECT * 
FROM peserta 
ORDER BY unit_kerja ASC,
tanggungan_anak DESC;

SELECT * FROM peserta ORDER BY nip LIMIT 5; 	/* menampilkan 5 data pertama dengan LIMIT */

SELECT * FROM peserta ORDER BY nip LIMIT 3, 5;	/* menampilkan 5 data pertama dan skip 3 data pertama dengan LIMIT */

SELECT DISTINCT unit_kerja /* menampilkan list dari suatu kolom ata entitas */
FROM peserta;

SELECT 8+5 as hasil;		/* menghitung sesuatu DI LUAR TABEL */

SELECT 	nip, 				/* MANIPULASI integer atau float dari isi tabel dengan FUNGSI ARITMATIKA % + - * / liat modul lengkap*/
		phdp + 33333 as 'PHDP baru'
FROM peserta;

SELECT 	nip, 			/* DIV artinya dibagi dengan hasil INTEGER atau angka bulat*/
		phdp,
		phdp DIV 1000 as 'PHDP dalam K'	
FROM peserta;	

CREATE TABLE admin(		/* membuat tabel ADMIN dengan AUTO INCREMENT pada id*/
	id INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR(100),
	PRIMARY KEY (id)
) engine = InnoDB;

INSERT INTO admin (nama) 	/* mengisi data pada tabel ADMIN dengan AUTO INCREMENT*/
	VALUES 	('glen'),
			('david'),
			('wira'),
			('eric');
			
SELECT LAST_INSERT_ID()
FROM admin;	/* melihat id terakhir */	/* BELUM BISA COBA LAGI*/

SELECT 	nip,			/* menggunakan fugngsi string LOWER, UPPER, LENGTH, dll liat modul aja*/
		nama,
		LOWER(nama) as 'Nama dalam huruf kecil'
		LENGTH(nama) as 'panjang karakter nama'
FROM peserta;

SELECT 	nip,			/* menampilkan date and time */
		nama,
		tanggal_lahir,
		YEAR(tanggal_lahir) as 'tahun lahir',
		MONTH(tanggal_lahir) as 'bulan lahir',
		DAY(tanggal_lahir) as 'tanggal lahir'
FROM peserta;

SELECT 	nip, 			/* FLOW CONTROL FUNCTION dengan CASE, IF(), IFNULL(), NULLIF() lengkapnya di modul*/
		gender,
		CASE gender
			WHEN 'Pria' THEN 'P'
			WHEN 'Wanita' THEN 'W'
			ELSE '?'
			END AS 'gender dalam kode'
FROM peserta;

SELECT 	nip,			/* penggunaan IF, kalau MAU KOMPLEKS PAKE BAHASA PEMROGRAMAN BARU KIRIM KE MYSQL */
		gender,
		IF(
			gender = 'Pria', 'P',
			IF(
				gender = 'Wanita', 'W',
				'?'
			)
		) AS 'gender dalam kode2'
FROM peserta;

INSERT INTO `peserta` (`nip`, `nama`, `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`, `phdp`) 	/* mengisi data pada tabel*/
	VALUES 	('662019011', 'FEBIANE ALDITA', 'FKIK', '', 'tak tahuuu', '3', '', '', '4000000'), 
			('662019003', 'ALFIDA TEGAR', NULL, NULL, NULL, NULL, NULL, NULL, '2500000');
			
INSERT INTO `peserta` (`nip`, `nama`, `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`, `phdp`) 
	VALUES ('662019011', 'FEBIANE ALDITA', 'FEB', 'Wanita', 'Tidak Kawin', '2', '1980-12-28', '2001-08-01', '3485250')
	
INSERT INTO `peserta` (`nip`, `nama`, `unit_kerja`, `gender`, `status_kawin`, `tanggungan_anak`, `tanggal_lahir`, `tanggal_peserta`, `phdp`) 
	VALUES ('662019012', 'YUMITA CHRISTIN', 'FSM', 'Wanita', 'Tidak Kawin', '1', '1975-12-04', '1990-11-01', '7505259.86')

delete from peserta where nip='662019012';

SELECT COUNT(*) as 'banyak peserta/ banyak baris/banyak data' FROM peserta;			/* menghitung banyak baris atau kriteria lain dengan AGREGATE FUNC seperti COUNT(), SUM*(), dll */
SELECT COUNT(nip) as 'banyak peserta/ banyak baris/banyak data' FROM peserta; /*sama kaya atas*/
SELECT COUNT(*) as 'banyak Wanita' FROM peserta WHERE gender='Wanita';

SELECT SUM(phdp) as 'total phdp' FROM peserta;	/*hitung total dengan SUM, AVG, MAX, MIN*/
SELECT AVG(phdp) as 'rerata phdp' FROM peserta;
SELECT MAX(phdp) as 'phdp terbesar' FROM peserta;
SELECT MIN(phdp) as 'phdp terkecil' FROM peserta;

SELECT 	unit_kerja,				/*menampilkan data berdasarkan urutan Kriteria dengan GROUP BY*/
		COUNT(nip) as 'Total peserta'
FROM peserta
GROUP BY unit_kerja;

SELECT COUNT(nip) as 'banyak peserta/ banyak baris/banyak data', unit_kerja FROM peserta GROUP BY unit_kerja;	
SELECT SUM(phdp) as 'total phdp', unit_kerja FROM peserta GROUP BY unit_kerja;	
SELECT AVG(phdp) as 'rerata phdp', unit_kerja FROM peserta GROUP BY unit_kerja;	
SELECT MAX(phdp) as 'phdp terbesar', unit_kerja FROM peserta GROUP BY unit_kerja;	
SELECT MIN(phdp) as 'phdp terkecil', unit_kerja FROM peserta GROUP BY unit_kerja;	
						
CREATE TABLE iuran (			/*membuat tabel untuk Relationship dengan FOREIGN KEY*/
	id int not null auto_increment,
	nip int(20) NOT NULL,
	phdpcoba decimal(13,2) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_iuran_peserta
		FOREIGN KEY (nip) REFERENCES peserta (nip)
) ENGINE=InnoDB;

ALTER TABLE iuran 
	ADD CONSTRAINT fk_iuran_peserta
	FOREIGN KEY (nip) REFERENCES peserta (nip)

SELECT * 						/*menampilkan semua entitas dari gabungan Tabel dengan JOIN*/
FROM iuran JOIN peserta
ON (iuran.nip = peserta.nip);

SELECT iuran.id, iuran.nip, peserta.nama, peserta.phdp, iuran.phdpcoba /*menampilkan beberapa entitas dari gabungan Tabel dengan JOIN*/
FROM iuran JOIN peserta 
ON (iuran.nip = peserta.nip);

SELECT i.id, i.nip, p.nama, p.phdp, i.phdpcoba 	/*menampilkan beberapa entitas dari gabungan Tabel dengan JOIN dan AS*/
FROM iuran as i JOIN peserta as p
ON (i.nip = p.nip);

SELECT i.id as 'id iuran', i.nip as 'NIP', p.nama as 'NAMA', p.phdp as 'PHDP', i.phdpcoba as 'PHDP COBA'
FROM iuran as i JOIN peserta as p
ON (i.nip = p.nip);

	/*menampilkan beberapa entitas dari gabungan Tabel dengan JOIN dan AS serta MEMANIPULASI DATA*/
SELECT i.id as 'id iuran', i.nip as 'NIP', p.nama as 'NAMA', p.phdp as 'PHDP', i.phdpcoba as 'PHDP COBA', i.phdpcoba*6/100 as 'iuran peserta 6%', i.phdpcoba*12.4/100 as 'iuran pemberi kerja 12.4%', i.phdpcoba*1.4/100 as 'iuran lain 1.4%'
FROM iuran as i JOIN peserta as p
ON (i.nip = p.nip);

/*men Copy table atau menyalin table*/ 
/*https://www.devart.com/dbforge/mysql/studio/mysql-copy-table.html*/ 
/*https://popsql.com/learn-sql/mysql/how-to-duplicate-a-table-in-mysql*/
/*http://idmysql.blogspot.com/2016/07/cara-menduplikat-tabel-mysql.html*/

/*cara 1*/
CREATE TABLE iuran2 LIKE iuran;

ALTER TABLE iuran2 
	ADD CONSTRAINT fk_iuran_peserta_2
	FOREIGN KEY (nip) REFERENCES peserta (nip);
	
INSERT INTO iuran2 SELECT * FROM iuran;

/*cara 2*/
CREATE TABLE iuran3 (			
	id int not null auto_increment,
	nip int(20) NOT NULL,
	phdpcoba decimal(13,2) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_iuran_peserta_3
		FOREIGN KEY (nip) REFERENCES peserta (nip)
) ENGINE=InnoDB;

INSERT INTO iuran3 SELECT * FROM iuran;

/*cara 3*/
'Save code INSERT TABLE'




CREATE TABLE iuran2 
AS SELECT * FROM iuran;

CREATE TABLE iuran (			/*membuat tabel untuk Relationship dengan FOREIGN KEY*/
	id int not null auto_increment,
	nip int(20) NOT NULL,
	phdp decimal(13,2) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_iuran_peserta
		FOREIGN KEY (nip) REFERENCES peserta (nip)
) ENGINE=InnoDB;

CREATE TABLE iuran (			/*FOREIGN KEY dengan kasus CASCADE-perubahan tabel1 pengaruh ke tabel2*/
	id int not null auto_increment,
	nip int(20) NOT NULL,
	phdp decimal(13,2) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_iuran_peserta
		FOREIGN KEY (nip) REFERENCES peserta (nip)
			ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

ALTER TABLE iuran 		/*FOREIGN KEY dengan kasus NO ACTION-perubahan tabel1 TIDAK pengaruh ke tabel2*/
	ADD CONSTRAINT fk_iuran_peserta
		FOREIGN KEY (nip) REFERENCES peserta (nip)
			ON DELETE NO ACTION ON UPDATE NO ACTION

ALTER TABLE iuran
	DROP CONSTRAINT fk_iuran_peserta1;	/*Menghapus CONSTRAINT*/

INSERT INTO iuran (nip, phdp) SELECT nip, phdp FROM peserta;		/*memasukkan data dari tabel ke tabel lainnya dengan Patokan Foreign Key*/

SELECT i.id as 'id iuran', i.nip as 'NIP', p.nama as 'NAMA', p.phdp as 'PHDP', p.phdp*6/100 as 'iuran peserta 6%', p.phdp*12.4/100 as 'iuran pemberi kerja 12.4%', p.phdp*1.4/100 as 'iuran lain 1.4%'
FROM iuran as i JOIN peserta as p
ON (i.nip = p.nip);

CREATE TABLE iuran (			
	id int not null auto_increment,
	nip int(20) NOT NULL,
	phdp decimal(13,2) NOT NULL,
    phdp*6/100 decimal(13,2)  NOT NULL,
    phdp*12.4/100 decimal(13,2)   NOT NULL,
    phdp*1.4/100 decimal(13,2) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT fk_iuran_peserta
		FOREIGN KEY (nip) REFERENCES peserta (nip)
) ENGINE=InnoDB;

/*RESET AUTO INCREMENT*/ 
/*https://www.eplusgo.com/reset-nilai-auto-increment-mysql/*/
ALTER TABLE iuran DROP id;
ALTER TABLE iuran ADD id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

/*menampilkan id nomor 1 sampai akhir (TIDAK sesuai ID)*/
SET @no=0;
SELECT @no:=@no+1, i.nip as 'NIP', p.nama as 'NAMA', p.phdp as 'PHDP', p.phdp*6/100 as 'iuran peserta 6%', p.phdp*12.4/100 as 'iuran pemberi kerja 12.4%', p.phdp*1.4/100 as 'iuran lain 1.4%'
FROM iuran as i JOIN peserta as p
ON (i.nip = p.nip);