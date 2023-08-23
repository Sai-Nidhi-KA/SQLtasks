--task 2
create database registration;
use registration;

create table Registration_form
(
user_id  INT identity(1,1),
firstname varchar(60),
lastname  varchar(60),
dateofbirth datetime,
gender    varchar(50),
PhoneNo   varchar(50),
Email     varchar(50),
Address   varchar(60),
State     varchar(30),
city      varchar(40),
Username  varchar(40),
password  varchar(50),
cpassword varchar(50),
);

insert into Registration_form(firstname,lastname,dateofbirth,gender,PhoneNo,Email,Address,State,city,Username,password,cpassword) values (
     'Alice', 'Smith', '1990-05-15', 'Female', '1234567890',
    'alice@example.com', '123 Main St', 'New York', 'New York', 'alice123',
    'hashedpassword', 'hashedcpassword');

insert into Registration_form(firstname,lastname,dateofbirth,gender,PhoneNo,Email,Address,State,city,Username,password,cpassword) values (
     'Ammu', 'Thankam', '2000-05-15', 'Female', '12347964890',
    'ammu@example.com', '345 Main St', 'Kerala', 'Changanacherry', 'ammu123',
    'ammupassword', 'ammupassword');

	insert into Registration_form(firstname,lastname,dateofbirth,gender,PhoneNo,Email,Address,State,city,Username,password,cpassword) values (
     'Peter', 'Joseph', '1987-05-17', 'Male', '198024964890',
    'peter@example.com', '678 Main St', 'Tamil Nadu', 'Chennai', 'peter123',
    'peterpassword', 'peterpassword');

	insert into Registration_form(firstname,lastname,dateofbirth,gender,PhoneNo,Email,Address,State,city,Username,password,cpassword) values (
    'Nirmal', 'Raj', '1995-11-21', 'male', '9876543213',
    'nirmal@example.com', '678 Main St', 'Kerala', 'Parumala', 'Nirmal234',
    'nirmalpassword', 'nirmalpassword');

	insert into Registration_form(firstname,lastname,dateofbirth,gender,PhoneNo,Email,Address,State,city,Username,password,cpassword) values (
     'Nirmala', 'S', '1999-11-29', 'Transgender', '980983213',
    'nirmala@example.com', '907 Main St', 'madhya pradesh', 'mumbai', 'Nirmala234',
    'nirmalapassword', 'nirmalapassword');

	

	--updates
	update Registration_form
	set State='Maharastra'
	where user_id=5;

	--select
	select * from Registration_form;

	--delete
	DELETE FROM Registration_form WHERE user_id = 1;
	drop table Registration_form;

	--Task 7
	-- To implement a CRUD operations with different stored procedure method for your given project.

	
	--Create operation
	CREATE PROCEDURE InsertRegistration(
    @firstname VARCHAR(60),
    @lastname VARCHAR(60),
    @dateofbirth DATETIME,
    @gender VARCHAR(50),
    @PhoneNo VARCHAR(50),
    @Email VARCHAR(50),
    @Address VARCHAR(60),
    @State VARCHAR(30),
    @city VARCHAR(40),
    @Username VARCHAR(40),
    @password VARCHAR(50),
    @cpassword VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Registration_form (
        firstname, lastname, dateofbirth, gender, PhoneNo, Email,
        Address, State, city, Username, password, cpassword
    )
    VALUES (
        @firstname, @lastname, @dateofbirth, @gender, @PhoneNo, @Email,
        @Address, @State, @city, @Username, @password, @cpassword
    );
END;

EXEC InsertRegistration
    @firstname = 'Nirmal',
    @lastname = 'Raj',
    @dateofbirth = '1995-11-21',
    @gender = 'male',
    @PhoneNo = '9876543213',
    @Email = 'nirmal@example.com',
    @Address = '678 Main St',
    @State = 'Kerala',
    @city = 'Parumala',
    @Username = 'nirmalpassword',
    @password = 'nirmalpassword',
    @cpassword = 'hashedpassword1';

--Read Operation
CREATE PROCEDURE GetRegistrationByID(
    @user_id INT
)
AS
BEGIN
    SELECT * FROM Registration_form WHERE user_id = @user_id;
END;

EXEC GetRegistrationByID @user_id = 4;

    
--Updation operation
CREATE PROCEDURE UpdateRegistration(
    @user_id INT,
    @firstname VARCHAR(60),
    @lastname VARCHAR(60),
    @dateofbirth DATETIME,
    @gender VARCHAR(50),
    @PhoneNo VARCHAR(50),
    @Email VARCHAR(50),
    @Address VARCHAR(60),
    @State VARCHAR(30),
    @city VARCHAR(40),
    @Username VARCHAR(40),
    @password VARCHAR(50),
    @cpassword VARCHAR(50)
)
AS
BEGIN
    UPDATE Registration_form
    SET
        firstname = @firstname,
        lastname = @lastname,
        dateofbirth = @dateofbirth,
        gender = @gender,
        PhoneNo = @PhoneNo,
        Email = @Email,
        Address = @Address,
        State = @State,
        city = @city,
        Username = @Username,
        password = @password,
        cpassword = @cpassword
    WHERE user_id = @user_id;
END;

EXEC UpdateRegistration
    @user_id = 2,
    @firstname = 'Ganga',
    @lastname = 'S',
    @dateofbirth = '2000-05-15',
    @gender = 'Female',
    @PhoneNo = '9873465210',
    @Email = 'ganga@example.com',
    @Address = '987 New St',
    @State = 'Kerala',
    @city = 'Thiruvalla',
    @Username = 'ganga234',
    @password = 'gangapassword',
    @cpassword = 'gangapassword';

--delete opertion
CREATE PROCEDURE DeleteRegistration(
    @user_id INT
)
AS
BEGIN
    DELETE FROM Registration_form WHERE user_id = @user_id;
END;

EXEC DeleteRegistration @user_id = 2;


--task 8
-- To implement a CRUD operations with single stored procedure method for your given project.
CREATE PROCEDURE ManageRegistration(
    @Choice VARCHAR(10), 
    @user_id INT = NULL,
    @firstname VARCHAR(60) = NULL,
    @lastname VARCHAR(60) = NULL,
    @dateofbirth DATETIME = NULL,
    @gender VARCHAR(50) = NULL,
    @PhoneNo VARCHAR(50) = NULL,
    @Email VARCHAR(50) = NULL,
    @Address VARCHAR(60) = NULL,
    @State VARCHAR(30) = NULL,
    @city VARCHAR(40) = NULL,
    @Username VARCHAR(40) = NULL,
    @password VARCHAR(50) = NULL,
    @cpassword VARCHAR(50) = NULL
)
AS
BEGIN
    IF @Choice = 'Create'
    BEGIN
        INSERT INTO Registration_form (
            firstname, lastname, dateofbirth, gender, PhoneNo, Email,
            Address, State, city, Username, password, cpassword
        )
        VALUES (
            @firstname, @lastname, @dateofbirth, @gender, @PhoneNo, @Email,
            @Address, @State, @city, @Username, @password, @cpassword
        );
    END;

    IF @Choice = 'Read'
    BEGIN
        SELECT * FROM Registration_form WHERE user_id = @user_id;
    END;

    IF @Choice = 'Update'
    BEGIN
        UPDATE Registration_form
        SET
            firstname = @firstname,
            lastname = @lastname,
            dateofbirth = @dateofbirth,
            gender = @gender,
            PhoneNo = @PhoneNo,
            Email = @Email,
            Address = @Address,
            State = @State,
            city = @city,
            Username = @Username,
            password = @password,
            cpassword = @cpassword
        WHERE user_id = @user_id;
    END;

    IF @Choice = 'Delete'
    BEGIN
        DELETE FROM Registration_form WHERE user_id = @user_id;
    END;
END;

-- Create Operation
EXEC ManageRegistration 'Create',
    @firstname = 'Jacob',
    @lastname = 'joseph',
    @dateofbirth = '2000-08-15',
    @gender = 'Male',
    @PhoneNo = '12345572t90',
    @Email = 'jacob@example.com',
    @Address = '123 Main St',
    @State = 'karnataka',
    @city = 'Bangalore',
    @Username = 'jocob456',
    @password = 'jacobpassword1',
    @cpassword = 'jacobpassword1';

-- Read operation
EXEC ManageRegistration 'Read', @user_id = 4;

-- Update Operation
EXEC ManageRegistration 'Update',
    @user_id = 3,
    @firstname = 'Monu',
    @lastname = 'Rahul';
    

-- Delete Operation
EXEC ManageRegistration 'Delete', @user_id = 4;
