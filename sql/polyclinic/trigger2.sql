CREATE TRIGGER InsertPatient
ON Patients
INSTEAD OF INSERT AS
BEGIN
	DECLARE @PatientID INT
		, @Passport INT
	SELECT @PatientID = inserted.PatientID FROM inserted
	SELECT @Passport = inserted.Passport FROM inserted

	IF (SELECT People.Number
			FROM People
			WHERE PersonID = @PatientID
		) LIKE '%[^0-9]%' OR (
			@Passport LIKE '%[^0-9]%'
		)
		PRINT 'Incorrect numbers!'
END
