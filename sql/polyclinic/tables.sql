CREATE TABLE People (
	PersonID INT PRIMARY KEY
	, FirstName VARCHAR(50) NOT NULL
	, MiddleName VARCHAR(50) NULL
	, LastName VARCHAR(50) NOT NULL
	, Number CHAR(10) NOT NULL
	, Address VARCHAR(250) NULL
	, UNIQUE (
			FirstName
			, LastName
			, Number
		)
	, CHECK (Number NOT LIKE '%[^0-9]%')
)

CREATE TABLE Patients (
	PatientID INT
	, Passport CHAR(10) UNIQUE NOT NULL
	, EMail VARCHAR(50) NULL
	, FOREIGN KEY (PatientID)
		REFERENCES People (PersonID)
	, CHECK (Passport NOT LIKE '%[^0-9]%')
)

CREATE TABLE Doctors (
	DoctorID INT 
	, SpecializationID INT NOT NULL
	, Position VARCHAR(50) NULL
	, EmploymentDate DATE NOT NULL
	, DismissalDate DATE NULL
	, FOREIGN KEY (DoctorID)
		REFERENCES People (PersonID)
)

CREATE TABLE Specialization (
	SpecializationID INT PRIMARY KEY
	, Name VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE Diseases (
	DiseaseID INT PRIMARY KEY
	, Name VARCHAR(50) UNIQUE NOT NULL
	, Symptoms VARCHAR(250) NULL
	, Prevention VARCHAR(MAX) NULL
	, Therapy VARCHAR(MAX) NOT NULL
)

CREATE TABLE Illnesses (
	IllnessID INT PRIMARY KEY
	, PatientID INT NOT NULL
	, DiseaseID INT NOT NULL
	, DoctorID INT NOT NULL
	, FirstDate DATE NOT NULL
	, RecoveryDate DATE NULL
	, UNIQUE (
			PatientID
			, DiseaseID
			, RecoveryDate
		)
)
