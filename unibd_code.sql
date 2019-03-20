-- ---------------------- --
-- Getting all Depertment --
-- ---------------------- --
DELIMITER //
CREATE PROCEDURE getAllDept()
BEGIN
SELECT * FROM department;
END //
DELIMITER ;

CALL getAllDept ;

-- ------------------------------------ --
--  Getting Depertment by building name --
-- ------------------------------------ --
DELIMITER //
CREATE PROCEDURE GetDeptByBuilding(IN buildingName varchar(15))
BEGIN
SELECT * FROM department WHERE building=buildingName;
END //
DELIMITER ;

CALL GetDeptByBuilding('Watson');

-- ----------------------- --
-- Getting Instructor Name --
-- ----------------------- --
DELIMITER //
CREATE PROCEDURE getInstructorName (IN DeptName VARCHAR(15))
BEGIN
SELECT * FROM instructor WHERE dept_name = DeptName;
END //
DELIMITER ;

CALL getInstructorName('Comp. Science')

-- ---------------------------- --
-- Getting only instructor name --
-- ---------------------------- --
DELIMITER //
CREATE PROCEDURE getInstructorOnlyName (IN DeptName VARCHAR(15))
BEGIN
SELECT name FROM instructor WHERE dept_name = DeptName;
END //
DELIMITER ;

CALL getInstructorOnlyName('Comp. Science')

-- ----------------- --
-- Insert Department --
-- ----------------- --
DELIMITER //
CREATE PROCEDURE insertDept(IN DeptName VARCHAR(20), buildingName VARCHAR(20), budgetAmount DECIMAL(12,2))
BEGIN
INSERT INTO department VALUES (DeptName, buildingName, budgetAmount);
END //
DELIMITER ;

CALL insertDept('Math.','IICT','8600.00')

-- ------------------------ --
-- Update Instructor Salary --
-- ------------------------ --
DELIMITER //
CREATE PROCEDURE updateInstructorSalary(IN Name VARCHAR(20), IN amount DECIMAL(12,2))
BEGIN
UPDATE instructor SET salary = (salary + (salary*5)/100) WHERE salary > amount ;
END //
DELIMITER ;

CALL updateInstructorSalary('Wu', 80000)