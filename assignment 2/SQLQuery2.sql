insert into CacHang(MaSoHang,TenHang,DiaChi,DienThoai)
	values (123,'Asus','USA','0987654321'),
			(124,'Acer','Frankreich','0123456789'),
			(125,'Msi','China','0983456789');

select * from CacHang;


insert  into SanPham(MaSP,TenSP,MoTa,DonVi,Gia)
	values (1,'may tinh T450','may tinh cu','chiec',1000),
			(2,'dien thoai nokia5670','dien thoai hot','chiec',200),
			(3,'may in samsung450','may in thuong','chiec',100),
			(4,'may tinh T470','may tinh hong','chiec',100),
			(5,'dien thoai samsung A33','dien thoai hot','chiec',5000),
			(6,'dien thoai 14 promax','dien thoai sieu hot','chiec',10000);
select * from SanPham

insert into BangTG(SoLuong,MaSoHang_id,MaSP_id)
	values (10,123,1),
			(1000,123,2),
			(10,123,3),
			(100,124,4),
			(20,125,5),
			(40,124,1),
			(35,123,2),
			(26,125,3),
			(15,125,5),
			(29,124,4),
			(11,123,6),
			(9,124,6),
			(3,125,6);
select * from BangTG


--4
select TenHang from CacHang
select * from SanPham

--5
select * from CacHang order by TenHang desc
select * from SanPham order by Gia desc
select * from CacHang where TenHang = 'Asus'
select * from SanPham where MaSP in(select MaSP_id from BangTG where SoLuong < 11)
select * from SanPham where MaSP in 
	(select MaSP_id from BangTG where MaSoHang_id in
		(select MaSoHang from CacHang where TenHang ='Asus')
	 )

--6
select count(MaSoHang) as SoHang from CacHang
select count(MaSP) as SoSanPham from SanPham
select sum()

