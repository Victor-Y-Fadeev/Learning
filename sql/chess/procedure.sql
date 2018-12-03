CREATE PROCEDURE TypeEat (
		@type CHAR(6)
		, @color CHAR(5)
	) AS
BEGIN
	DECLARE @cid INT
	DECLARE TypeCid CURSOR FOR
		SELECT Chessmen.cid
		FROM Chessmen
		WHERE type = @type AND color = @color

	OPEN TypeCid

	FETCH TypeCid INTO @cid
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT DISTINCT Chessmen.cid
			, Chessmen.color
			, Chessmen.type
			, Chessboard.x
			, Chessboard.y
		FROM Chessmen
		JOIN Chessboard
		ON Chessmen.cid = Chessboard.cid
		WHERE Chessmen.cid = @cid

		IF (SELECT COUNT(*)
				FROM CanEat(@cid)
			) <> 0
			SELECT cid
			FROM CanEat(@cid)
		ELSE
			SELECT 'There is nobody to eat'

		FETCH FROM TypeCid INTO @cid
	END

	CLOSE TypeCid
	DEALLOCATE TypeCid
END
