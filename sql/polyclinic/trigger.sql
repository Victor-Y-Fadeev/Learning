CREATE TRIGGER RemoveSpecialization
ON Specialization
INSTEAD OF DELETE AS
BEGIN
	DECLARE @SpecializationID INT
	SELECT @SpecializationID =  deleted.SpecializationID FROM deleted
	
	IF (SELECT COUNT(*)
			FROM Doctors
			WHERE SpecializationID = @SpecializationID
		) = 0
		DELETE FROM Specialization
		WHERE SpecializationID = @SpecializationID
	ELSE
		PRINT 'It is the necessary specialization!'
END
