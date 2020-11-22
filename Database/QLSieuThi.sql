
CREATE DATABASE [QLBANHANG_ST]
go
USE [QLBANHANG_ST]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_HangHoa](@TenHang nvarchar(50), @GiaHang int, @NgayNhap datetime, @HanSd datetime)
as
declare @i char(10)
begin
set @i = (select count(ID_HangHoa) from HangHoa)
if @i <10 begin insert into HangHoa (ID_HangHoa,TenHang,GiaHang,NgayNhap,Hansd) values ('HH00'+ convert(varchar(4),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
else if @i <100  begin insert into HangHoa (ID_HangHoa,TenHang,GiaHang,NgayNhap,Hansd) values ('HH0'+ convert(varchar(5),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
else if @i <1000 begin insert into HangHoa (ID_HangHoa,TenHang,GiaHang,NgayNhap,Hansd) values ('HH'+ convert(varchar(6),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
--else if @i <10000 begin insert into HangHoa values ('HH'+ convert(varchar(8),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
--else begin insert into HangHoa values ('HH'+ convert(varchar(6),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_HoaDon](@id char(10), @ten nvarchar(30), @idkh char(10), @idhh char(10), @idnv char(10))
as
begin
insert into HoaDon values (@id, @ten, @idkh, @idhh, @idnv)
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_KhachHang](@id char(10), @ten nvarchar(50), @sdt int, @gioitinh nvarchar(100))
as
begin
insert into KhachHang values (@id, @ten, @sdt, @gioitinh)
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_NhanVien](@ID_NhanVien char(10),@Hoten nvarchar(50),@QueQuan nvarchar(100),@GT char(3),@CMND int, @NgaySinh datetime)
as
begin
	insert into NhanVien(ID_NhanVien,HoTen,Quequan,GT,CMND,NgaySinh)
	values(@ID_NhanVien,@Hoten,@QueQuan,@GT,@CMND,@NgaySinh)
end

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DelDG](@madg varchar(10))
as
begin
delete from tblDocGia where MaDG = @madg
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_HangHoa](@ID_HangHoa char(10))
as 
begin
 delete from HangHoa where ID_HangHoa=@ID_HangHoa
 end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_HoaDon](@ID_HoaDon char(10))
as
begin
delete from HoaDon
where ID_HoaDon= @ID_HoaDon
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_KhachHang](@ID_KhachHang char(10))
as
begin
delete from KhachHang
where ID_KhachHang= @ID_KhachHang
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_NhanVien](@ID_NhanVien char(10))
as
begin
	delete from NhanVien
		where ID_NhanVien=@ID_NhanVien	
end	
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Edit_HangHoa](@ID_HangHoa char(10), @TenHang nvarchar(50),@GiaHang int, @NgayNhap datetime, @HanSd datetime)
as  
begin
update HangHoa
set TenHang= @TenHang, GiaHang= @GiaHang, NgayNhap=@NgayNhap,HanSd=@HanSd
where ID_HangHoa= @ID_HangHoa
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Edit_HoaDon](@ID_HoaDon char(10),@Ten_HoaDon nvarchar(30),@ID_HangHoa char(10),@ID_NhanVien char(10),@ID_KhachHang char(10))
as
begin
update HoaDon
set ID_HoaDon=@ID_HoaDon,Ten_HoaDon=@Ten_HoaDon,ID_HangHoa=@ID_HangHoa,ID_NhanVien=@ID_NhanVien,ID_KhachHang=@ID_KhachHang
where ID_HoaDon=@ID_HoaDon
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Edit_KhachHang](@ID_KhachHang char(10),@Ten_KhachHang char(20),@SDT_KhachHang int,@GioiTinh_KhachHang char(3))
as
begin
	update KhachHang
	set ID_KhachHang=@ID_KhachHang,Ten_KhachHang=@Ten_KhachHang,SDT_KhachHang=@SDT_KhachHang,GioiTinh_KhachHang=@GioiTinh_KhachHang
	where ID_KhachHang=@ID_KhachHang
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Edit_NhanVien](@ID_NhanVien char(10),@HoTen char(50),@QueQuan nvarchar(100),@GT char(3),@CMND int,@NgaySinh datetime)			
as
begin
	update NhanVien
	set ID_NhanVien=@ID_NhanVien,HoTen=@Hoten,Quequan=@QueQuan,GT=@GT,NgaySinh=@Ngaysinh,CMND=@CMND
	where ID_NhanVien=@ID_NhanVien
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadHangHoa]
as
begin
	select *from HangHoa
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadHoaDon]
as
begin
select* from HoaDon
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadKhachHang]
as
begin
	select *from KhachHang
end

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadNhanVien]
as 
begin
select * from NhanVien
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiemhoadon](@tim nvarchar(max))
as
begin
select * from HoaDon
where ID_HoaDon like '%'+ @tim+ '%' or Ten_HoaDon like '%'+@tim+'%'
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiemkhachhang](@tim nvarchar(max))
as
begin
	select *from KhachHang
	where Ten_KhachHang like '%'+@tim+ '%' or ID_KhachHang like '%' +@tim+ '%'
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiemnhanvien](@tim nvarchar(max))
as
begin
	select *from NhanVien
	where HoTen like '%'+@tim+ '%' or ID_NhanVien like '%' +@tim+ '%'
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkienhanghoa](@tim nvarchar(max))
as
begin
	select *from HangHoa
	where TenHang like '%' + @tim + '%' or ID_HangHoa like '%' + @tim + '%'
end
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HangHoa](
	[ID_HangHoa] [char](10) NOT NULL,
	[TenHang] [nvarchar](50) NOT NULL,
	[GiaHang] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[HanSd] [datetime] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [HH_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_HangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/23/2016 8:31:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID_HoaDon] [char](10) NOT NULL,
	[Ten_HoaDon] [nvarchar](30) NULL,
	[ID_KhachHang] [char](10) NOT NULL,
	[ID_HangHoa] [char](10) NOT NULL,
	[ID_NhanVien] [char](10) NOT NULL,
 CONSTRAINT [HD_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_HoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KhachHang] [char](10) NOT NULL,
	[Ten_KhachHang] [nvarchar](50) NULL,
	[SDT_KhachHang] [int] NULL,
	[GioiTinh_KhachHang] [nvarchar](100) NULL,
 CONSTRAINT [KH_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_KhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID_NhanVien] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Quequan] [nvarchar](100) NULL,
	[GT] [char](3) NULL,
	[CMND] [int] NULL,
	[NgaySinh] [datetime] NULL,
	[Luong] [int] NULL,
 CONSTRAINT [NV_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_NhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH001     ', N'Sữa Tắm Nam', 100000, CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH002     ', N'Dầu Gội', 50000, CAST(0x0000A44E00000000 AS DateTime), CAST(0x0000A7E200000000 AS DateTime), 2000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH003     ', N'Khăn Tắm', 20000, CAST(0x0000A41300000000 AS DateTime), CAST(0x0000AC2A00000000 AS DateTime), 2000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH004     ', N'Ti Vi', 3000000, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000ACE100000000 AS DateTime), 3000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH005     ', N'Quạt Điện', 1000000, CAST(0x0000A44E00000000 AS DateTime), CAST(0x0000AE3000000000 AS DateTime), 2500)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH006     ', N'Ấm Siêu Tốc', 500000, CAST(0x0000A30200000000 AS DateTime), CAST(0x0000ACC300000000 AS DateTime), 5000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH007     ', N'Chăn Bông', 200000, CAST(0x0000A19300000000 AS DateTime), CAST(0x0000A71000000000 AS DateTime), 5000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH008     ', N'Màn', 100000, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000AB5400000000 AS DateTime), 4000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH009     ', N'Nho Sấy', 200000, CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A4AB00000000 AS DateTime), 5000)
INSERT [dbo].[HangHoa] ([ID_HangHoa], [TenHang], [GiaHang], [NgayNhap], [HanSd], [SoLuong]) VALUES (N'HH010     ', N'Dừa Khô', 100000, CAST(0x0000A2A600000000 AS DateTime), CAST(0x0000A43200000000 AS DateTime), 2000)
INSERT [dbo].[HoaDon] ([ID_HoaDon], [Ten_HoaDon], [ID_KhachHang], [ID_HangHoa], [ID_NhanVien]) VALUES (N'HD001     ', N'Hóa Đơn 1', N'KH001     ', N'HH001     ', N'NV001     ')
INSERT [dbo].[HoaDon] ([ID_HoaDon], [Ten_HoaDon], [ID_KhachHang], [ID_HangHoa], [ID_NhanVien]) VALUES (N'HD002     ', N'Hóa Đơn 2', N'KH002     ', N'HH002     ', N'NV002     ')
INSERT [dbo].[HoaDon] ([ID_HoaDon], [Ten_HoaDon], [ID_KhachHang], [ID_HangHoa], [ID_NhanVien]) VALUES (N'HD003     ', N'Hóa Đơn 3', N'KH003     ', N'HH003     ', N'NV003     ')
INSERT [dbo].[HoaDon] ([ID_HoaDon], [Ten_HoaDon], [ID_KhachHang], [ID_HangHoa], [ID_NhanVien]) VALUES (N'HD004     ', N'Hóa Đơn 4', N'KH004     ', N'HH004     ', N'NV004     ')
INSERT [dbo].[HoaDon] ([ID_HoaDon], [Ten_HoaDon], [ID_KhachHang], [ID_HangHoa], [ID_NhanVien]) VALUES (N'HD005     ', N'Hóa Đơn 5', N'KH005     ', N'HH005     ', N'NV005     ')
INSERT [dbo].[KhachHang] ([ID_KhachHang], [Ten_KhachHang], [SDT_KhachHang], [GioiTinh_KhachHang]) VALUES (N'KH001     ', N'Lê Hoàng Son', 1649782842, N'Nam')
INSERT [dbo].[KhachHang] ([ID_KhachHang], [Ten_KhachHang], [SDT_KhachHang], [GioiTinh_KhachHang]) VALUES (N'KH002     ', N'Đặng Thị Hải Yên', 123456789, N'Nữ')
INSERT [dbo].[KhachHang] ([ID_KhachHang], [Ten_KhachHang], [SDT_KhachHang], [GioiTinh_KhachHang]) VALUES (N'KH003     ', N'Vũ Quốc Tuấn', 123456978, N'Nam')
INSERT [dbo].[KhachHang] ([ID_KhachHang], [Ten_KhachHang], [SDT_KhachHang], [GioiTinh_KhachHang]) VALUES (N'KH004     ', N'Nguy?n Van A        ', 985585027, N'Nam')
INSERT [dbo].[KhachHang] ([ID_KhachHang], [Ten_KhachHang], [SDT_KhachHang], [GioiTinh_KhachHang]) VALUES (N'KH005     ', N'Lê Thị Trang', 988234567, N'Nữ')
INSERT [dbo].[NhanVien] ([ID_NhanVien], [HoTen], [Quequan], [GT], [CMND], [NgaySinh], [Luong]) VALUES (N'NV001     ', N'Lê Văn A', N'Hà Nam', N'Nam', 12345678, CAST(0x000084B200000000 AS DateTime), 10000)
INSERT [dbo].[NhanVien] ([ID_NhanVien], [HoTen], [Quequan], [GT], [CMND], [NgaySinh], [Luong]) VALUES (N'NV002     ', N'Ngô Thành Trung', N'Thanh Hóa', N'Nam', 12435679, CAST(0x0000864000000000 AS DateTime), 20000)
INSERT [dbo].[NhanVien] ([ID_NhanVien], [HoTen], [Quequan], [GT], [CMND], [NgaySinh], [Luong]) VALUES (N'NV003     ', N'Phạm Ngọc Anh', N'Nghệ An', N'Nam', 12534686, CAST(0x000081D800000000 AS DateTime), 40000)
INSERT [dbo].[NhanVien] ([ID_NhanVien], [HoTen], [Quequan], [GT], [CMND], [NgaySinh], [Luong]) VALUES (N'NV004     ', N'Một Hai Ba', N'Hà Tĩnh', N'Nam', 11223389, CAST(0x0000808900000000 AS DateTime), 50000)
INSERT [dbo].[NhanVien] ([ID_NhanVien], [HoTen], [Quequan], [GT], [CMND], [NgaySinh], [Luong]) VALUES (N'NV005     ', N'Phạm Thị Phạm', N'An Giang', N'N? ', 13456789, CAST(0x000084B400000000 AS DateTime), 50000)
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'lehoangson', N'080192')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'dangthihaiyen', N'dthy27795')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'lethitrang', N'lethitrang')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'vuquoctuan', N'vuquoctuan')
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_hanghoa_hoadon] FOREIGN KEY([ID_HangHoa])
REFERENCES [dbo].[HangHoa] ([ID_HangHoa])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_hanghoa_hoadon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_khachhang_hoadon] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[KhachHang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_khachhang_hoadon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_nhanvien_hoadon] FOREIGN KEY([ID_NhanVien])
REFERENCES [dbo].[NhanVien] ([ID_NhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_nhanvien_hoadon]
GO
USE [master]
GO
ALTER DATABASE [QLBANHANG_ST] SET  READ_WRITE 
GO
