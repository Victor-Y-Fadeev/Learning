/*
SELECT COUNT(*)
FROM Chessboard
*/

/*
SELECT Chessmen.cid
FROM Chessmen
WHERE type LIKE 'k%'
*/

/*
SELECT Chessmen.type
	, COUNT(*)
FROM Chessmen
GROUP BY type
*/

/*
SELECT Chessboard.cid
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
WHERE color = 'white'
	AND type = 'pawn'
*/

/*
SELECT Chessmen.type
	, Chessmen.color
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
WHERE y = (ASCII(x) - ASCII('A') + 1)
*/

/*
SELECT DISTINCT Chessmen.color
	, COUNT(*)
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
GROUP BY color
*/

/*
SELECT DISTINCT Chessmen.type
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
WHERE color = 'black'
*/

/*
SELECT DISTINCT Chessmen.type
	, COUNT(*)
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
WHERE color = 'black'
GROUP BY type
*/

/*
SELECT DISTINCT Chessmen.type
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
GROUP BY type
HAVING COUNT(*) >= 2
*/

/*
SELECT DISTINCT MAX(Chessmen.color)
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
*/

/*
WITH Rook AS (
		SELECT DISTINCT Chessboard.x
			, Chessboard.y
		FROM Chessboard
		JOIN Chessmen
		ON Chessboard.cid = Chessmen.cid
		WHERE type = 'rook'
	)
SELECT Chessboard.cid
FROM Chessboard
WHERE x IN (
		SELECT Rook.x
		FROM Rook
	) OR y IN (
		SELECT Rook.y
		FROM Rook
	)
*/

/*
SELECT DISTINCT Chessmen.color
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
WHERE type = 'pawn'
GROUP BY color
HAVING COUNT(*) = 8
*/

/*
SELECT Chessboard.cid
FROM Chessboard
WHERE cid NOT IN (
		SELECT Chessboard2.cid
		FROM Chessboard2
	) OR cid IN (
		SELECT DISTINCT Chessboard.cid
		FROM Chessboard
		JOIN Chessboard2
		ON Chessboard.cid = Chessboard2.cid
		WHERE Chessboard.x != Chessboard2.x
			OR Chessboard.y != Chessboard2.y
	)
*/

/*
SELECT Chessboard.cid
FROM (
		SELECT Chessboard.cid
			, Chessboard.x
			, Chessboard.y
		FROM Chessboard
		EXCEPT
		SELECT Chessboard2.cid
			, Chessboard2.x
			, Chessboard2.y
		FROM Chessboard2
	) Chessboard
*/

/*
WITH King AS (
		SELECT DISTINCT Chessboard.x
			, Chessboard.y
		FROM Chessboard
		JOIN Chessmen
		ON Chessboard.cid = Chessmen.cid
		WHERE type = 'king'
			AND color = 'black'
	)
SELECT Chessboard.cid
FROM Chessboard
WHERE ABS(ASCII(x)  - ASCII((
		SELECT King.x
		FROM King))
	) <= 2 AND ABS(y  - (
		SELECT King.y
		FROM King)
	) <= 2
*/

/*
WITH King AS (
		SELECT DISTINCT Chessboard.x
			, Chessboard.y
		FROM Chessboard
		JOIN Chessmen
		ON Chessboard.cid = Chessmen.cid
		WHERE type = 'king'
			AND color = 'white'
	), Nearest AS (
		SELECT Chessboard.cid
			, ABS(ASCII(Chessboard.x)  - ASCII((
					SELECT King.x
					FROM King))
				) +	ABS(Chessboard.y  - (
					SELECT King.y
					FROM King)
				) AS l1
		FROM Chessboard
	)
SELECT Nearest.cid
FROM Nearest
WHERE l1 IN (
		SELECT MIN(Nearest.l1)
		FROM Nearest
		WHERE l1 > 0
		)
*/

/*
WITH Rook AS (
		SELECT Chessmen.color
			, Chessboard.x
			, Chessboard.y
		FROM Chessboard
		JOIN Chessmen
		ON Chessboard.cid = Chessmen.cid
		WHERE Chessmen.cid = 13
	)
SELECT Chessboard.cid
FROM Chessboard
JOIN Chessmen
ON Chessboard.cid = Chessmen.cid
WHERE (x IN (
		SELECT Rook.x
		FROM Rook
	) OR y IN (
		SELECT Rook.y
		FROM Rook
	)) AND color NOT IN (
		SELECT Rook.color
		FROM Rook
	)
*/


SELECT pvt.type, [black], [white]
FROM Chessmen
PIVOT (
		COUNT(cid)
		FOR color
		IN ([black], [white])
	) AS pvt

