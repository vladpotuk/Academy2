SELECT Building
FROM Departments
GROUP BY Building
HAVING SUM(Financing) > 100000;

GO

SELECT Groups.Name
FROM Groups
JOIN Departments ON Groups.DepartmentId = Departments.Id
WHERE Groups.Year = 5
    Departments.Name = 'Software Development'
    (
        SELECT COUNT(*)
        FROM Lectures
        JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
        WHERE GroupsLectures.GroupId = Groups.Id
            DATEPART(WEEKDAY, Lectures.Date) = 1
    ) > 10;

GO

SELECT Name
FROM Groups
WHERE (
    SELECT AVG(Rating)
    FROM Students
    JOIN GroupsStudents ON Students.Id = GroupsStudents.StudentId
    WHERE GroupsStudents.GroupId = (SELECT Id FROM Groups WHERE Name = 'D221')
) < ANY (
    SELECT AVG(Rating)
    FROM Students
    JOIN GroupsStudents ON Students.Id = GroupsStudents.StudentId
    WHERE GroupsStudents.GroupId = Groups.Id
);

GO

SELECT Name, Surname
FROM Teachers
WHERE Salary > ALL (
    SELECT AVG(Salary)
    FROM Teachers
    WHERE IsProfessor = 1
);

GO

SELECT G.Name
FROM Groups G
WHERE (
    SELECT COUNT(*)
    FROM GroupsCurators GC
    WHERE GC.GroupId = G.Id
) > 1;

GO

SELECT G.Name
FROM Groups G
WHERE AVG(Rating) < ALL (
    SELECT AVG(Rating)
    FROM Groups
    JOIN GroupsStudents ON Groups.Id = GroupsStudents.GroupId
    JOIN Students ON GroupsStudents.StudentId = Students.Id
    WHERE Groups.Year = 5
    GROUP BY Groups.Id
);

GO

SELECT F.Name
FROM Faculties F
WHERE (
    SELECT SUM(D.Financing)
    FROM Departments D
    WHERE D.FacultyId = F.Id
) > ANY (
    SELECT SUM(D.Financing)
    FROM Departments D
    WHERE D.FacultyId = (
        SELECT Id
        FROM Faculties
        WHERE Name = 'Computer Science'
    )
);

GO

SELECT S.Name AS SubjectName, T.Name + ' ' + T.Surname AS TeacherName
FROM Lectures L
JOIN Subjects S ON L.SubjectId = S.Id
JOIN Teachers T ON L.TeacherId = T.Id
GROUP BY S.Id, S.Name, T.Id, T.Name, T.Surname
HAVING COUNT(*) = ALL (
    SELECT MAX(LectureCount)
    FROM (
        SELECT COUNT(*) AS LectureCount
        FROM Lectures
        WHERE SubjectId = L.SubjectId
        GROUP BY TeacherId
    ) AS LectureCounts
);

GO

SELECT TOP 1 S.Name AS SubjectName
FROM Lectures L
JOIN Subjects S ON L.SubjectId = S.Id
GROUP BY S.Id, S.Name
ORDER BY COUNT(*) ASC;

GO

SELECT COUNT(DISTINCT GS.StudentId) AS StudentCount, COUNT(DISTINCT L.SubjectId) AS SubjectCount
FROM Groups G
JOIN Departments D ON G.DepartmentId = D.Id
JOIN GroupsStudents GS ON G.Id = GS.GroupId
JOIN Lectures L ON G.Id = L.Id
WHERE D.Name = 'Software Development';

GO
