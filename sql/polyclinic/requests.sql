/*
SELECT People.LastName
	, People.FirstName
	, People.MiddleName
	, Specialization.Name
FROM Doctors
JOIN People
ON Doctors.DoctorID = People.PersonID
JOIN Specialization
ON Doctors.SpecializationID = Specialization.SpecializationID
ORDER BY LastName
	, FirstName
	, MiddleName
*/

/*
SELECT People.LastName
	, People.FirstName
	, People.MiddleName
FROM Doctors
JOIN People
ON Doctors.DoctorID = People.PersonID
JOIN Specialization
ON Doctors.SpecializationID = Specialization.SpecializationID
WHERE Name = 'Therapist'
ORDER BY LastName
	, FirstName
	, MiddleName
*/

/*
SELECT COUNT(*)
FROM Doctors
WHERE DismissalDate IS NULL
*/

/*
SELECT People.Address
FROM Patients
JOIN People
ON Patients.PatientID = People.PersonID
WHERE Passport = '7845360351'
*/

/*
SELECT TOP(1) People.LastName
	, People.FirstName
	, People.MiddleName
FROM Illnesses
JOIN People
ON Illnesses.PatientID = People.PersonID
GROUP BY LastName
	, FirstName
	, MiddleName
	, PatientID
ORDER BY COUNT(*) DESC
*/

/*
SELECT Diseases.Name
	, Illnesses.FirstDate
	, Illnesses.RecoveryDate
FROM Illnesses
JOIN Diseases
ON Illnesses.DiseaseID = Diseases.DiseaseID
WHERE PatientID = 2
*/

/*
SELECT TOP(1) Diseases.Name
	, Diseases.Therapy
FROM Diseases
JOIN Illnesses
ON Diseases.DiseaseID = Illnesses.DiseaseID
JOIN Patients
ON Illnesses.PatientID = Patients.PatientID
WHERE Passport = '7836220351'
ORDER BY Illnesses.FirstDate DESC
*/

/*
SELECT People.LastName
	, People.FirstName
	, People.MiddleName
FROM Illnesses
JOIN Patients
ON Illnesses.PatientID = Patients.PatientID
JOIN People
ON Patients.PatientID = People.PersonID
WHERE DoctorID IN (
		SELECT Doctors.DoctorID
		FROM Doctors
		JOIN People
		ON Doctors.DoctorID= People.PersonID
		WHERE LastName = 'Garcia'
	)
ORDER BY LastName
	, FirstName
	, MiddleName
*/


EXECUTE DoctorDismissal 'Garcia'
	, 'Priscilla'
	, NULL
	, 'Therapist'
	, 'Jai'
	, 'Shawn'
	, NULL
	, 'Therapist'
	
UPDATE Doctors
SET DismissalDate = NULL
WHERE DoctorID IN (
		SELECT People.PersonID
		FROM People
		WHERE LastName = 'Garcia'
	)

UPDATE Illnesses
SET RecoveryDate = NULL
WHERE DoctorID IN (
		SELECT People.PersonID
		FROM People
		WHERE LastName = 'Garcia'
	)



SELECT Doctors.DismissalDate
FROM Doctors
JOIN People
ON Doctors.DoctorID = People.PersonID
WHERE LastName = 'Garcia'


/*
SELECT TOP(1) People.LastName
	, People.FirstName
	, People.MiddleName
FROM Illnesses
JOIN People
ON Illnesses.DoctorID = People.PersonID
GROUP BY LastName
	, FirstName
	, MiddleName
	, DoctorID
ORDER BY COUNT(DISTINCT Illnesses.PatientID) DESC
*/

/*
SELECT TOP(1) Specialization.Name
FROM Illnesses
JOIN Doctors
ON Illnesses.DoctorID = Doctors.DoctorID
JOIN Specialization
ON Doctors.SpecializationID = Specialization.SpecializationID
GROUP BY Name
	, Doctors.SpecializationID
ORDER BY COUNT(Illnesses.IllnessID) DESC
*/

/*
SELECT People.LastName
	, People.FirstName
	, People.MiddleName
FROM Doctors
JOIN People
ON Doctors.DoctorID = People.PersonID
JOIN Specialization
ON Doctors.SpecializationID = Specialization.SpecializationID
WHERE Name = 'Therapist'
ORDER BY LastName
	, FirstName
	, MiddleName
*/
