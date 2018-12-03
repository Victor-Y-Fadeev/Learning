CREATE PROCEDURE CloseIllness (
		@Passport CHAR(10)
		, @DiseaseID INT
	) AS
BEGIN
	DECLARE @IllnessID INT
		, @PatientID INT
		, @PatientLastName VARCHAR(50)
		, @PatientFirstName VARCHAR(50)
		, @PatientMiddleName VARCHAR(50)
	SELECT @IllnessID = Illnesses.IllnessID FROM Illnesses
		JOIN Patients
		ON Illnesses.PatientID = Patients.PatientID
		WHERE Passport = @Passport
			AND DiseaseID = @DiseaseID
			AND RecoveryDate IS NULL

	IF @IllnessID IS NOT NULL
		BEGIN
			UPDATE Illnesses
			SET RecoveryDate = CONVERT(date, GETDATE())
			WHERE IllnessID = @IllnessID
			
			SELECT @PatientID = Illnesses.PatientID FROM Illnesses
				WHERE IllnessID = @IllnessID
			SELECT @PatientLastName = People.LastName FROM People
				WHERE PersonID = @PatientID
			SELECT @PatientFirstName = People.FirstName FROM People
				WHERE PersonID = @PatientID
			SELECT @PatientMiddleName = People.MiddleName FROM People
				WHERE PersonID = @PatientID

			SELECT @PatientLastName AS PatientLastName
				, @PatientFirstName AS PatientFirstName
				, @PatientMiddleName AS PatientMiddleName
				, People.LastName
				, People.FirstName
				, People.MiddleName
				, Specialization.Name
				, Illnesses.FirstDate
				, Illnesses.RecoveryDate
			FROM Illnesses
			JOIN People
			ON Illnesses.DoctorID = People.PersonID
			JOIN Doctors
			ON Illnesses.DoctorID = Doctors.DoctorID
			JOIN Specialization
			ON Doctors.SpecializationID = Specialization.SpecializationID
			WHERE IllnessID = @IllnessID
		END
	ELSE
		PRINT 'Current disease not found!'
END
