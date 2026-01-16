DROP DATABASE IF EXISTS StudentManagement;
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- Table: Students
CREATE TABLE Students (
    StudentID CHAR(5) PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    TotalDebt DECIMAL(10,2) DEFAULT 0
);

-- Table: Subjects
CREATE TABLE Subjects (
    SubjectID CHAR(5) PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL,
    Credits INT CHECK (Credits > 0)
);

-- Table: Grades
CREATE TABLE Grades (
    StudentID CHAR(5),
    SubjectID CHAR(5),
    Score DECIMAL(4,2) CHECK (Score BETWEEN 0 AND 10),
    PRIMARY KEY (StudentID, SubjectID),
    CONSTRAINT FK_Grades_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Grades_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- Table: GradeLog
CREATE TABLE GradeLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID CHAR(5),
    OldScore DECIMAL(4,2),
    NewScore DECIMAL(4,2),
    ChangeDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert Students
INSERT INTO Students (StudentID, FullName, TotalDebt) VALUES 
('SV01', 'Ho Khanh Linh', 5000000),
('SV03', 'Tran Thi Khanh Huyen', 0);

-- Insert Subjects
INSERT INTO Subjects (SubjectID, SubjectName, Credits) VALUES 
('SB01', 'Co so du lieu', 3),
('SB02', 'Lap trinh Java', 4),
('SB03', 'Lap trinh C', 3);

-- Insert Grades
INSERT INTO Grades (StudentID, SubjectID, Score) VALUES 
('SV01', 'SB01', 8.5), -- Passed
('SV03', 'SB02', 3.0); -- Failed

-- cau 1
DELIMITER //
CREATE TRIGGER tg_CheckScore 
BEFORE INSERT ON Grades FOR EACH ROW
BEGIN
	IF(new.Score < 0 ) THEN
		SET new.Score = 0;
	END IF;
    IF(new.Score > 10 ) THEN
		SET new.Score = 10;
	END IF;
END //

INSERT INTO Grades (StudentID, SubjectID, Score) VALUE ();

-- cau2 
START TRANSACTION ;
INSERT INTO Students (StudentID, FullName) VALUE ('SV02','Ha Bich Ngoc');
UPDATE Students SET TotalDebt = 5000000 WHERE StudentID = 'SV02';
COMMIT;

-- cau 3
DELIMITER //

CREATE TRIGGER tg_LogGradeUpdate
AFTER UPDATE ON Grades
FOR EACH ROW
BEGIN
    IF OLD.Score <> NEW.Score THEN
        INSERT INTO GradeLog (StudentID, OldScore, NewScore, ChangeDate)
        VALUES (OLD.StudentID, OLD.Score, NEW.Score, NOW());
    END IF;
END //

UPDATE Grades SET Score = 9.5 WHERE StudentID = 'SV01' AND SubjectID = 'SB01';

-- cau 4
DELIMITER //

CREATE PROCEDURE sp_PayTuition()
BEGIN
    DECLARE current_debt DECIMAL(10,2);

    START TRANSACTION;

    UPDATE Students 
    SET TotalDebt = TotalDebt - 2000000 
    WHERE StudentID = 'SV01';

    SELECT TotalDebt INTO current_debt 
    FROM Students 
    WHERE StudentID = 'SV01';

    IF current_debt < 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Loi: So tien dong vuot qua so no hien tai!';
    ELSE
        COMMIT;
        SELECT 'Thanh toan thanh cong!' AS Message;
    END IF;
END //

DELIMITER ;

CALL sp_PayTuition();

