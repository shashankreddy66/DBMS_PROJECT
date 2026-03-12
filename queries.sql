INSERT INTO Students (Name, Email, Branch, CGPA, ResumeLink) VALUES
('Alice Smith', 'alice@example.com', 'Computer Science', 8.5, 'http://resume.com/alice'),
('Bob Johnson', 'bob@example.com', 'Electrical Engineering', 7.2, 'http://resume.com/bob'),
('Charlie Brown', 'charlie@example.com', 'Mechanical Engineering', 6.8, 'http://resume.com/charlie'),
('Diana Prince', 'diana@example.com', 'Computer Science', 9.1, 'http://resume.com/diana'),
('Eva Green', 'eva@example.com', 'Information Technology', 8.0, 'http://resume.com/eva');

INSERT INTO Companies (Name, Industry, ContactEmail) VALUES
('TechCorp', 'Software', 'hr@techcorp.com'),
('VoltEnergy', 'Energy', 'careers@voltenergy.com'),
('MechWorks', 'Manufacturing', 'jobs@mechworks.com'),
('DataSystems', 'IT Services', 'recruitment@datasys.com');

INSERT INTO Jobs (CompanyID, Role, Salary, MinCGPA, JobDescription) VALUES
(1, 'Software Engineer', 120000, 8.0, 'Develop and maintain software applications.'),
(1, 'Data Analyst', 90000, 7.5, 'Analyze large datasets to extract insights.'),
(2, 'Electrical Engineer', 85000, 7.0, 'Design and test electrical systems.'),
(3, 'Mechanical Engineer', 80000, 6.5, 'Design mechanical components.'),
(4, 'System Administrator', 75000, 7.0, 'Manage and monitor IT infrastructure.');

INSERT INTO Applications (StudentID, JobID, Status, ApplicationDate) VALUES
(1, 1, 'Applied', '2023-10-01'),
(1, 2, 'Shortlisted', '2023-10-02'),
(2, 3, 'Interviewing', '2023-10-03'),
(3, 4, 'Selected', '2023-10-04'),
(4, 1, 'Selected', '2023-10-05'),
(5, 5, 'Applied', '2023-10-06');

SELECT '--- Eligible Students for Job 1 ---' AS QueryName;
SELECT S.Name, S.Branch, S.CGPA 
FROM Students S 
JOIN Jobs J ON J.JobID = 1 
WHERE S.CGPA >= J.MinCGPA;

SELECT '--- Application Statuses for Alice Smith ---' AS QueryName;
SELECT A.ApplicationID, C.Name AS CompanyName, J.Role AS JobRole, A.Status, A.ApplicationDate 
FROM Applications A 
JOIN Jobs J ON A.JobID = J.JobID 
JOIN Companies C ON J.CompanyID = C.CompanyID 
WHERE A.StudentID = 1;

SELECT '--- Applications for Software Engineer (JobID = 1) ---' AS QueryName;
SELECT S.Name AS StudentName, S.Branch, S.CGPA, A.Status, A.ApplicationDate 
FROM Applications A 
JOIN Students S ON A.StudentID = S.StudentID 
WHERE A.JobID = 1;

SELECT '--- Total Placements (Selected) by Company ---' AS QueryName;
SELECT C.Name AS CompanyName, COUNT(A.ApplicationID) AS TotalHired 
FROM Companies C 
JOIN Jobs J ON C.CompanyID = J.CompanyID 
JOIN Applications A ON J.JobID = A.JobID 
WHERE A.Status = 'Selected' 
GROUP BY C.CompanyID, C.Name 
ORDER BY TotalHired DESC;

SELECT '--- All Available Jobs ---' AS QueryName;
SELECT J.JobID, C.Name AS CompanyName, J.Role, J.Salary, J.MinCGPA 
FROM Jobs J 
JOIN Companies C ON J.CompanyID = C.CompanyID;
