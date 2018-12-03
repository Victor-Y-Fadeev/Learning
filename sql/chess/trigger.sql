CREATE TRIGGER MoveTrigger
ON Chessboard
INSTEAD OF UPDATE AS
BEGIN
	DECLARE @cid INT
		, @cid2 INT
		, @x CHAR
		, @y INT
		, @color CHAR(5)
	SELECT @cid = inserted.cid FROM inserted
	SELECT @x = inserted.x FROM inserted
	SELECT @y = inserted.y FROM inserted
	SELECT @color = Chessmen.color FROM Chessmen
		WHERE cid = @cid

	IF (SELECT COUNT(*)
			FROM Chessboard
			WHERE x = @x AND y = @y
		) = 0
		UPDATE Chessboard
		SET x = @x, y = @y
		WHERE cid = @cid
	ELSE
		BEGIN
			SELECT @cid2 = Chessboard.cid FROM Chessboard
				WHERE x = @x AND y = @y

			IF (SELECT Chessmen.color
					FROM Chessmen
					WHERE cid = @cid2
				) <> @color
				BEGIN
					DELETE FROM Chessboard
					WHERE cid = @cid2

					UPDATE Chessboard
					SET x = @x, y = @y
					WHERE cid = @cid
				END
		END
END
