CREATE FUNCTION CanEat (
		@id1 INT
	)
RETURNS @result TABLE (
		cid INT
		, color CHAR(5)
		, type CHAR(6)
		, x CHAR
		, y INT
	) AS
BEGIN
	DECLARE @color CHAR(5)
		, @type CHAR(6)
		, @x CHAR
		, @y INT
	SELECT @color = Chessmen.color FROM Chessmen
		WHERE cid = @id1
	SELECT @type = Chessmen.type FROM Chessmen
		WHERE cid = @id1
	SELECT @x = Chessboard.x FROM Chessboard
		WHERE cid = @id1
	SELECT @y = Chessboard.y FROM Chessboard
		WHERE cid = @id1
		
	IF @type = 'rook'
		INSERT @result 
			SELECT Chessmen.cid
				, Chessmen.color
				, Chessmen.type
				, Chessboard.x
				, Chessboard.y
			FROM Chessmen
			JOIN Chessboard
			ON Chessmen.cid = Chessboard.cid
			WHERE (((ASCII(@x) - ASCII(x)) IN (
					SELECT MIN(ASCII(@x) - ASCII(Chessboard.x))
					FROM Chessboard
					WHERE ASCII(x) < ASCII(@x) AND y = @y
				) OR (ASCII(x) - ASCII(@x)) IN (
					SELECT MIN(ASCII(Chessboard.x) - ASCII(@x))
					FROM Chessboard
					WHERE ASCII(x) > ASCII(@x) AND y = @y
				)) AND y = @y
				OR ((@y - y) IN (
					SELECT MIN(@y - Chessboard.y)
					FROM Chessboard
					WHERE y < @y AND x = @x
				) OR (y - @y) IN (
					SELECT MIN(Chessboard.y - @y)
					FROM Chessboard
					WHERE y > @y AND x = @x
				)) AND x = @x
				) AND color <> @color
		RETURN
END
