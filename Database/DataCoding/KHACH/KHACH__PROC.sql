USE OCEAN_HOSTEL
GO



CREATE	PROC	PROC__KHACH__TonTaiSoCanCuoc
@SOCANCUOC	VARCHAR(20)
AS
BEGIN
	SELECT COUNT(*)
	FROM KHACH
	WHERE SOCANCUOC = @SOCANCUOC
END
GO

-------------------------------------------
CREATE	PROC	PROC__KHACH__GetListByRoomID
@MAPHG	VARCHAR(10)
AS
BEGIN
	SELECT (kh.HO + ' ' + kh.TEN) AS HOTEN, kh.MAKHACH
	FROM KHACH kh, KHACH_HOPDONG khd, HOPDONG hd, PHONG ph
	WHERE khd.MAKHACH  = kh.MAKHACH
		AND khd.MAHOPDONG = hd.MAHOPDONG
		AND ph.MAPHG = hd.MAPHG
		AND ph.MAPHG = @MAPHG
END
GO


-------------------------------------------
CREATE PROC	PROC__KHACH__GetList
AS
BEGIN
	
	SELECT hd.MAHOPDONG, kh.*, phg.TENPHG, phg.MAPHG
	FROM KHACH kh LEFT OUTER JOIN KHACH_HOPDONG khd ON khd.MAKHACH = kh.MAKHACH
					LEFT OUTER JOIN HOPDONG hd ON hd.MAHOPDONG = khd.MAHOPDONG
					LEFT OUTER JOIN PHONG phg ON phg.MAPHG = hd.MAPHG
END
GO

--------------------------------------------
CREATE	PROC	PROC__KHACH__INSERT
@MAKHACH		VARCHAR(10),
@HO				NVARCHAR(10),
@TEN			NVARCHAR(30),
@GIOITINH		NVARCHAR(10),
@NGAYSINH		DATE,
@QUEQUAN		NVARCHAR(75),
@SOCANCUOC		VARCHAR(20),
@SODIENTHOAI	VARCHAR(15)
AS
BEGIN
	INSERT INTO KHACH(MAKHACH, HO, TEN, GIOITINH, NGAYSINH, QUEQUAN, SOCANCUOC, SODIENTHOAI)
	VALUES (@MAKHACH, @HO, @TEN, @GIOITINH, @NGAYSINH, @QUEQUAN, @SOCANCUOC, @SODIENTHOAI)
END
GO


--------------------------------------------
CREATE	PROC	PROC__KHACH__UPDATE
@MAKHACH		VARCHAR(10),
@HO				NVARCHAR(10),
@TEN			NVARCHAR(30),
@GIOITINH		NVARCHAR(10),
@NGAYSINH		DATE,
@QUEQUAN		NVARCHAR(75),
@SOCANCUOC		VARCHAR(20),
@SODIENTHOAI	VARCHAR(15),
@TRANGTHAI		NVARCHAR(15)
AS
BEGIN
	UPDATE	KHACH
	SET HO = @HO,
		TEN = @TEN,
		GIOITINH = @GIOITINH,
		NGAYSINH = @NGAYSINH,
		QUEQUAN = @QUEQUAN,
		SOCANCUOC = @SOCANCUOC,
		SODIENTHOAI = @SODIENTHOAI,
		TRANGTHAI = @TRANGTHAI
	WHERE MAKHACH = @MAKHACH
END
GO



CREATE	PROC	PROC__KHACH__DELETE
@MAKHACH	VARCHAR(10)
AS
BEGIN
	DELETE FROM KHACH_VIPHAM
	WHERE MAKHACH = @MAKHACH
	
	DELETE FROM KHACH
	WHERE MAKHACH = @MAKHACH
END
GO