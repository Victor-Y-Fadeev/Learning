CREATE PROCEDURE CreateIllness (
		@IllnessID INT
		, @PatientID INT
		, @DiseaseID INT
		, @DoctorID INT
		, @FirstDate DATE
	) AS
INSERT INTO Illnesses (
	IllnessID
	, PatientID
	, DiseaseID
	, DoctorID
	, FirstDate
	, RecoveryDate
)
VALUES (
	@IllnessID
	, @PatientID
	, @DiseaseID
	, @DoctorID
	, @FirstDate
	, NULL
)
