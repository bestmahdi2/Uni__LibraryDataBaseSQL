--CREATE TABLES--
 
CREATE TABLE Library(
	Lib_id Int, 
	Name VarChar(256) Not Null,
	Address VarChar(512) Not Null,
	Telephone VarChar(512),
	Members Int,
	Primary key (Lib_id)
)

Create Table Section(
	Sec_id Int IDENTITY(1, 1),
	Lib_id Int, 
	Primary key (Lib_id, Sec_id),
	Foreign key (Lib_id) References Library(Lib_id)
	on delete cascade
	on update cascade
)

Create Table Literature_Sec(
	Lib_id Int,
	Sec_id Int,
	Poster VarBinary,
	Primary key (Lib_id, Sec_id),
	Foreign key (Lib_id, Sec_id) References Section(Lib_id, Sec_id)
	on delete cascade
	on update cascade
)

Create Table Art_Sec(
	Lib_id Int,
	Sec_id Int,
	Painting VarBinary,
	Primary key (Lib_id, Sec_id),
	Foreign key (Lib_id, Sec_id) References Section(Lib_id, Sec_id)
	on delete cascade
	on update cascade
)

Create Table Engineering_Sec(
	Lib_id Int,
	Sec_id Int,
	Eng_Head VarChar,
	Primary key (Lib_id, Sec_id),
	Foreign key (Lib_id, Sec_id) References Section(Lib_id, Sec_id)
	on delete cascade
	on update cascade
)

Create Table Medical_Sec(
	Lib_id Int,
	Sec_id Int,
	Med_Head VarChar,
	Primary key (Lib_id, Sec_id),
	Foreign key (Lib_id, Sec_id) References Section(Lib_id, Sec_id)
	on delete cascade
	on update cascade
)

Create Table Sport_Sec(
	Lib_id Int,
	Sec_id Int,
	Coach VarChar,
	Primary key (Lib_id, Sec_id),
	Foreign key (Lib_id, Sec_id) References Section(Lib_id, Sec_id)
	on delete cascade
	on update cascade
)
 
Create Table Book(
	Lib_id Int,
	Sec_id Int,
	Book_id Int,
	Name VarChar(256) Not Null,
	Publisher VarChar(256) Not Null, 
	Pub_Date Date,
	Primary key (Lib_id, Sec_id, Book_id),
	Foreign key (Lib_id, Sec_id) References Section(Lib_id, Sec_id)
	on delete cascade
	on update cascade,
)

Create Table Author(
	Aut_No Int IDENTITY(1, 1),
	Lib_id Int,
	Sec_id Int,
	Book_id Int,
	Name VarChar(256) Not Null,
	Family_Name VarChar(256) Not Null,
	Primary key (Lib_id, Sec_id, Book_id, Aut_No),
	Foreign key (Lib_id, Sec_id, Book_id) References Book(Lib_id, Sec_id, Book_id)
	on delete cascade
	on update cascade
)

Create Table Translator(
	Tra_No Int IDENTITY(1, 1),
	Lib_id Int,
	Sec_id Int,
	Book_id Int,
	Name VarChar(256) Not Null,
	Family_Name VarChar(256) Not Null,
	Primary key (Lib_id, Sec_id, Book_id, Tra_No),
	Foreign key (Lib_id, Sec_id, Book_id) References Book(Lib_id, Sec_id, Book_id)
	on delete cascade
	on update cascade
)

Create Table Manager(
	Lib_id Int,
	Sec_id Int,
	Per_id Int, 
	Name VarChar(256) Not Null,
	Family_Name VarChar(256) Not Null,
	Phone VarChar(256) Not Null,  
	Primary key (Lib_id, Sec_id, Per_id),
	Foreign key (Lib_id, Sec_id) References Section(Lib_id, Sec_id)
	on delete cascade
	on update cascade
)

Create Table Admin_(
	Admin_No Int,
	Lib_id Int,
	Sec_id Int,
	Per_id Int,
	Start_Date Date Not Null,
	Finish_Date Date Not Null,
	Unique (Start_Date, Finish_Date),
	Primary key (Lib_id, Sec_id, Per_id, Admin_No),
	Foreign key (Lib_id, Sec_id, Per_id) References Manager(Lib_id, Sec_id, Per_id)
	on delete cascade
	on update cascade
)
 
Create Table Member(
	Lib_id Int,
	Mem_id Int,
	Name VarChar(256) Not Null,
	Family_Name VarChar(256) Not Null,
	Phone VarChar(256) Not Null,
	Address VarChar(256),
	Join_Date Date Not Null,
	Image VarBinary,
	Total_Fine Int DEFAULT 0,
	Primary key (Lib_id, Mem_id),
	Foreign key (Lib_id) References Library(Lib_id)
	on delete cascade
	on update cascade
)

Create Table Lend(
	Lend_id Int,
	Lend_Date Date Not Null,
	Return_Date Date Not Null,
	Lib_id Int Not Null,
	Sec_id Int Not Null,
	Book_id Int Not Null, 
	Mem_id Int Not Null, 
	Primary key (Lend_id),
	Foreign key (Lib_id, Sec_id, Book_id) References Book(Lib_id, Sec_id, Book_id)
	on delete cascade
	on update cascade,
	Foreign key (Lib_id, Mem_id) References Member(Lib_id, Mem_id)
	on delete NO ACTION
	on update NO ACTION
)

Create Table Reserve(
	Res_id Int,
	Lib_id Int Not Null,
	Sec_id Int Not Null,
	Book_id Int Not Null,
	Mem_id Int Not Null,
	Unique (Book_id, Lib_id, Mem_id),
	Primary key (Res_id),
	Foreign key (Lib_id, Sec_id, Book_id) References Book(Lib_id, Sec_id, Book_id)
	on delete cascade
	on update cascade,
	Foreign key (Lib_id, Mem_id) References Member(Lib_id, Mem_id)
	on delete NO ACTION
	on update NO ACTION
)


-- INSERTS --
Insert Into Library Values(457855, 'NYC', '43th st. NYC, USA', '+1 555 785 8987', 300);

Insert Into Section Values(457855);
Insert Into Literature_Sec Values(457855, 1, NULL);
Insert Into Manager Values(457855, 1, 995022278, 'Maziar', 'Mirzaiee', '+1 654 875 7854');
  
Insert Into Section Values(457855);
Insert Into Art_Sec Values(457855, 2, NULL);
Insert Into Manager Values(457855, 2, 995022257, 'India', 'Indian', '+1 012 444 7548');

Insert Into Section Values(457855);
Insert Into Engineering_Sec Values(457855, 3, NULL);
Insert Into Manager Values(457855, 3, 995022288, 'Carma', 'Lavas', '+1 248 425 7452');

Insert Into Section Values(457855);
Insert Into Medical_Sec Values(457855, 4, NULL);
Insert Into Manager Values(457855, 4, 995022290, 'Shima', 'Insa', '+1 243 718 7452');

Insert Into Section Values(457855);
Insert Into Sport_Sec Values(457855, 5, NULL);
Insert Into Manager Values(457855, 5, 995022201, 'Rebeka', 'Quum', '+1 147 322 0123');
 
Insert Into Admin_ Values(1, 457855, 5, 995022201, '2023-04-19', '2024-04-19');

Insert Into Member Values(457855, 858875447, 'Zahra', 'Hossieni', '+1 741 447 7896', 'Manhatan NYC USA', GETDATE(), NULL, 0); 
Insert Into Member Values(457855, 454475572, 'Mahdi', 'Mahdavi', '+1 741 544 0110', 'Manhatan NYC USA', GETDATE(), NULL, 0);  
Insert Into Member Values(457855, 102424257, 'Ali', 'Yari', '+1 475 011 0110', 'Manhatan NYC USA', GETDATE(), NULL, 0); 
Insert Into Member Values(457855, 697454211, 'Mohammad', 'Ghadimi', '+1 012 777 0444', 'Manhatan NYC USA', GETDATE(), NULL, 0); 
Insert Into Member Values(457855, 124042757, 'Pouria', 'Vakili', '+1 000 963 0222', 'Manhatan NYC USA', GETDATE(), NULL, 0); 

Insert Into Book Values(457855, 1, 85969, 'French Poems', 'NYC Publisher', '2015-12-17');
Insert Into Book Values(457855, 2, 11245, 'American Art Book', 'NYC Publisher', '2017-11-23');
Insert Into Book Values(457855, 2, 85744, 'Famous Artists', 'NYC Publisher', '2010-12-18');
Insert Into Book Values(457855, 3, 35694, 'How To Fix You Phone', 'NYC Publisher', '2022-01-14');
Insert Into Book Values(457855, 3, 10220, 'Windows 10', 'NYC Publisher', '2020-05-05');
Insert Into Book Values(457855, 4, 78201, 'DR. OZ', 'NYC Publisher', '2016-07-07');
Insert Into Book Values(457855, 5, 75692, 'In Name Of Soccer', 'NYC Publisher', '2011-12-19');
Insert Into Book Values(457855, 5, 45723, 'A Quick Giude For Football', 'NYC Publisher', '2014-10-29');
     
Insert Into Author Values(457855, 1, 85969, 'Frank', 'Lasso');
Insert Into Author Values(457855, 1, 85969, 'Siria', 'Black');
Insert Into Author Values(457855, 2, 11245, 'Mike', 'Watt');
Insert Into Author Values(457855, 2, 85744, 'Luci', 'Feriera');
Insert Into Author Values(457855, 3, 35694, 'Fatma', 'Gol');
Insert Into Author Values(457855, 3, 10220, 'Jorge', 'Washengton');
Insert Into Author Values(457855, 4, 78201, 'Ashley', 'Halsey');
Insert Into Author Values(457855, 5, 75692, 'Selena', 'Gomesh');
Insert Into Author Values(457855, 5, 45723, 'Rose', 'Titan');


-- Procedure to lend a book --

GO
CREATE PROCEDURE LendBook @Lend_id Int, @Lib_id Int, @Sec_id Int, @Book_id Int, @Mem_id Int 
AS 
DECLARE @lend_count Int;
DECLARE @count Int;

DECLARE @date Date;
DECLARE @Rdate Date;

Set @date = GETDATE();
Set @Rdate = Getdate()+14;
Select @count = (Select Count(Lend.Lend_id) From Lend);
     
IF @count > 0
BEGIN
	Select @lend_count = (Select Count(Lend.Lend_id) From Lend Where Lend.Mem_id=@Mem_id AND Lend.Sec_id=@Sec_id);

	IF @lend_count < 5
	BEGIN
		Insert Into Lend Values(@Lend_id, @date, @Rdate, @Lib_id, @Sec_id, @Book_id, @Mem_id);
	END
END
;
GO

-- Procedure to reserve a book --

CREATE PROCEDURE ReserveBook @Res_id Int, @Lib_id Int, @Sec_id Int, @Book_id Int, @Mem_id Int 
AS 
DECLARE @lend_count Int;
DECLARE @count Int;

Select @count = (Select Count(Lend.Lend_id) From Lend);

IF @count > 0
BEGIN
	Select @lend_count = (Select Count(Mem_id) From Lend Where Lend.Mem_id=@Mem_id AND Lend.Book_id=@Book_id);
	  
	IF @lend_count < 1
	BEGIN
		Insert Into Reserve Values(@Res_id, @Lib_id , @Sec_id , @Book_id , @Mem_id);
	END
END
;
GO

-- Procedure to sign an admin from managers --

CREATE PROCEDURE AdminManager @Admin_No Int, @Lib_id Int, @Sec_id Int, @Per_id Int
AS 
DECLARE @date Date;
DECLARE @Fdate Date;
DECLARE @finish Date;

Set @date = GETDATE();
Set @Fdate = GETDATE()+365;
SELECT @finish = (SELECT TOP 1 Admin_.Finish_Date FROM Admin_ ORDER BY Admin_.Admin_No DESC)
    
IF @finish < @date
BEGIN
	Insert Into Admin_ Values(@Admin_No, @Lib_id, @Sec_id , @Per_id, @date, @Fdate);
END
;
GO
 
CREATE PROCEDURE ReturnBook @Lib_id Int, @Sec_id Int, @Book_id Int, @Mem_id Int 
AS  
DECLARE @date Date;
DECLARE @Rdate Date;
DECLARE @diff Int;

DECLARE @fine Int;
DECLARE @Tfine Int;
Set @date = GETDATE();

Select @Rdate = (Select Lend.Return_Date From Lend Where Lend.Mem_id=@Mem_id AND Lend.Book_id=@Book_id);
Select @fine = (Select Member.Total_Fine From Member Where Member.Mem_id=@Mem_id);
Set @diff = DATEDIFF(DAY, @date , @Rdate);

IF @diff > 14
BEGIN
	Set @Tfine =  @diff * 1000;
	Update Member SET Member.Total_Fine = @fine WHERE (Member.Mem_id = @Mem_id)
END
;

-- EXEC --

EXEC LendBook @Lend_id = 1, @Lib_id = 457855, @Sec_id = 1, @Book_id = 85969, @Mem_id = 858875447 
EXEC LendBook @Lend_id = 2, @Lib_id = 457855, @Sec_id = 2, @Book_id = 11245, @Mem_id = 454475572 
EXEC LendBook @Lend_id = 3, @Lib_id = 457855, @Sec_id = 2, @Book_id = 85744, @Mem_id = 102424257 
EXEC LendBook @Lend_id = 4, @Lib_id = 457855, @Sec_id = 3, @Book_id = 35694, @Mem_id = 697454211 
EXEC LendBook @Lend_id = 5, @Lib_id = 457855, @Sec_id = 3, @Book_id = 10220, @Mem_id = 697454211 
EXEC LendBook @Lend_id = 6, @Lib_id = 457855, @Sec_id = 4, @Book_id = 78201, @Mem_id = 697454211 
     
EXEC ReserveBook @Res_id = 1, @Lib_id = 457855, @Sec_id = 1, @Book_id = 85969, @Mem_id = 454475572 

EXEC ReturnBook @Lib_id = 457855, @Sec_id = 2, @Book_id = 11245, @Mem_id = 454475572 
EXEC ReturnBook @Lib_id = 457855, @Sec_id = 4, @Book_id = 78201, @Mem_id = 697454211