USE Polyclinic
GO

INSERT People (
		PersonID
		, FirstName
		, MiddleName
		, LastName
		, Number
		, Address
	)
VALUES (
		1
		, 'Aaron'
		, NULL
		, 'Shan'
		, '9145611359'
		, '934 Ocean Lane Westerville, OH 43081'
	), (
		2
		, 'Abby'
		, 'May'
		, 'Patel'
		, '7101564411'
		, '111 Cherry Drive Herndon, VA 20170'
	), (
		3
		, 'Cindy'
		, NULL
		, 'Stewart'
		, '8129950664'
		, '93 Pennsylvania St. Grovetown, GA 30813'
	), (
		4
		, 'Clarence'
		, NULL
		, 'Rogers'
		, '7883436344'
		, '9244 Vernon Avenue Merrimack, NH 03054'
	), (
		5
		, 'Zoe'
		, 'Ann'
		, 'Ramirez'
		, '9456433330'
		, '37 Brandywine St. Glen Cove, NY 11542'
	), (
		6
		, 'Xavier'
		, NULL
		, 'Diaz'
		, '9741000011'
		, '155 Schoolhouse Ave. Bemidji, MN 56601'
	), (
		7
		, 'Wyatt'
		, NULL
		, 'Powell'
		, '8129985664'
		, NULL
	), (
		8
		, 'Willie'
		, NULL
		, 'Thomas'
		, '8127436344'
		, '4 Thorne St. Dorchester Center, MA 02124'
	), (
		9
		, 'Spencer'
		, NULL
		, 'Edwards'
		, '7106466660'
		, NULL
	), (
		10
		, 'Shawn'
		, NULL
		, 'Jai'
		, '9345345330'
		, '1 Elm Rd. Glendale Heights, IL 60139'
	), (
		11
		, 'Rachel'
		, 'Mary'
		, 'Cox'
		, '4565646601'
		, '8207 State Dr. Brooklyn, NY 11201'
	), (
		12
		, 'Priscilla'
		, NULL
		, 'Garcia'
		, '7109466777'
		, '753 Golden Star St. Pawtucket, RI 02860'
	), (
		13
		, 'Petr'
		, NULL
		, 'Krebs'
		, '4015615688'
		, '728 Marsh Lane Apopka, FL 32703'
	), (
		14
		, 'Pedro'
		, NULL
		, 'Moreno'
		, '8776743334'
		, NULL
	), (
		15
		, 'Nathaniel'
		, 'Edward'
		, 'Ramirez'
		, '9312244455'
		, '1 Third St. Prattville, AL 36067'
	), (
		16
		, 'Natasha'
		, NULL
		, 'Rubio'
		, '7105555008'
		, '7615 Pulaski St. Taylors, SC 29687'
	), (
		17
		, 'Max'
		, NULL
		, 'Moreno'
		, '9006465675'
		, '8905 W. Beechwood Road Freeport, NY 11520'
	), (
		18
		, 'Lucas'
		, 'Henry'
		, 'Howard'
		, '8126567650'
		, '8081 Queen Street Prior Lake, MN 55372'
	), (
		19
		, 'Lorraine'
		, NULL
		, 'Nay'
		, '9114897778'
		, '9527 Richardson Dr. Neptune, NJ 07753'
	), (
		20
		, 'Lisa'
		, NULL
		, 'Zhu'
		, '8124544544'
		, '359 Vine Lane Vicksburg, MS 39180'
	), (
		21
		, 'Jorge'
		, 'Francis'
		, 'Lin'
		, '4346463421'
		, '7615 Pulaski St. Taylors, SC 29687'
	)
GO


INSERT Patients (
		PatientID
		, Passport
		, EMail
	)
VALUES (
		1
		, '7845360351'
		, 'sdfvf@mail.com'
	), (
		2
		, '7836220351'
		, 'g54G_g5g@gmail.com'
	), (
		4
		, '2306482520'
		, 'g34t34@mail.com'
	), (
		5
		, '8970668095'
		, 'yyyyyy____yyyyy@gmail.com'
	), (
		7
		, '4084965044'
		, NULL
	), (
		8
		, '7946162503'
		, NULL
	), (
		9
		, '7807057555'
		, NULL
	), (
		11
		, '3401878665'
		, NULL
	), (
		13
		, '4008702730'
		, 's34354353@post.post'
	), (
		14
		, '6010787980'
		, NULL
	), (
		16
		, '3728556313'
		, NULL
	), (
		17
		, '3572345019'
		, 'ytjjtyj@gmail.ua'
	), (
		18
		, '7043003083'
		, 'qwerty@qer.ty'
	), (
		19
		, '5905083267'
		, NULL
	), (
		20
		, '9810712936'
		, 'gggggg___4@gmail.com'
	)
GO


INSERT Doctors (
		DoctorID
		, SpecializationID
		, Position
		, EmploymentDate
		, DismissalDate
	)
VALUES (
		6
		, 9
		, 'Doctor'
		, CONVERT(DATE, '1999-01-30')
		, NULL
	), (
		12
		, 6
		, 'Nurse'
		, CONVERT(DATE, '2001-09-01')
		, NULL
	), (
		10
		, 6
		, 'Doctor'
		, CONVERT(DATE, '2008-04-05')
		, NULL
	), (
		15
		, 8
		, 'Doctor'
		, CONVERT(DATE, '2000-05-24')
		, NULL
	), (
		18
		, 3
		, 'Doctor'
		, CONVERT(DATE, '1999-02-21')
		, CONVERT(DATE, '2004-05-07')
	), (
		21
		, 7
		, 'Head physician'
		, CONVERT(DATE, '1997-03-01')
		, NULL
	), (
		3
		, 5
		, 'Doctor'
		, CONVERT(DATE, '2007-10-17')
		, NULL
	)
GO


INSERT Specialization (
		SpecializationID
		, Name
	)
VALUES (
		1
		, 'Cardiology'
	), (
		2
		, 'Ophthalmology'
	), (
		3
		, 'Anesthesiology'
	), (
		4
		, 'Dermatology'
	), (
		5
		, 'Psychiatry'
	), (
		6
		, 'Therapist'
	), (
		7
		, 'Surgeon'
	), (
		8
		, 'Traumatologist'
	), (
		9
		, 'Neurology'
		)
GO


INSERT Diseases (
		DiseaseID
		, Name
		, Symptoms
		, Prevention
		, Therapy
	)
VALUES (
		1
		, 'Migraine'
		, 'Strong headace with loose of vision'
		, '3mg magnium D3 two times a day'
		, 'Skull trephination'
	), (
		2
		, 'Flu'
		, 'Throatace, cauhging with blood'
		, 'Do not keep feet in cold'
		, 'Codeine syroup'
	), (
		3
		, 'Tuberculosis'
		, 'Cauhing with blood, high temperature'
		, 'Living separately of infected people'
		, 'Lung removal'
	), (
		4
		, 'Bone fracture'
		, 'The bone may be seen sticking out of skin'
		, NULL
		, 'Bone substitution'
	), (
		5
		, 'Drugs overdoze'
		, 'High temperature, mystery eyes, frequent pulse'
		, 'Do not use drugs'
		, 'NaCL injection'
	), (
		6
		, 'Cancrum oris'
		, 'Absence of jaw'
		, NULL
		, 'Surgery only'
	), (
		 7
		 , 'Schizophrenia'
		 , 'Inadequate behavior, suicidal thoughts'
		 , NULL
		 , 'Forced therapy using slipper (advanced method)'
	)
GO


INSERT Illnesses (
		IllnessID
		, PatientID
		, DiseaseID
		, DoctorID
		, FirstDate
		, RecoveryDate
	)
VALUES (
		1
		, 18
		, 5
		, 10
		, CONVERT(DATE, '2005-01-03')
		, NULL
	), (
		2
		, 14
		, 7
		, 3
		, CONVERT(DATE, '2008-01-03')
		, CONVERT(DATE, '2008-03-03')
	), (
		3
		, 14
		, 7
		, 3
		, CONVERT(DATE, '2008-12-31')
		, CONVERT(DATE, '2009-10-18')
	), (
		4
		, 14
		, 7
		, 3
		, CONVERT(DATE, '2012-01-01')
		, NULL
	), (
		5
		, 1
		, 3
		, 12
		, CONVERT(DATE, '2010-04-11')
		, CONVERT(DATE, '2010-04-21')
	), (
		6
		, 2
		, 2
		, 12
		, CONVERT(DATE, '2013-02-27')
		, CONVERT(DATE, '2013-03-20')
	), (
		7
		, 4
		, 2
		, 12
		, CONVERT(DATE, '2013-03-24')
		, CONVERT(DATE, '2013-04-05')
	), (
		8
		, 5
		, 2
		, 12
		, CONVERT(DATE, '2013-03-31')
		, CONVERT(DATE, '2013-04-10')
	), (
		9
		, 7
		, 3
		, 10
		, CONVERT(DATE, '2010-08-06')
		, CONVERT(DATE, '2010-08-08')
	), (
		10
		, 8
		, 2
		, 12
		, CONVERT(DATE, '2013-02-11')
		, CONVERT(DATE, '2013-03-30')
	), (
		11
		, 9
		, 5
		, 3
		, CONVERT(DATE, '2000-07-11')
		, CONVERT(DATE, '2001-04-13')
	), (
		12
		, 11
		, 4
		, 8
		, CONVERT(DATE, '2010-06-20')
		, CONVERT(DATE, '2010-08-09')
	), (
		13
		, 13
		, 4
		, 8
		, CONVERT(DATE, '2016-02-15')
		, NULL
	), (
		14
		, 16
		, 1
		, 6
		, CONVERT(DATE, '2009-11-29')
		, CONVERT(DATE, '2009-11-30')
	), (
		15
		, 17
		, 6
		, 21
		, CONVERT(DATE, '2017-11-08')
		, NULL
	), (
		16
		, 19
		, 7
		, 3
		, CONVERT(DATE, '2012-01-01')
		, NULL
	), (
		17
		, 20
		, 7
		, 3
		, CONVERT(DATE, '2017-12-17')
		, NULL
	)
GO
