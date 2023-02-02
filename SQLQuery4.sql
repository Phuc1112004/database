insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue)
values('NCC001','Cty TNHH Toan Phap','Hai Chau','05113999888','568941'),
	  ('NCC002','Cty Co Phan Đong Du','Lien Chieu','05113999889','456789'),
	  ('NCC003','Ong Nguyen Van A','Hoa Thuan','05113999890','321456'),
	  ('NCC004','Cty Co Phan Toan Cau Xanh','Hai Chau','0511399991','789654'),
	  ('NCC005','Cty TNHH AMA','Thanh Khe','05113999892','890432'),
	  ('NCC006','Ba Tran Thi Bich Van','Lien Chieu','05113999893','123654'),
	  ('NCC007','Cty TNHH Phan Thanh','Thanh Khe','05113999894','678432'),
	  ('NCC008','Ong Phan Dinh Nam','Hoa Thuan','05113999895','890432'),
	  ('NCC009','Tap Doan Dong Nam A','Lien Chieu','05113999896','980324'),
	  ('NCC0010','Ong Trinh Van Phuc','Lien Chieu','05113999897','765489');

select * from NHACUNGCAP;

insert into LOAIDICHVU(MaLoaiDV,TenLoaiDichVu)
values('DV01','Dich Vu Xe Taxi'),
	  ('DV02','Dich Vu Xe Bus Cong Cong Theo Tuyen Co Dinh'),
	  ('DV03','Dich Vu Xe Cho Thue Theo Hop Dong');

select * from LOAIDICHVU;

insert into MUCPHI(MaMP,DonGia,MoTa)
values('MP01',10000,'Ap dung tu 1/2015'),
	  ('MP02',15000,'Ap dung tu 2/2015'),
	  ('MP03',20000,'Ap dung tu 1/2010'),
	  ('MP04',25000,'Ap dung tu 2/2011');

select * from MUCPHI;

insert into DONGXE(DongXe,HangXe,SoChoNgoi)
values('Hiace','Toyota',16),
	  ('Vios','Toyota',5),
	  ('Escape','Ford',5),
	  ('Cerato','KIA',7),
	  ('Forte','KIA',5),
	  ('Starex','Huyndai',7),
	  ('Grand-i10','Huyndai',7);

select * from DONGXE;

insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC_id,MaLoaiDV_id,MaMP_id,DongXe_id,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy)
values('DK001','NCC001','DV01','MP01','Hiace','2015-11-20','2016-11-20',4),
	  ('DK002','NCC002','DV02','MP02','Vios','2016-11-20','2017-11-20',3),
	  ('DK003','NCC003','DV03','MP03','Escape','2017-11-20','2018-11-20',5),
	  ('DK004','NCC005','DV01','MP04','Hiace','2015-11-20','2016-11-20',4),
	  ('DK005','NCC002','DV02','MP03','Vios','2016-11-20','2017-11-20',3),
	  ('DK006','NCC004','DV03','MP04','Escape','2017-11-20','2018-11-20',5),
	  ('DK007','NCC005','DV01','MP03','Cerato','2015-11-30','2016-1-25',8),
	  ('DK008','NCC006','DV01','MP02','Vios','2016-02-28','2016-8-15',9),
	  ('DK009','NCC005','DV03','MP02','Grand-i10','2016-04-27','2017-04-30',10),
	  ('DK010','NCC006', 'DV01', 'MP02','Forte', '2012-03-31', '2019-05-20',1),
	('DK011','NCC007', 'DV01',  'MP01','Forte', '2017-01-25', '2019-05-20',7),
	('DK012','NCC007', 'DV03','MP01', 'Cerato',  '2018-03-13', '2019-05-20',4),
	('DK013','NCC003', 'DV02','MP01', 'Cerato',  '2015-06-12', '2019-05-20',7),
	('DK014','NCC008', 'DV02', 'MP01', 'Cerato', '2016-08-13', '2018-05-20',5),
	('DK015','NCC003', 'DV01','MP02',  'Hiace', '2015-03-12', '2016-05-20',10),
	('DK016','NCC001', 'DV03', 'MP02', 'Grand-i10', '2012-10-21', '2016-05-20',1),
	('DK017','NCC002', 'DV03', 'MP03', 'Cerato', '2011-11-30', '2018-05-20',2),
	('DK018','NCC008', 'DV03', 'MP04', 'Escape', '2015-12-30', '2019-05-20',4),
	('DK019','NCC003', 'DV03', 'MP03',  'Escape','2013-05-30', '2015-05-20',5),
	('DK020','NCC002', 'DV03', 'MP04',  'Cerato','2012-06-21', '2013-05-20',7),
	('DK021','NCC006', 'DV01', 'MP02',  'Forte','2015-08-20', '2019-05-20',8),
	('DK022','NCC002', 'DV02', 'MP04', 'Cerato', '2014-05-30', '2018-05-20',4),
	('DK023','NCC002', 'DV01', 'MP03', 'Forte', '2016-06-21', '2017-05-20',5),
	('DK024','NCC003', 'DV03', 'MP04', 'Forte', '2015-10-21', '2016-05-20',1),
	('DK025','NCC003', 'DV03', 'MP02', 'Hiace', '2013-03-12', '2015-05-20',2);

select * from DANGKYCUNGCAP;

-- 3
SELECT DongXe FROM DONGXE WHERE SoChoNgoi > 5

--4 
SELECT *
FROM NHACUNGCAP
WHERE MaNhaCC IN (
	SELECT DISTINCT MaNhaCC_id
	FROM DangKyCungCap
	WHERE (DongXe_id IN (
		SELECT DongXe
		FROM DONGXE
		WHERE HangXe = 'Toyota')
		AND MaMP_id IN (
		SELECT MaMP
		FROM MUCPHI
		WHERE DonGia = 15000))
	OR (
		DongXe_id IN (
		SELECT DongXe
		FROM DONGXE
		WHERE HangXe = 'KIA')
		AND MaMP_id IN (
		SELECT MaMP
		FROM MUCPHI
		WHERE DonGia = 20000))
);


 --5
SELECT * FROM NHACUNGCAP ORDER BY TenNhaCC ASC , MaSoThue DESC


-- 6
SELECT MaNhaCC_id, count(MaDKCC) as SoLanCC FROM DANGKYCUNGCAP  where NgayBatDauCungCap = '2015-11-20' group by MaNhaCC_id


--7 
SELECT HangXe FROM DONGXE GROUP BY HANGXE


--8
SELECT ncc.MaNhaCC, MaDKCC,TenNhaCC, DiaChi, MaSoThue,TenLoaiDichVu,DonGia, HangXe, NgayBatDauCungCap, NgayKetThucCungCap
FROM NHACUNGCAP ncc
LEFT JOIN DANGKYCUNGCAP dkcc
	ON dkcc.MaNhaCC_id = ncc.MaNhaCC
LEFT JOIN LOAIDICHVU ldv
	ON dkcc.MaLoaiDV_id = ldv.MaLoaiDV
LEFT JOIN MUCPHI mp
	ON dkcc.MaMP_id = mp.MaMP
LEFT JOIN DONGXE dx
	ON dkcc.DongXe_id = dx.DongXe;

--9
SELECT *
FROM NHACUNGCAP
WHERE MaNhaCC IN (
	SELECT MaNhaCC
	FROM DANGKYCUNGCAP
	WHERE DongXe_id = 'Hiace' OR DongXe_id = 'Cerato'	
);

--10
SELECT ncc.MaNhaCC, ncc.TenNhaCC, ncc.DiaChi, ncc.SoDT, ncc.MaSoThue
FROM NHACUNGCAP ncc
LEFT JOIN DANGKYCUNGCAP dkcc
	ON ncc.MaNhaCC = dkcc.MaNhaCC_id
WHERE MaDKCC IS NULL;