create table KhachHang(
  id int primary key identity(1,1),
  Ten varchar(255) not null,
  ChungMT varchar(255) not null,
  DiaChi varchar(255) not null
);

create table LienLac (
  id int primary key identity(1,1),
  SoDT varchar(255) not null unique,
  LoaiTB varchar(255) not null,
  NgayDK datetime not null,
  KhachHang_id int not null foreign key references KhachHang(id)
);


insert into KhachHang(Ten,ChungMT, DiaChi)
	values ('Nguyen Nguyet Nga','123456789','Ha Noi'),
			('Nguyen Thi Ngat','123456799','Ha Giang'),
			('Trinh Van Phuc','011120040','Bac Ninh');


insert into LienLac(SoDT,LoaiTB, NgayDK,KhachHang_id)
	values ('0123456789', 'Tra truoc','2002-12-12', 1),
			('012345678', 'Tra sau','2009-12-12', 2),
			('0385225687', 'Tra truoc','2004-11-01',3),
			('123458769', 'Tra sau','2004-12-12', 1),
			('012543678', 'Tra sau','2009-12-12', 2),
			('0385225689', 'Tra truoc','2004-11-01',3);
--4
--a>
select * from KhachHang
--b>
select * from LienLac

--5
--a>
select * from LienLac A inner join KhachHang B on A.KhachHang_id = B.id where SoDT ='0123456789'
--b>
select * from Khachhang where ChungMT ='123456789'
--c>
select SoDT from LienLac where KhachHang_id in 
	(select id from KhachHang where ChungMT ='123456789')
--d>
select * from LienLac where NgayDK = '2009-12-12'
--e>
select SoDT from LienLac where KhachHang_id in 
	(select id from KhachHang where DiaChi ='Ha Noi')

--6
select count(*) as SoKH from KhachHang;
select count(*) as SoTB from LienLac;
select count(*) as SoTB from LienLac where NgayDK = '2009-12-12'
select A.* ,B.SoDT,B.LoaiTB,B.NgayDK from KhachHang A inner join LienLac B on A.id = B.KhachHang_id

--8
--
create view View_KhachHang as 
select id as MaKH,Ten,DiaChi from KhachHang

select * from View_KhachHang

-- 
create view View_KhachHang_ThueBao as
select A.id as MaKH,A.Ten,A.DiaChi, B.SoDT from KhachHang A
	inner join LienLac B on A.id = B.KhachHang_id

select * from View_KhachHang_ThueBao
 
