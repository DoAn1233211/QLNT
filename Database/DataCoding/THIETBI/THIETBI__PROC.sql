USE OCEAN_HOSTEL
GO



---------------------------------
CREATE	PROC	PROC__THIETBI__INSERT
@TENTBI		NVARCHAR(25),
@GIATBI		INT,
@SOLG_TON	INT
AS
BEGIN
	DECLARE @NEXTID VARCHAR(10)
	SELECT @NEXTID = dbo.FUNC__THIETBI__GetNextID()	--	Tự động lấy mã tiếp theo
	
	INSERT INTO THIETBI(MATBI, TENTBI, GIATBI, SOLG_TON)
	VALUES (@NEXTID, @TENTBI, @GIATBI, @SOLG_TON)
END
GO


---------------------------------
CREATE	PROC	PROC__THIETBI__DETELE
@MATBI		VARCHAR(10)
AS
BEGIN
	DELETE FROM THIETBI
	WHERE MATBI = @MATBI
END
GO

---------------------------------
CREATE	PROC	PROC__THIETBI__UPDATE
@MATBI		VARCHAR(10),
@TENTBI		NVARCHAR(15),
@GIATBI		INT,
@SOLG_TON	INT
AS
BEGIN
	UPDATE	THIETBI
	SET TENTBI = @TENTBI,
		GIATBI = @GIATBI,
		SOLG_TON = @SOLG_TON
	WHERE MATBI = @MATBI
END
GO