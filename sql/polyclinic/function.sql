CREATE FUNCTION OpenIllness (
		@Passport CHAR(10)
		, @DoctorID INT
		, @DiseaseID INT
		, @FirstDate DATE
	)
RETURNS INT AS
BEGIN
	DECLARE @IllnessID INT
		, @PatientID INT

	IF (SELECT COUNT(*)
			FROM Patients
			WHERE Passport = @Passport
		) = 0		
		RETURN CAST('Patient not found!' AS INT)
	
	IF (SELECT COUNT(*)
			FROM Doctors
			WHERE DoctorID = @DoctorID
		) = 0
		RETURN CAST('Doctor not found!' AS INT)
		
	IF (SELECT COUNT(*)
			FROM Diseases
			WHERE DiseaseID = @DiseaseID 
		) = 0
		RETURN CAST('Disease not found!' AS INT)

	SELECT @IllnessID = COUNT(*) FROM Illnesses
	SELECT @PatientID = Patients.PatientID FROM Patients
		WHERE Passport = @Passport
	
	EXECUTE CreateIllness @IllnessID
		, @PatientID
		, @DoctorID
		, @DiseaseID
		, @FirstDate

	RETURN @IllnessID
END
