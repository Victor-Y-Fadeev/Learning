CREATE PROCEDURE DoctorDismissal (
		@DismissalLastName VARCHAR(50)
		, @DismissalFirstName VARCHAR(50)
		, @DismissalMiddleName VARCHAR(50)
		, @DismissalSpecialization VARCHAR(50)
		, @RecipientLastName VARCHAR(50)
		, @RecipientFirstName VARCHAR(50)
		, @RecipientMiddleName VARCHAR(50)
		, @RecipientSpecialization VARCHAR(50)
	) AS
BEGIN
	DECLARE @DismissalID INT
		, @RecipientID INT
	
	SELECT TOP(1) @DismissalID = Doctors.DoctorID FROM Doctors
		JOIN People
		ON Doctors.DoctorID = People.PersonID
		JOIN Specialization
		ON Doctors.SpecializationID = Specialization.SpecializationID
		WHERE LastName = @DismissalLastName
			AND FirstName = @DismissalFirstName
			AND Name = @DismissalSpecialization	
	
	SELECT TOP(1) @RecipientID = Doctors.DoctorID FROM Doctors
		JOIN People
		ON Doctors.DoctorID = People.PersonID
		JOIN Specialization
		ON Doctors.SpecializationID = Specialization.SpecializationID
		WHERE LastName = @RecipientLastName
			AND FirstName = @RecipientFirstName
			AND Name = @RecipientSpecialization
		
	UPDATE Illnesses
	SET DoctorID = @RecipientID
	WHERE PatientID IN (
			SELECT Illnesses.PatientID
			FROM Illnesses
			WHERE DoctorID = @DismissalID
				AND RecoveryDate IS NULL
		)

	UPDATE Doctors
	SET DismissalDate = CONVERT(DATE, GETDATE())
	WHERE DoctorID = @DismissalID
END
