CREATE TABLE Chessmen (
cid INT PRIMARY KEY
, type CHAR(6) CHECK (type IN ('king', 'queen', 'rook', 'bishop', 'knight', 'pawn'))
, color CHAR(5) CHECK (color IN ('black', 'white')));

CREATE TABLE Chessboard (
x CHAR CHECK (x LIKE '[A-H]')
, y INT CHECK (y > 0 and y < 9)
, cid INT UNIQUE REFERENCES Chessmen (cid)
, UNIQUE (x, y));
