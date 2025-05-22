CREATE DATABASE Tech_School;
USE Tech_School;
CREATE TABLE Programs (
Program_id INT,
Course_name CHAR (90),
Duration_months INT,
About CHAR (250),
PRIMARY KEY(program_id)
);
USE Tech_School;
CREATE TABLE Students (
Student_id INT,
First_name CHAR (90),
Last_name CHAR (90),
Email VARCHAR (90),
Phone VARCHAR (50),
Date_of_birth DATE,
Gender CHAR (90),
Enrollment_date DATE,
Program_id INT,
PRIMARY KEY (Student_id),
FOREIGN KEY(program_id) REFERENCES Programs (program_id) ON DELETE CASCADE
);
USE Tech_School;
CREATE TABLE Instructors (
Instructor_id INT,
First_name CHAR (90),
Last_name CHAR (90),
Email VARCHAR (90),
Phone VARCHAR (15),
Specialization CHAR (90),
PRIMARY KEY (Instructor_id)
);
USE Tech_School;
CREATE TABLE Courses (
Course_id VARCHAR (90),
Instructor_id INT,
Credit_hours DATETIME,
Course_description CHAR (200),
PRIMARY KEY(Course_id),
FOREIGN KEY(Instructor_id) REFERENCES Instructors (Instructor_id) ON DELETE CASCADE
);
USE Tech_School;
CREATE TABLE Classes (
Class_id INT,
Course_id VARCHAR (90),
Instructor_id INT,
Start_date DATE,
End_date DATE,
CLassroom CHAR (90),
PRIMARY KEY(Class_id),
FOREIGN KEY (Instructor_id) REFERENCES Instructors (Instructor_id) ON DELETE CASCADE,
FOREIGN KEY (Course_id) REFERENCES Courses (Course_id) ON DELETE CASCADE 
);
USE Tech_school;
CREATE TABLE enrollments(
enrollment_id INT,
student_id INT,
class_id INT,
enrollment_date DATE,
grade VARCHAR(12) NOT NULL,
PRIMARY KEY (enrollment_id),
FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
FOREIGN KEY (class_id) REFERENCES Classes(class_id) ON DELETE CASCADE
);

USE Tech_School;
CREATE TABLE Assessments (
Assessment_id INT,
Class_id INT,
Assessment_type VARCHAR (90),
Test_Date DATE,
Total_marks INT,
PRIMARY KEY (Assessment_id),
FOREIGN KEY (Class_id) REFERENCES Classes(Class_id) ON DELETE CASCADE
);

USE Tech_School;
CREATE TABLE Assessment_Results (
Result_id INT,
Assessment_id INT,
Student_id INT,
Score INT,
PRIMARY KEY (Result_id),
FOREIGN KEY (Assessment_id) REFERENCES Assessments(Assessment_id) ON DELETE CASCADE,
FOREIGN KEY (student_id) REFERENCES Students(Student_id) ON DELETE CASCADE
);
ALTER TABLE Students
ADD UNIQUE KEY(Email);
ALTER TABLE Students
ADD UNIQUE KEY(phone);
ALTER TABLE Instructors
ADD UNIQUE KEy (Email);
ALTER TABLE Instructors
ADD UNIQUE KEy (phone);
