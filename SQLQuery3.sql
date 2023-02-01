create table NHACUNGCAP(
	MaNhaCC varchar(20) primary key ,
	TenNhaCC varchar(255) not null,
	DiaChi text not null,
	SoDT varchar(20) not null unique,
	MaSoThue varchar(255) not null
);

create table LOAIDICHVU(
	MaLoaiDV varchar(20) primary key ,
	TenLoaiDichVu text not null
);

create table MUCPHI(
	MaMP varchar(20) primary key,
	DonGia int not null check(DonGia >=0) default 0,
	MoTa text
);

create table DONGXE(
	DongXe varchar(20) primary key,
	HangXe varchar(255) not null,
	SoChoNgoi int not null check(SoChoNgoi>=1)
);

create table DANGKYCUNGCAP(
	MaDKCC varchar(20) primary key,
	MaNhaCC_id varchar(20) not null foreign key references NHACUNGCAP(MaNhaCC),
	MaLoaiDV_id varchar(20) not null foreign key references LOAIDICHVU(MaLoaiDV),
	MaMP_id varchar(20) not null foreign key references MUCPHI(MaMP),
	DongXe_id varchar(20) not null foreign key references DONGXE(DongXe),
	NgayBatDauCungCap datetime not null check(NgayBatDauCungCap <= getdate()),
	NgayKetThucCungCap datetime not null check(NgayKetThucCungCap <= getdate()),
	SoLuongXeDangKy varchar(255) not null 
); 