USE Academy;

INSERT INTO Curators (Name, Surname) VALUES ('John', 'Doe');
INSERT INTO Curators (Name, Surname) VALUES ('Jane', 'Smith');

INSERT INTO Departments (Building, Financing, Name, FacultyId) VALUES (1, 150000, 'Department of Computer Science', 1);
INSERT INTO Departments (Building, Financing, Name, FacultyId) VALUES (2, 120000, 'Department of Software Engineering', 1);
INSERT INTO Departments (Building, Financing, Name, FacultyId) VALUES (3, 100000, 'Department of Information Technology', 1);

INSERT INTO Faculties (Name) VALUES ('Engineering');

INSERT INTO Groups (Name, Year, DepartmentId) VALUES ('A101', 1, 1);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES ('B201', 2, 2);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES ('C301', 3, 3);

INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (1, 1);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (2, 2);

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (1, 1);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (2, 2);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (3, 3);

INSERT INTO Lectures (Date, SubjectId, TeacherId) VALUES ('2024-04-20', 1, 1);
INSERT INTO Lectures (Date, SubjectId, TeacherId) VALUES ('2024-04-21', 2, 2);
INSERT INTO Lectures (Date, SubjectId, TeacherId) VALUES ('2024-04-22', 3, 3);

INSERT INTO GroupsStudents (GroupId, StudentId) VALUES (1, 1);
INSERT INTO GroupsStudents (GroupId, StudentId) VALUES (2, 2);
INSERT INTO GroupsStudents (GroupId, StudentId) VALUES (3, 3);

INSERT INTO Students (Name, Surname, Rating) VALUES ('Alice', 'Johnson', 4);
INSERT INTO Students (Name, Surname, Rating) VALUES ('Bob', 'Smith', 3);
INSERT INTO Students (Name, Surname, Rating) VALUES ('Charlie', 'Brown', 5);

INSERT INTO Subjects (Name) VALUES ('Mathematics');
INSERT INTO Subjects (Name) VALUES ('Physics');
INSERT INTO Subjects (Name) VALUES ('Chemistry');

INSERT INTO Teachers (IsProfessor, Name, Salary, Surname) VALUES (1, 'Professor', 5000, 'Smith');
INSERT INTO Teachers (IsProfessor, Name, Salary, Surname) VALUES (0, 'John', 3000, 'Doe');
INSERT INTO Teachers (IsProfessor, Name, Salary, Surname) VALUES (0, 'Jane', 3000, 'Doe');

GO

DELETE FROM Students WHERE Name = 'Charlie';

GO
