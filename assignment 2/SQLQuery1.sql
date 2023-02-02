create table CacHang(
	MaSoHang int primary key not null ,
	TenHang varchar(255) not null,
	DiaChi text not null,
	DienThoai varchar(15) not null unique
);

create table SanPham(
	MaSP int primary key not null,
	TenSP varchar(255) not null,
	MoTa Varchar(255),
	DonVi varchar(255) not null,
	Gia int not null
);

create table BangTG(
	SoLuong varchar(20) not null,
	MaSoHang_id int not null foreign key references CacHang(MaSoHang),
	MaSP_id int not null foreign key references SanPham(MaSP)
);