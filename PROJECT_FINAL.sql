--1.Create a database NIKHIL ANALYTICS

create database NIKHIL_ANALYTICS

--2.Create STUDENT_INFO table with following columns

Create Table STUDENT_INFO
(YEAR varchar(4) not null check(len(Year)=4), SEQUENCENO int IDENTITY(1,1),
STUDENT_ID AS ('STD_' + YEAR + '_' + RIGHT('00' + CONVERT(varchar(2),SEQUENCENO), 2)) PERSISTED Primary Key,
NAME varchar(20) Not Null,
ADDRESS varchar(90) Not Null,
PHONE_NO varchar(10) Not Null check(len(PHONE_NO)=10 and PHONE_NO LIKE '%[0-9]%'),
EMAIL_ID varchar(30) Not Null check(EMAIL_ID like '%@%'),
QUALIFICATION1 varchar(50),
QUALIFICATION2 varchar(50),
EXPERIENCE float,
COMPANY_NAME varchar(50),
COURSE_OPTED1 varchar(50) Not Null check(COURSE_OPTED1 IN ('REPORTING ANALYSIS POWER PACK',
'BUSINESS ANALYTICS POWER PACK',
'DATA ANALYTICS POWER PACK',
'DATA SCIENCE MODELLING & MACHINE LEARNING')),
COURSE_OPTED2 varchar(50) Not Null check(COURSE_OPTED1 IN ('REPORTING ANALYSIS POWER PACK',
'BUSINESS ANALYTICS POWER PACK',
'DATA ANALYTICS POWER PACK',
'DATA SCIENCE MODELLING & MACHINE LEARNING')),
COURSE_OPTED3 varchar(50) Not Null check(COURSE_OPTED1 IN ('REPORTING ANALYSIS POWER PACK',
'BUSINESS ANALYTICS POWER PACK',
'DATA ANALYTICS POWER PACK',
'DATA SCIENCE MODELLING & MACHINE LEARNING')),
ADMISSION_DATE date Not Null)
--EXPECTED_END date check(Case
--When COURSE_OPTED1='REPORTING ANALYSIS POWER PACK' then dateadd(Month,3,ADMISSION_DATE) as EXPECTED_END
--else COURSE_OPTED1='BUSINESS ANALYTICS POWER PACK' then dateadd(Month,3,ADMISSION_DATE) as EXPECTED_END
--else COURSE_OPTED1='DATA ANALYTICS POWER PACK' then dateadd(Month,3,ADMISSION_DATE) as EXPECTED_END
--else COURSE_OPTED1='DATA SCIENCE MODELLING & MACHINE LEARNING' then dateadd(Month,3,ADMISSION_DATE) as EXPECTED_END
--)

--2.Create R_marks_info table with following columns

Create Table R_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
Test_1 float,
Test_2 float,
Test_3 float,
Retest1 float,
Retest2 float,
Retest3 float)

--3.Create SAS_marks_info table with following columns

Create Table SAS_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
MT_1 float,
MT_2 float,
Data_step_test float,
MT_3 float,
Proc_Test float,
Base_SAS_Test float,
Retest1 float,
Retest2 float,
Retest3 float)

--4. Create SQL_marks_info table with following columns
Create Table SQL_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
SQL_test1 float,
SQL_test2 float,
Retest1 float,
Retest2 float)

--5. Create EXCEL_marks_info table with following columns

Create Table EXCEL_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
Basic_excel_test float,
MT1 float,
Excel_test1 float,
Retest float)

--6. Create VBA_marks_info table with following columns
Create Table VBA_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
Function_excel_Test float,
Function_vba_test float,
Final_test float,
Retest1 float)

--7. Create TABLEAU_marks_info table with following columns

Create Table TABLEAU_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
MT1 float,
Test1 float,
Retest1 float)

--8. Create PYTHON_marks_info table with following columns

Create Table PYTHON_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
Test1 float,
Test2 float,
Retest1 float,
Retest2 float)

--8. Create ML_marks_info table with following columns

Create Table ML_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
Test1 float,
Test2 float,
Retest float)

--9. Create ASAS_marks_info table with following columns

Create Table ASAS_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
MT1 float,
MT2 float,
Final_test float,
Retest float)

--10.Create FULL_LENGTH_marks_info table with following columns

Create Table FULL_LENGTH_marks_info
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Class_start_Date date,
Class_end_Date date,
Faculty varchar(50) Not Null,
R_test float,
SAS_test float,
SQL_test float,
Excel_test float,
VBA_test float,
Python_test float,
Tableau_test float)

--11.Create Placement_Activity table with following columns

Create Table Placement_Activity
(Student_ID varchar(11) Foreign Key References STUDENT_INFO(STUDENT_ID),
Mock_interview1 varchar(50),
Mock_interview2 varchar(50),
Mock_interview3 varchar(50),
Resume_Finalised varchar(50),
Profile_Building varchar(50),
Certificate_Issued varchar(10) Not Null check(Certificate_Issued IN ('YES','NO')),
Actual_course_enddate date)























