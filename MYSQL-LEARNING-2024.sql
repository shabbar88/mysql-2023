# DQL COMMANDS DATA QUERY LANGUAGE
/*
  MULTILINE COMMENTS
  I LOVE MULTILINE COMMENTS
*/

# SELECT COMMAND IS USED TO READ DATA FROM TABLES
#SELECT
#FROM 
#WHERE
#GROUPBY
#HAVING
#ORDERBY
#LIMIT
# tauquir here is database name database_name.table_name
SELECT * FROM tauquir.movies;
select  title,category from tauquir.movies;

select * from tauquir.imdb;
# getting data from fewer columns in tables from specific database
select  series_title,released_year,genre,runtime from tauquir.imdb;
# ctrl + enter will run only active query
# ctrl + shift + enter will run only cell under the cursor
# operators
# >, >=, <, <= ,<> ,!=, or, and, in, not in, like, not like
# regexp, not regexp,is null, is not null,
# exists, not exists
USE TAUQUIR;

select Series_Title,Certificate,Gross from
 imdb;
 desc imdb;
 select * from tauquir.movies1;
 -- we put a back tick to fetch a column with spaces
 select `Gross Revenue` from tauquir.movies1;
 
 -- using and
 select title,language,`lead actor`,`director name` from tauquir.movies1 where language="English" 
 and `Director Name`="William Wyler";
 
 -- using or
 select title,`Release Date`, Genre,Rating from tauquir.movies1 
 where Genre="Crime" or Genre="Drama";
 
 -- using in 
 -- where there is a multiple or we go for in operator
  select title,`Release Date`, Genre,Rating from tauquir.movies1 
 where Genre in ("Crime","Drama","Comedy");
 
 -- not in
   select title,`Release Date`, Genre,Rating from tauquir.movies1 
 where Genre not in ("Crime","Drama","Comedy");
 
    select title,`Release Date` from tauquir.movies1 where `Release Date`>
    "1920-08-15" and `Release Date`<"1940-10-12";
    
    select * from movies1;
    alter table movies1 modify `Release Date` date;
    -- using between
    
	select title,`Release Date` from tauquir.movies1 where `Release Date`between
    "1920-08-15" and "1940-10-12";
    
    
  -- WILDCARD CHARECTERS
  -- % REPRESENTS 0 OR MORE CHARS   ,_ REPRESENTS 1 CHARS
select title from tauquir.movies1 where title like "Modern%";

select title from tauquir.movies1 where title like "Modern%" or title like  "%Lady%" or title like "%Greatest%";
alter table movies1 modify `Release Date` date; 

-- display list of films starts with c or h but ends with od 
select title from movies1 where title like "C%OD" or title like "H%OD";

-- DISPLAY LIST OF FILMS CONTAINING EXACT 4 CHARS 
select title from movies1 where title like "____";

--  DISPLAY LIST OF FILMS NOT CONTAINING STAR,KING , DIE 
select title from movies1 where title NOT like "star" and title not like "king" and
title not like "die"; 

-- films ending with e
select title from movies1 where title like "%e"; 

# regexp use for partial match 
# ^ starts with
# $ ends with 
# | or
# [] range of values
# {} repeat n times 

select title from movies1
 where title regexp "Hat";
 
select title from movies1
 where title regexp "^Friday";
select title from movies1 where title regexp "Blood$";


select title from tauquir.movies1
 where title regexp "Modern"|"Lady"|"Greatest";

# =============================================================================== 
select title from movies1
 where title not  regexp "Blood$";

# [] it will take each charecter inside the square bracket n search for that..

select title from movies1 where title regexp '[xyz]';

-- '[v-z]' it will take any letter v to z

select title from movies1 where title regexp '[v-z]';
-- it will take letter starting with v to z
select title from movies1 where title regexp '^[v-z]';

-- displaying titles containing numbers o to 10
select title from movies1 where title regexp '[0-9]';

-- title starting with numbers
select title from movies1 where title regexp '^[0-9]';

-- title ending with nos
select title from movies1 where title regexp '[0-9]$';

#-- {} indicates repetition
select title from movies1 where title regexp 's{4}';

# display list of movies containing only numbers
select title from movies1 where title not regexp "[A-Z]";

# list of movies starts with number but not ends with number
select title from movies1 where title regexp "^[0-9]" and title not regexp "[0-9]$";

-- display list of movies ending with x,y,z or starting with number or containing word 'star'
select title from movies1 where title regexp '[xyz]$'|'^[0-9]' |
"star";

-- display list of movies which has number in last 2 chars
select title from movies1 where title regexp "[0-9]{2}$";

-- display list starts with c or h but ends with od 
select title from movies1 where title regexp "^[ch]" and title regexp "od$";

-- not conatining star,king or die
select title from movies1 where title NOT regexp "STAR" and title not regexp "king" 
and title not regexp "die";


-- display list of films which is second part of movie series
select title from movies1 where title  regexp "2"|"II" and title not regexp 'III';


# checking null values
select Budget from tauquir.movies1 where Budget is null;
#checking not null
select Budget from tauquir.movies1 where Budget is not null;

select title,`Gross Revenue`,Budget,`Gross Revenue`-Budget ProfitLoss  from tauquir.movies1;
select title,`Gross Revenue`,Budget,`Gross Revenue`-Budget as ProfitLoss  from tauquir.movies1;


# x div y returns quotient
# x % y returns remainder
# floor gives previous whole number
# ceiling gives next whole number

select title,concat(`Duration (min)` div 60," hr ",
`Duration (min)` % 60," mins")as duration from
tauquir.movies1;

# mod () does same thing as %
# concat function ism used to append 2 text..

select firstname,lastname,concat(firstname," ",lastname) Full_Name from tauquir.employee;

-- using if statement

select firstname,lastname,concat(firstname," ",lastname) Full_Name, 
jobTitle, if(jobTitle="Sales Rep","Salesman","something else") as EmpType
 from tauquir.employee;
 
 select 
 salary,FIRST_NAME,LAST_NAME, CONCAT(FIRST_NAME, " ",LAST_NAME)
 AS FULLNMAE, salary*0.1 +salary as "New Salary" from tauquir.employees_new;
 # changing hiredate from text to date
 
 select concat(title ," is a",if(`Gross Revenue`>`Budget`,
 " Hit Film"," Flop Film"), " having IMDB Score (1-10) ",`IMDb Score (1-10)`)
 as Message from tauquir.movies1;
 
 #======================================================================================
 # display text title if title contains only text else alphanumeric title 
 select title,if(title not regexp '[0-9]', "Text Title","Alphanumeric Title") 
 as Title_type from tauquir.movies1;
 
 
 # nested if condition 
 select title ,`IMDb Score (1-10)`,if(`IMDb Score (1-10)`<3,"Extremely bad", 
 if(`IMDb Score (1-10)` between 3 and 5,"Bad",
 if(`IMDb Score (1-10)` between 5 and 7,"Good", 
 if(`IMDb Score (1-10)` between 7 and 8.5,"very good","Excellent"))))
 as Movie_Quality from tauquir.movies1;
 
 select distinct department_id from tauquir.employees_new;
 
 select concat(first_name," ",last_name) as full_name, department_id, salary,
 if(department_id = 110, salary+salary*0.1, if (department_id=100, 
 salary+salary*0.7,if(department_id=90, salary+salary*0.5,salary)))as
 NewSal from tauquir.employees_new;
 
 -- display text title if title contains only text , 
 -- alphanymeric if contains both,numeric if contain numbers only
 select title , 
 if(title not regexp '[0-9]' ,"Text", 
 if (title regexp '[A-Z]',"Alphanumeric","Numeric"))as Title_type from tauquir.movies1;
 
 # display short film if len< 100 else longfilm 
 select title, `Duration (min)`,if(`Duration (min)`<100,"Short Film","Long Film") as film_len_type 
 from tauquir.movies1; 
 
 #=======================================================================================
 # case statement altenative to nested if 
 # case
 # when condition1 is TRUE , RESULT1 
 # WHEN CONDITION2 IS TRUE, RESULT2 
 # WHEN CONDITION3 IS TRUE, RESULT3 
 #........................................................................................
 # RESULTN
 # END
 
 # USING CASE
  select concat(first_name," ",last_name) as full_name, department_id, salary,
  CASE 
  WHEN DEPARTMENT_ID=110 then salary+salary*0.1
  when department_id=100 then salary+salary*0.07
  when department_id=90 then salary+salary*0.05
  else salary 
  end as  NewSal from tauquir.employees_new;
  
  select concat(title," is a ", 
  case 
  when `Gross Revenue`>`Budget` then  " Hit Film" 
  else "Flop Film" 
  end ," having IMDB Score (1-10) ",`IMDb Score (1-10)`)
 as Message from tauquir.movies1;
  
  
select concat(title ," is a",if(`Gross Revenue`>`Budget`,
 " Hit Film"," Flop Film"), " having IMDB Score (1-10) ",`IMDb Score (1-10)`)
 as Message from tauquir.movies1;
 
  # display short film if len< 100 else longfilm using case
 select title, `Duration (min)`,
 case
 when `Duration (min)`<100 then "Short Film"
 else "Long Film"
 end as film_len_type 
 from tauquir.movies1; 
 
 #============================================================================================
 
 # order by 
 # order by desc will sort in desc will sort in descending order
 
select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by salary desc;
 
 # limit ... it will limit the reuslt up tp particular no 
 select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by salary desc limit 5;
 
  # offset will give u data from particular row used along with limit
  # if u want to access second highest then offset would be 1 
  # if u want to access hihest then offset would be 0
 select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by salary desc limit 1 offset 1;
 
 # another way to get second highest 
 select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by salary desc limit 1,1;
 
 # fetching second lowest
  select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by salary  limit 1 offset 1;
 
 # fetching lowest
  select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by salary  limit 1 offset 0;
 
  # another way to get third highest 
 select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by salary desc limit 2,1;
 
 # applying order by on 2 columns simultaneously 
  select concat(first_name," ",last_name) as full_name, department_id, salary
 from tauquir.employees_new order by DEPARTMENT_ID asc,salary desc;
 
 # sorting full time, contract,half time,hourly
 
 select concat(first_name,' ',last_name) as fullname, 
 job_id, case 
 when job_id='IT_PROG' THEN 1
 WHEN JOB_ID='FI_MGR' THEN 2 
 WHEN JOB_ID='AC_ACCOUNT' THEN 3
 ELSE 4 
 END AS CUSTOMSORT FROM
 tauquir.employees_new order by customsort asc;
 
 # this is how we do custom sort 
 
 select concat(first_name,' ',last_name) as fullname, 
 job_id FROM tauquir.employees_new 
 order by case 
  when job_id='IT_PROG' THEN 1
 WHEN JOB_ID='FI_MGR' THEN 2 
 WHEN JOB_ID='AC_ACCOUNT' THEN 3
 ELSE 4 
 end asc;
 
 # IF U WANT TO AGAIN SORT SOMETHING ELSE INSIDE U CAN DO LIKE U WANNA SORT SALARY
  select concat(first_name,' ',last_name) as fullname, 
 job_id ,SALARY FROM tauquir.employees_new 
 order by case 
  when job_id='IT_PROG' THEN 1
 WHEN JOB_ID='FI_MGR' THEN 2 
 WHEN JOB_ID='AC_ACCOUNT' THEN 3
 ELSE 4 
 end asc, SALARY DESC;
 
 SHOW DATABASES;
 select * from employees.employees;
 
 /*
 1>Hike the salary by 10% for employee jobrating>=4 ,5% for job rating>=2,else same salary
 2> Display text title if title contain only text, if title contains both then alphanumeric,
 if contains only number then numeric.
 3>show short film if length< 100, 100-160, average lenth, else long film
 4>Hire salary by 10 % for full time salary employeed before 2000,5 % for contract employee 
 hored beforeb 2000,else same salary
 */
 use employees;
 select concat(First," ",Last) as full_name, salary, jobrating,
 case
 when jobrating>=4 then salary+salary*0.1 
 when jobrating>=2 then salary+salary*0.05 
 else salary 
 end as NewSalary from employees;
 
use movies;
select title,
case
when title not regexp '[0-9]' then "Text Title"
when title regexp '[A-Z]' THEN 'Alphanumeric Title' 
else 'Numeric Title'
end as Title_Type 
from film;


select title,RunTimeMinutes,
case 
when RunTimeMinutes<100 then "Short Film" 
when RunTimeMinutes between 100 and 160 then "Average length film" 
else "Long Film" 
end as Duration_type 
from film;

use employees;
select concat(first," ",last),status,HireDate, 
CASE 
when status="Full Time" and year(hiredate)=2000 then salary + salary*0.1
when status="Contract" and year(hiredate) = 2000 then salary +salary*0.05 
else salary 
end as NewSAl 
from employees.employees;

# custom sort

select concat(first," ",last) as Fullname,status,salary from employees.employees 
order by 
case 
when status ="Full Time" then 1
when status="Contract" then 2 
when status="Half-Time" then 3
else 4 
end asc, salary desc;

/*
  1> display the top 10 highest grossing film (boxofficedollar) of all time
  2> display 5 youngest femalea actress 
  3>sort by department and then by status in full time, contract,half-time,hourly
  and then by full name, then salary in desc 
  4> Display text title at top, then alphanum title, then numeric, each group should 
  be soryted by title again 
  5>Display movie list by highest to lowest oscar n then by boxofficedollar in desc
*/
use movies;
select title , BoxOfficeDollars from film order by BoxOfficeDollars desc limit 10;


select concat(firstname," ",familyname ) as fullname,dob,gender from movies.actor where gender="Female"
 order by dob desc limit 5; 
 
 
select concat(first, " ",last) as fullname,Department, status, salary from employees.employees
order by department, 
case 
when status="Full Time" then 1
when status ="Contract" then 2 
when status= "Half-Time" then 3 
when status="Hourly" then 4 
else 5 
end asc,fullname, salary desc;


select title from movies.film 
order by 
case 
when title not regexp '[0-9]' then 1
when title not regexp '[A-Z]' then 2
else 3
end asc,title asc;


select title,OscarWins,BoxOfficeDollars from movies.film 
order by OscarWins desc, BoxOfficeDollars desc;


#==============================================================================
#aggregate func sum,count,average,max,min

select count(*) as Number_Of_Emp  from employees.employees;
# count(*) count all rows in a table
# count(column) count only non null values 

select count(*) as number_of_film, 
count(BoxOfficeDollars) as CountBox from movies.film;

select count(*) as number_of_film,
 avg(BoxOfficeDollars) as AvgBox,sum(OscarWins) as TotalOscar,
count(BoxOfficeDollars) as CountBox,max(RunTimeMinutes) as MaxRun
 from movies.film;
 
 select title,BoxOfficeDollars from movies.film 
 where BoxOfficeDollars is not null;
 
 
 select title , BoxOfficeDollars,BudgetDollars,
 case
 when BoxOfficeDollars>BudgetDollars then 1
 end as Hits,
 BoxOfficeDollars>BudgetDollars as checkf,
 CASE
 when BoxOfficeDollars IS NULL OR BudgetDollars IS NULL THEN 1
 END AS CHECK_NULL
 from movies.film;
 
 select count(*) as hits from movies.film 
 where  BoxOfficeDollars>BudgetDollars;
 
 select count(*) as number_of_films,
 count(case 
 when BoxOfficeDollars>BudgetDollars then 1
 end)as Hits,
 count(case 
 when BoxOfficeDollars< BudgetDollars then 1 
 end
 )as Flop,
 count(case 
 when BoxOfficeDollars IS NULL OR BudgetDollars IS NULL THEN 1
 END) AS cNulls,
 count(case 
 when Oscarwins> 0 then 1 
 end) as Oscar_Winner,
 count(
 case 
 when RunTimeMinutes <100 then 1
 end)as Short_film,
 count(case 
 when RunTimeMinutes between 100 and 160 then 1 
 end )as Average_duration_film,
  count(case 
 when RunTimeMinutes>=160 then 1 
 end )as Long_duration_film
 from movies.film;
 
 /*
 1> display count of all employee n permanent(full time) n temp i.e part time emp
 2>avg sal of  perm n temp emp
 3>display count of hit films which won ascar,avg boxofficedollar of oscar winning only
 
 */
 
 select count(*) as emp_count, 
 count(case 
 when status="full time" then 1 
 end) as Full_Time_Emp ,
  count(case 
 when status !="full time" then 1 
 end) as part_Time_Emp 
 from employees.employees;
 
  select  avg(case 
 when status="full time" then salary
 end) as Full_Time_Emp_Sal,
 avg(case 
 when status !="full time" then salary
 end) as part_Time_Emp_Sal 
 from employees.employees;
 
 
 select count(
 case
 when OscarWins>0 then 1 
 end
 )as Oscar_winner,
 avg(case 
 when OscarWins>0 then BoxOfficeDollars
 END
 )AS AVERAGE_BOX_OFFICE_OSCAR
 
 from movies.film;
 #===========================================================================================
 # subquery
 SELECT TITLE, oscarwins from movies.film 
 where oscarwins= (select max(oscarwins) from movies.film);
 
 # display those film only having runtime greater than avg
 
 select title,RunTimeMinutes from movies.film 
 where RunTimeMinutes>=(select avg(RunTimeMinutes) from movies.film);
 set sql_safe_updates=0;
 
 update movies.actor
 set fullname= case 
 when familyname is null then firstname 
 else concat(firstname," ",familyname) 
 end ;
 
  update movies.director
 set fullname= case 
 when familyname is null then firstname 
 else concat(firstname," ",familyname) 
 end ;
 
 select fullname from movies.actor 
 where fullname in (select fullname from movies.director);
 
 /*
 # display list of actors only not directors
 # display list of directors only not actors
 # display highest n lowest salaried emp details 
 # display list of full time employee with salary more 
 than max sal of horly emp
# display list of actors who re younger than youngest director
*/
select count(fullname) from movies.actor;

select fullname from movies.actor where 
fullname not in (select fullname from movies.director);

select fullname from movies.director where 
fullname not in (select fullname from movies.actor);


select * from employees.employees where salary= 
(select max(salary)  from employees.employees)
 union
 select * from employees.employees where salary= 
(select min(salary)  from employees.employees);

# another approach
select * from employees.employees where salary= 
(select max(salary)  from employees.employees)
 or salary= 
(select min(salary)  from employees.employees);



select concat(first," ",last) 
as fullname,status,salary from employees.employees where status="full time" 
and
 salary >
(select max(salary) from employees.employees where status="hourly");


select fullname from movies.actor where dob >
(
select max(dob) from movies.director);

#===========================================================
# group by is used to find category wise subtotal
# below query will throw error because any
# statement other apart from count(*) shold be with group by
# group by works similar to pivot table in excel

select department, count(*) as no_of_emp 
from employees.employees;

select department, count(*) as no_of_emp ,
avg(Salary) as Avgsal, avg(JobRating) AS AvgJobRatings
from employees.employees group by Department
order by Department;

# any column apart from aggregate column in 
#select statement should be in group by

# here group by department then by status

select department,status, count(*) as no_of_emp ,
avg(Salary) as Avgsal, avg(JobRating) AS AvgJobRatings
from employees.employees group by Department,status
order by Department;


select department,count(*) as Total_employee,
 count(case when status="full time" 
then 1
end) as Permanent_emp,
count(case when status !="full time" then 1
end) Temporary_emp
from employees.employees group by Department
order by Department;

# another approach

select department,
 case when status="full time" 
then "permanent"
else "Temporary"
end as Employee_type,count(*) as no_emp
from employees.employees
group by Department,Employee_type
order by Department;

select department,
 case when status="full time" 
then "permanent"
else "Temporary"
end as Employee_type,count(*) as no_emp
from employees.employees
group by Department,Employee_type
having no_emp > 50
order by Department;

# if u want to filter by aggregate column inside group by use having
# clause insted of where


# hit films and flop films by genreid 
# display list of films which has same title for different films
# display most common familyname 
# display count of films by oscarwins

select  genreid,count(*) as no_films,
count(case when BoxOfficeDollars> BudgetDollars then 1
end) as Hit,
count(case when BoxOfficeDollars<BudgetDollars then 1
end) as Flop,
count(case when BoxOfficeDollars IS NULL OR 
BudgetDollars IS NULL then 1 end) as Count_Nulls
 from movies.film group by GenreID;
 
 
 
 select  title from movies.film 
 group by title having count(*)>1;
 

 
 # group_conact() will give list within the groups
 select  familyname,count(*) as namecount,group_concat(FullName) as fullname_list
 from movies.actor group by FamilyName order by namecount desc;

 
 select  oscarwins,count(*) as Number_of_films from movies.film 
 group by OscarWins order by OscarWins desc;
 #===================================================================
 # we have facts table and dimensional table 
 # facts table contains transactional information n foreign keys 
 # dimension table always acts unique keys
 # if all dimension table is connected to one fact table then it is called star schema
 
 select * from ipl.match;
 
 # create HR DATABASE ,EMPLOYEES TABLE IN THAT EMPID,EMPLOYEE,HIREDATE,GENDER
 # GENDERID,CITYID,DEPID,DESINATION-ID,EMAIL,PHONE,SALARY,,,THIS IS FACT TABLE
 # WE HAVE TO CREATE DIMENSION TABLLE AS WELL.CITY,DESIGNATION,DEP,GENDER
 # EG DIMENSION TABLE GENDER WHICH WILL CONTAIN GENDERID,GENDER...
 # similarly we will create for city,designation n department
 
 # CONSTRAINT USED TO PERFORM DATA VALIDATION
 # PRIMARY KEY,FOREIGN KEY,UNIQUE,CHECK,DEFAULT
 # FOREIGN KEY CREATES REFERENTIAL INTEGRITY, WE CANNOT HAVE ORPHAN RECORDS 
 # CHECK IS USED TO GIVE CONDITION EG EMAIL LIKE @ END WITH GMAIL.COM
 # PHPNE LENGTH =10, NO ALPHABETS
 #DEFAULT VALUES ALLOWS TO PUT VALUES BY DEFAULT. 
 #===============================================================
 CREATE DATABASE HR;
 USE HR;
 # creating facts table
 CREATE TABLE HR.Employees(EmployeeId int primary key AUTO_INCREMENT,
 Employee varchar(500),HireDate datetime,
 GenderId int,
 CityId int, DepartmentId int,
 DesignationId int,Email varchar(500),
 phone char(10),
 salary double
 );
 
 
 
 # creating dimension table
 create table HR.Gender(GenderId int primary key auto_increment,
 Gender varchar(100));
 
 
 create table HR.City(CityId int  primary key auto_increment,
 City varchar(500));
 
  create table HR.Department(DepartmentId int  primary key auto_increment,
 Department varchar(500));
 
create table HR.Designation(DesignationId int  primary key auto_increment,
 Designation varchar(500));
 

 
 # adding new column to existing table, IT WILL ADD ALWAYS AT THE END 
 alter table HR.employees 
 add SSN char(10);
 
 /*
 # ADDING AS PER OUR REQUIRED POSITION
 ALTER TABLE yourTableName
ADD COLUMN yourColumnName data type AFTER yourExistingColumnName;
 */
 
 # droping column from existing table
 ALTER TABLE HR.employees
 DROP COLUMN SSN;
 
 #renaming column
 alter table HR.employees
 rename column phone to phonenumber;
 
 # modify datatype column
 alter table HR.EMPLOYEES 
 MODIFY Email varchar(100);
 
 # adding constraint 
 alter table HR.employees 
 add constraint FK_Employees_GenderId 
 foreign key(GenderId) references Gender(GenderId);
 
  alter table HR.employees 
 add constraint FK_Employees_CityId 
 foreign key(CityId) references City(CityId);
 
alter table HR.employees 
 add constraint FK_Employees_DepartmentId 
 foreign key(DepartmentId) references Department(DepartmentId);
 
alter table HR.employees 
 add constraint FK_Employees_DesignationId 
 foreign key(DesignationId) references Designation(DesignationId);
 
 # creating unique key constraint 
 alter table hr.employees 
 add constraint UK_Employees_Email
 unique(Email);
 
  alter table hr.employees 
 add constraint UK_Employees_phonenumber
 unique(phonenumber);
 
 # check constraint
 alter table hr.employees 
 add constraint ck_Employees_Email 
 check (email like "%@%.com");
 
 alter table hr.employees 
 add constraint ck_Employees_phonenumber 
 check(length(phonenumber)=10 and phonenumber not regexp '[A-Z]');
 #====================================================================
 # create a database by name app
 create database APP;
  # create a database by name app
 # CREATE TABLES USERS(UserId,UserName,LoginId(char(6)),password,Email,CountryId,PlanId,Rating)
 # create Table Plan(PlanId, Plan)
 # create Table Country(CountryId,Country)
 # create Tabele Region(RegionId,Region)
 # fk CountryId,PlanId in Users 
 # fk RegionId in Country
 # unique LoginId,Password,Email
 # Plan in Plan Table should have Values A TO D 
 # password should have at least 6 length chars atleast 1 text 1 number and 1 special symbol 
 # LoginId should have 6 chars only, first 3 should be number and last 3 should be alphabet 
 # Rating should be 1 to 5 only
 
 use app;
 create TABLE app.Users(userId int primary key,
 username varchar(500),
 LoginId char(6),
 password varchar(100),
 Email varchar(100),
 CountryId int,
 PlanId int,
 Rating int);
 
 create table app.Plan(PlanId int primary key,Plan varchar(10));
 
 create table app.Country(CountryId int primary key,Country varchar(10),RegionId int);
 
 create table app.Region(RegionId int primary key,Region varchar(50));
 
 # adding foreign key constraint 
  # adding constraint 
 alter table APP.Users
 add constraint FK_Users_PlanId 
 foreign key(PlanId) references Plan(PlanId);
 
 alter table APP.Users
 add constraint FK_Users_CountryId 
 foreign key(CountryId) references Country(CountryId);
 
 alter table APP.Country
 add constraint FK_Country_RegionId 
 foreign key(RegionId) references Region(RegionId);
 
 
 # adding unique key constraint 
 
alter table app.Users
 add constraint UK_Users_LoginId
 unique(LoginId);
 
 alter table app.Users
 add constraint UK_Users_password
 unique(password);
 
 alter table app.Users
 add constraint UK_Users_Email
 unique(Email);
 
 # adding check constraint 
alter table app.plan
add constraint ck_plan_plan
check( plan regexp '[A-D]');

 # password should have at least 6 length chars atleast 1 text 1 number and 1 special symbol 
 # LoginId should have 6 chars only, first 3 should be number and last 3 should be alphabet 
 # Rating should be 1 to 5 only
 
 alter table app.Users
add constraint ck_Users_password
check(length(password)>=6);

/*
 alter table app.Users
add constraint ck_Users_password
check(length(password)>=6 and password regexP '[0-9]' and password regexp '[A-Z]' 
and (password regexp '[~!@#%]&*({-+)\}?_]' or password like "%$%" or password like "%^5"));
*/

# dropping check constraint

ALTER TABLE app.Users
DROP CHECK ck_Users_password;

 alter table app.Users
add constraint ck_Users_LoginId
check(length(LoginId)=6 and LoginId regexp '^[1-5]{3}[A-Z]{3}$');

 alter table app.Users
add constraint ck_Users_Rating
check(Rating regexp '[1-5]');

# adding auto increment to UserId
ALTER TABLE app.users
MODIFY UserId  INT AUTO_INCREMENT;

#=========================================================================================
# DATA INSERTION IN HR DATABASE 
insert into hr.gender(gender) 
values("Male"),("Female");

insert into hr.department(Department) 
values("IT"),("SALES"),("HR"),("FINANCE");

insert into hr.Designation(Designation) 
values("SOFTWARE ENGINEER"),("TEAM LEAD"),
("PROJECT MANAGER"),("DIRECTOR"),("VP");

insert into hr.City(City) 
values("DELHI"),("MUMBAI"),
("CHENNAI"),("BANGLORE"),("HYDERABAD");

INSERT INTO hr.employees 
values(default,"Karan Singh","2000-12-14",1,1,1,1,"karan@gmail.com","7044608766",18000),
(default,"Aman Singh","2004-12-13",1,2,3,4,"aman@gmail.com","7044608733",28000),
(default,"Anradha Singh","2002-04-12",1,3,3,1,"anuradha@gmail.com","7042308765",218000),
(default,"Jigyasa Singh","2003-12-23",2,1,3,1,"jigyasa@gmail.com","7044602365",118000),
(default,"Anwar Shah","1990-12-12",1,2,3,2,"anwar@gmail.com","7044608765",342226),
(default,"Ruchi Giri","2005-12-12",1,2,2,2,"ruchi@.com","7044876543",28000); 

select * from hr.employees;

# below line will generate error because of foreign key constraint

INSERT INTO hr.employees 
values(default,"Karan Singh1","2000-12-14",100,1,1,1,"karan1@gmail.com","7044608776",18000);
#===========================================================================================
# data insertion in app database
insert into app.region 
values(1,"ASia"),(2,"Europe"),(3,"America"),(4,"Africa");
alter table app.country 
modify column country varchar(50);

insert into app.country
values(1,"Singapore",1),(2,"Srilanka",1),(3,"England",2),(4,"usa",3),(5,"south africa",4);

insert into app.plan 
values(1,"A"),(2,"B"),(3,"C"),(4,"D");

insert into app.users
values(1,"simran kaur","123sim","SOMETHING1*","simran@gmail.com",1,1,4),
(2,"govind","123gov","2SOMETHING*","govind@gmail1.com",1,2,4),
(3,"harpreet","321har","3SOMETH*","simran@gmail2.com",4,3,4),
(4,"usman","111usm","4SOMONE*","usman@gmail.com",3,2,4),
(5,"aman singh","321ama","5SOMEDAY*","aman@gmail.com",4,1,4);

# creating copy of the table
create table employees.empcopy as
select * from employees.employees;

# creating film copy 
create table movies.filmcopy as 
select * from movies.film;

select * from movies.filmcopy;
select * from employees.empcopy;

# updating data 
# set salary 100000 and status= full time, when jobrating  = 1
set sql_safe_updates=0;
update employees.empcopy 
set salary=100000,
status="Full Time" where jobrating=1;

# update salary by 10n % when status is full time,contract > 5 percent increase
update employees.empcopy 
set salary= case 
when status="full time" then salary=salary*1.1
when status="contract" then salary=salary*1.05
else salary 
end;

# REPLACING PARTICULAR WORD IN COLUMN
update movies.filmcopy
set title= replace(Title,"Star","Diamond");

# =======================================================================================
# 1> HIKE SAL BY 10 % IF JOBRATING>=4 5 % IF >=2,ELSE SAME SAL
# 2>ADD NEW COLUMN FULL NAME EMPCOPY TABLEE,THEN UPDATE BASED ON FIRST N LAST NAME
# ADD NEW COL EMAIL TO EMPCOPY, THEN UPDATE AS first.last@gmail.com 
#  replace war with peace in title in movies.filmcopy 
# update fillname in actor based on firstname,family name

update employees.empcopy
set salary= 
case
when jobrating>=4 then salary = salary*1.1 
when jobrating >=2 then salary= salary*1.05 
else salary 
end;

alter table employees.empcopy 
add column fullname varchar(500) after last;

update  employees.empcopy 
set fullname=concat(first," ",last);

alter table employees.empcopy 
add column email varchar(100) after fullname;

update employees.empcopy 
set email=concat(first,".",last,"@gmail.com");

update movies.filmcopy 
set title=replace(title,"war","peace");

update movies.actor 
set fullname=case 
when familyname is null then firstname
else concat(firstname," ",familyname) 
end;
#===========================================================================================

# delete 
delete from employees.empcopy 
where status="full time";

delete from employees.empcopy;
select * from employees.empcopy;

# truncate is faster than delete as delete maintains log information 
# we have an option to delete few rows or all the rows but truncate always deletes all rows 
# truncate
truncate table movies.filmcopy;
select * from movies.filmcopy;


# drop 
drop table movies.filmcopy;

drop table employees.empcopy;
#=================================================================================
# joins
# inner join >> returns matching record only
# left join  >> returns all rows from left n common part from right
# right join  >> return all rows from right n common part from left
# full join  >> return every thing
# cross join >> it is cartesian product
# self join  >> join on the basis of same table

# inner join

select Title,BoxOfficeDollars,Fullname as Director
from movies.film f inner join movies.Director d 
on f.DirectorId = d.DirectorId;

# title,BoxOfficeDollars,Genre
#title,BoxOfficeDollars,Country
# title,BoxOfficeDollars, language
# title,BoxOfficeDollars,Certificate
# title,BoxOfficeDollars,Studio

select title, BoxOfficeDollars,Genre 
from movies.film f inner join movies.genre g 
on f.genreid = g.genreid;

select title, BoxOfficeDollars,language
from movies.film f inner join movies.language l
on f.LanguageID = l.LanguageID;

select title, BoxOfficeDollars,country
from movies.film f inner join movies.country c 
on f.CountryID=c.CountryID;

select title, BoxOfficeDollars,certificate
from movies.film f inner join movies.certificate c
on f.CertificateID=c.CertificateID;


select title, BoxOfficeDollars,studio
from movies.film f inner join movies.studio s
on f.StudioID=s.StudioID;


# joining more than 2 columns 
select Title,BoxOfficeDollars,Fullname as Director,
genre,studio,language,certificate,country
from movies.film f inner join movies.Director d 
on f.DirectorId = d.DirectorId 
inner join movies.genre g on f.GenreID=g.GenreID
inner join movies.studio s on f.StudioID=s.StudioID 
inner join movies.language l on f.LanguageID=l.LanguageID
inner join movies.certificate c on f.CertificateID=c.CertificateID 
inner join movies.country co on f.CountryID=co.CountryID;


# join and group by together
select fullname as Director ,
count(*) as number_of_films,
avg(BoxOfficeDollars) as AvgBo ,
sum(oscarwins) as TotalOscars 
from movies.film f inner join movies.director d 
on f.DirectorID=d.DirectorID 
group by Director;


# more than 2 joins and group by
select fullname as Director ,studio,
count(*) as number_of_films
from movies.film f inner join movies.director d 
on f.DirectorID=d.DirectorID 
inner join movies.studio s  
on f.StudioID=s.StudioID
group by Director,studio;

select genre, count(*) as number_of_films,
count(case when BoxOfficeDollars>BudgetDollars then 1 
end) as Hit,
count(case when BoxOfficeDollars<BudgetDollars then 1 
end) as Flop,
count(case when BoxOfficeDollars is null or BudgetDollars is null then 1 
end) as CheckNull
from movies.film f inner join movies.genre g 
on f.genreid=g.genreid 
group by genre;

#========================================================================================
#1> display avg runtime by genre, sort by highets to lowest avg
# 2> display list of actors who r also directors
# 3> display list of actors only ( not directors)
# 4> display list of directors only ( not actors)
#5> display count of different genre by each director, sort by most versatile director

select genre,avg(runtimeminutes) as AvgRunTime  from
movies.film f inner join movies.genre g 
on f.genreId = g.genreId 
group by genre order by  AvgRunTime desc;


select a.fullname as Actor,d.FullName as Director from
movies.actor a inner join movies.director d on 
a.fullname=d.fullname;

select a.fullname as Actor,d.FullName as Director from
movies.actor a left join movies.director d on 
a.fullname=d.fullname where d.FullName is null;

select a.fullname as Actor,d.FullName as Director from
movies.actor a right join movies.director d on 
a.fullname=d.fullname where a.FullName is null;


select  fullname as Director,count(distinct genre) as Genre_count,
group_concat(distinct genre) as Genre_Conc_List
   from
movies.film f 
inner join movies.director d on 
f.directorid=d.directorid 
inner join movies.genre g on 
f.genreid=g.GenreID
group by Director order by Genre_count desc;
#===============================================================================================

# Departent maximum salary Employee Name 
select * from employees.employees;
select Department,
max(salary) as max_sal  from 
employees.employees
group by department;

# window functions > any function used with over clause
# aggregate (aum,avg,count,min,max)
# ranking  (row_number,rank,dense_rank
# analytical function (lead,lag,firstvalaue)

select department,concat(first, " ",last) as fullname,salary as max_sal,
row_number() over (order by salary desc) as rw
from employees.employees;


# here once the department changes row nnumber will restart
select department,concat(first, " ",last) as fullname,salary,
row_number() over (partition by Department order by salary desc) as rw
from employees.employees;

# we cannot use window function in where clause n column alias in where clause
# for handling this type of situation we use common table expression cte
with dmax as(
select department,concat(first, " ",last) as fullname,salary,
row_number() over (partition by Department order by salary desc) as rw
from employees.employees
)
select * from dmax 
where rw=1;



with dmax as(
select department,concat(first, " ",last) as fullname,salary,
row_number() over (partition by Department order by salary desc) as rw
from employees.employees
)
select department,fullname,salary from dmax 
where rw=1;


# when department,status changes row number changes
# 2 partition by columns
select department,status,concat(first, " ",last) as fullname,salary,
row_number() over (partition by Department,status order by salary desc) as rw
from employees.employees;

with cte as 
(
select department,status,concat(first, " ",last) as fullname,salary,
row_number() over (partition by Department,status order by salary desc) as rw
from employees.employees
)
select department,status,fullname,salary from cte where rw=1;


# 1> display highest grossing (boxoffice) film detail of each director
# 2>display highest n lowest salaried employee details in each department 
# 3> display top 3 films by rintimeminutes in each genre
# 4> display youngest actor by gender

with cte as
(
select d.fullname as Director,title,releasedate,boxofficedollars ,
 row_number() over ( partition  by d.FullName order by BoxOfficeDollars desc) as rw
from movies.film f inner join movies.director d
on f.DirectorID=d.DirectorID
)
select Director,title,releasedate,boxofficedollars from cte
where rw=1 and boxofficedollars is not null;


select department, concat(first," ",last) as fullname,
row_number() over (partition by department order by salary desc) as rw,
row_number() over (partition by department order by salary ) as rw1,
 salary from 
employees.employees;

with cte as 
(
select department, concat(first," ",last) as fullname,
row_number() over (partition by department order by salary desc) as rw,
row_number() over (partition by department order by salary) as rw1,
 salary from 
employees.employees
)
select department,fullname,salary from cte where rw=1 or rw1=1;

select genre,runtimeminutes, 
row_number() over (partition by genre order by runtimeminutes desc)as rw
 from
movies.film f inner join movies.genre  g
on  f.genreid=g.genreid;

with cte as 
(
select genre,runtimeminutes, 
row_number() over (partition by genre order by runtimeminutes desc)as rw
 from
movies.film f inner join movies.genre  g
on  f.genreid=g.genreid
)select genre,runtimeminutes from cte where rw<4;

select gender, fullname as actor , dob,
row_number() over (partition by gender order by  dob desc)as rw
 from movies.actor;
 
 with cte as 
 (
 select gender, fullname as actor , dob,
row_number() over (partition by gender order by  dob desc)as rw
 from movies.actor
 )select gender,actor,dob from cte where rw=1;
 
 #=================================================================================
 
 # we have rank n dense_rank as well , if there is ties then result will differ otherwise sa,e result
 
 
 select * from employees.employees
 order by salary desc;
 
 
 # set salary = 89780 where empid = 168
 update employees.employees 
 set salary =89780 where employeeid=168;
 
 
 select concat(first, " ",last) as fullname,department,
 salary,row_number() over (order by salary desc) as rw,
 rank() over ( order by salary desc) as ranking,
 dense_rank() over ( order by salary desc) as dense_ranking
 from 
 employees.employees;
 
 /*
 The DENSE_RANK function is quite similar to the RANK function with only one difference.
 The RANK function does not return consecutive values in the case of having multiple occurrences
 of the same value. The DENSE_RANK function always returns consecutive values
 if there is a tie in values for say 3 times in the beginning itself all the 3 rank
 would be 1 only in each each case but for the next value rank would be 4 and dense rank would be 2
 */
 
 
 
 with cte as 
 (
  select concat(first, " ",last) as fullname,department,
 salary,row_number() over (order by salary desc) as rw,
 rank() over ( order by salary desc) as ranking,
 dense_rank() over ( order by salary desc) as dense_ranking
 from 
 employees.employees
 ) select fullname,department,salary from cte where dense_ranking<=3;
 
 # including ties we go for row_number()
 # excluding ties we go for dense_rank()
 
 
 # analytical function
 
 # lead
 
 select EmployeeID, 
 concat(first, " ",last) as fullname,department,salary,
 lead(salary) over (order by EmployeeID) as ld
 from
 employees.employees;
 
 # lag
  select EmployeeID, 
 concat(first, " ",last) as fullname,department,salary,
 lag(salary) over (order by EmployeeID) as lagging
 from
 employees.employees;
 
 #=====================================================================================
 
 # datetime functions
 select curdate() as cd,
 now() as dt,
 curtime() as ct, 
 year(curdate()) as year,
 month(curdate()) as Month,
 day(curdate()) as Day,
 quarter(curdate())as Qtr,
 week(curdate()) as wk,
 monthname(curdate()) as month_name,
 dayname(curdate()) as day_name,
 date_add(curdate(), interval(2) year) as date_adding,
 date_add(curdate(), interval(-2) year) as date_adding1,
 date_add(curdate(), interval(2) month) as date_adding_month,
 date_add(curdate(), interval(2) week) as date_adding_week,
 date_add(curdate(), interval(2) quarter) as date_adding_quarter,
 datediff("2024-12-12",curdate()) as df,
 timestampdiff(Year,curdate(),"2025-12-12") AS tm,
  timestampdiff(Month,curdate(),"2025-12-12") AS tmon,
   timestampdiff(Quarter,curdate(),"2025-12-12") AS tmquarter;
   
   
   # how many employees hired each yaer 
   select year(HireDate) as year,count(*) as Employee_hired from 
   employees.employees
   group by year;
   
   
   # when we do comparision like yoy we go for these type of concept 
   
   with cte as 
   (
    select year(HireDate) as year,count(*) as Employee_hired from 
   employees.employees
   group by year
   ) 
   select year,employee_hired, 
   (employee_hired-lag(employee_hired) over (order by year asc))/
   lag(employee_hired) over (order by year asc) as lg
   from cte;
   
   #================================================================================
   /*
   amazon finding user purchase
https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=3

with cte as
(
select user_id,item,
created_at,
lead(created_at) over
(partition by user_id order by user_id) as lead_one
from amazon_transactions
) select distinct user_id from cte 
where datediff(lead_one,created_at)<7;
   */
   
   
select title,releasedate,concat(timestampdiff(year,releasedate,curdate()) ," years ",
timestampdiff(month,releasedate,curdate()) mod 12 , " months")as time_span
from movies.film;

#==========================================================================================
# custom functions
# go to movies database then go to functions > right click create funtions
/*
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_age`(d datetime) RETURNS varchar(500) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

RETURN (
select concat(timestampdiff(year,d,curdate()) ," years ",
timestampdiff(month,d,curdate()) mod 12 , " months"));
END

*/
# calling fn_age function

select title,releasedate,fn_age(releasedate)
from movies.film;

select fullname,dob,fn_age(dob) as Age from movies.director;
select fullname,dob,fn_age(dob) as Age from movies.actor;

# ===========================================================================================
# Saturday,7th October 2023
select title,releasedate,
concat(dayname(releasedate),",",day(releasedate),
case 
when day(releasedate) in (2,3,22,23) then "rd"
when day(releasedate) in (4,5,6,7,8,9,10,11,12,12,14,15,16,17,18,19,20,24,25,26,27,28,29,30) then "th"
when day(releasedate) in (21,1,31) then "st"
else " "
end," ",monthname(releasedate), " ",year(releasedate)) as custom_date
from movies.film;

# using customised function
select title,releasedate,custom_date(releasedate) as Customized_date from movies.film;
# accessing function of different db n using in different db.
select concat(first, " ",last) as 
fullname, custom_date(hiredate) as Custom_hiring_date from employees.employees;
#====================================================================================

# display list of film with runtime more than average runtime of all films in that genre


select genre,title,runtimeminutes,
avg(runtimeminutes) over (partition by genre) as avg_run
from movies.film f inner join movies.genre g
on f.genreid=g.genreid;


with cte as
(
select genre,title,runtimeminutes,
avg(runtimeminutes) over (partition by genre) as avg_run
from movies.film f inner join movies.genre g
on f.genreid=g.genreid
)select genre,title,
runtimeminutes from cte where runtimeminutes>avg_run ;

# display list of film with runtime less than max runtime of all films in that genre

with cte as
(
select genre,title,runtimeminutes,
max(runtimeminutes) over () as max_run
from movies.film f inner join movies.genre g
on f.genreid=g.genreid
)select genre,title,runtimeminutes
 from cte where runtimeminutes<max_run;
 
 
 # display list of film with runtime more than min runtime of all films in that genre

with cte as
(
select genre,title,runtimeminutes,
min(runtimeminutes) over () as min_run
from movies.film f inner join movies.genre g
on f.genreid=g.genreid
)select genre,title,runtimeminutes
 from cte where runtimeminutes>min_run;
 
 # display list of films in each year with  runtime more than average runtime in that year 
 with cte as
 (
 select year(releasedate) as release_yr,title,runtimeminutes,
 avg(runtimeminutes) over(partition by year(ReleaseDate)) as avg_runtime 
 from movies.film
 )
 select release_yr,title,runtimeminutes from cte where runtimeminutes>avg_runtime;
 
 #=============================================================================================
 
 # now dealing with ipl database
 select * from ipl.match;
 
 # display player with highest number of man of the matches
 # display count of matches won by each team 
 # displaye count of matches played in each venue 
 # display count of matches played by each team 
 # display count of matches in which toss win by each team 
 
 select p.player_name as player,count(*) max_mom from
 ipl.match m inner  join ipl.player p 
 on m.Man_of_the_Match=p.player_id
 group by player order by max_mom desc;
 
 
 select distinct(t.team_name) as teams,count(*) as match_wins
 from
 ipl.match m inner join ipl.team t
 on m.match_winner=t.team_id
 group by teams order by match_wins desc;
 
  select team_name,count(*) as match_wins
 from
 ipl.match m inner join ipl.team t
 on m.match_winner=t.team_id
 group by team_name order by match_wins desc;
 
 
 
 select v.venue_name,count(*) as matches_count
 from ipl.match m inner join ipl.venue v
 on m.venue_id=v.venue_id 
 group by venue_name order by matches_count desc;
 
   select team_name,count(*) as match_played
 from
 ipl.match m inner join ipl.team t
 on m.match_winner=t.team_id
 group by team_name order by match_wins desc;
 
 
select team_name,count(*) as toss
 from
 ipl.match m inner join ipl.team t
 on m.toss_winner=t.team_id
 group by team_name order by toss desc;
 
 
 
 select team_name,count(*) as matches from ipl.match  m inner join ipl.team t 
 on m.Team_1=t.team_id or m.Team_2=t.team_id
 group by Team_Name order by matches desc;
 # =======================================================================================
 # display player count in ipl from each country 
 select c.country_name,count(*) as No_of_players from
 ipl.player p inner join ipl.country c
 on p.country_name=c.country_id
 group by Country_Name  order by No_of_players desc;
 
 # display city name,country name of each venue,sort countries india, uae, others.
 select Venue_Name, city_name as city,country_name as country from
 ipl.venue v inner join ipl.city c 
 on v.city_id=c.city_id 
 inner join ipl.country co 
 on c.country_id= co.country_id
 group by country,city,venue_name order by 
 case 
 when country="India" then 1
 when country="U.A.E" then 2 
 else 3
 end asc;
 
 
 
 /*
 # custom sort

select concat(first," ",last) as Fullname,status,salary from employees.employees 
order by 
case 
when status ="Full Time" then 1
when status="Contract" then 2 
when status="Half-Time" then 3
else 4 
end asc, salary desc;
 */
 #=================================================================================
 
 # special problem
 
 select match_date,t1.team_name as Team1,
 t2.team_name as Team2, t3.team_name as Toss_Winner,
 t4.team_name as Match_winner,Venue_Name from
 ipl.match m inner join ipl.team t1 
 on m.team_1=t1.team_id 
 inner join ipl.team t2 
 on m.team_2 = t2.team_id
 inner join ipl.team t3 
 on m.toss_winner = t3.team_id
 inner join ipl.team t4
 on m.match_winner=t4.team_id
 inner join ipl.venue v 
 on m.venue_id=v.venue_id;
 
 
 # display man of the series player, orange cap player, purple cap player for each season
 
 select season_year, p.player_name as Man_of_the_series,
 p1.Player_Name as Orange_cap_player,p2.Player_Name as purple_cap_player
 from
 ipl.season s1 inner join ipl.player p
 on s1.man_of_the_series=p.player_id 
 inner join ipl.player p1 
 on s1.orange_cap=p1.player_id 
 inner join ipl.player p2 
 on s1.purple_cap=p2.player_id;
 
 
 # display list of players who bat n ball in different hands
 
 select player_name,b.Batting_hand,bs.Bowling_skill from
 ipl.player p inner join ipl.batting_style b 
 on p.batting_hand=b.batting_id
 inner join ipl.bowling_style bs 
 on p.bowling_skill=bs.bowling_id
  where (b.Batting_hand like "%right%" and bs.Bowling_skill like "%left%") 
  or (b.Batting_hand like "%left%" and bs.Bowling_skill like "%right") ;
  
  #=========================================================================================
  # total runs score by each batsman 
  
  # concept of joining 2 tables based on multiple condition
  select p.player_name ,sum(bs.runs_scored) as runs_scored from
  ipl.ball_by_ball b inner join ipl.batsman_scored bs
  on b.ball_id =bs.ball_id 
  and b.match_id=bs.match_id
  and b.over_id =bs.over_id 
  and b.innings_no=bs.innings_no
  inner join ipl.player p 
  on b.Striker=p.Player_Id
  group by p.Player_Name order by runs_scored desc;
  
  
  # highest run scoring matches in ipl
   select  match_date, t.team_name as Team1,
   t1.team_name as Team2,sum(Runs_Scored)as  total_runs from
  ipl.ball_by_ball b inner join ipl.batsman_scored bs
  on b.ball_id =bs.ball_id 
  and b.match_id=bs.match_id
  and b.over_id =bs.over_id 
  and b.innings_no=bs.innings_no 
  inner join ipl.match m on b.match_id=m.match_id 
  inner join ipl.team t on m.team_1=t.team_id
  inner join ipl.team t1 on m.team_2=t1.team_id
  group by match_date,Team1,Team2 order by total_runs desc;
  
  # player with most number of sixes in ipl 
    select p.player_name ,count(case when bs.runs_scored=6 then 1 end) as sixes from
  ipl.ball_by_ball b inner join ipl.batsman_scored bs
  on b.ball_id =bs.ball_id 
  and b.match_id=bs.match_id
  and b.over_id =bs.over_id 
  and b.innings_no=bs.innings_no
  inner join ipl.player p 
  on b.Striker=p.Player_Id
  group by p.Player_Name order by sixes desc;
  
  #===============================================================================================
  # display list of players who captained most number of matches
  select 
  player_name,count(role_desc) as CaptainedMatches
  from ipl.player_match pm inner join ipl.player p
  on pm.player_id=p.player_id
  inner join ipl.rolee r on pm.role_id=r.role_id
  where role_desc like"%captain%"
  group by Player_Name order by CaptainedMatches desc;
  
  # display count of captains from each team
  
    select
  Team_Name,count(distinct Player_Name) as captain, 
  group_concat(distinct Player_Name) as Caplist
  from ipl.player_match pm inner join ipl.player p
  on pm.player_id=p.player_id
  inner join ipl.rolee r on pm.role_id=r.role_id
   inner join ipl.team t on pm.team_id = t.team_id
   where role_desc like "%captain%"
   group by Team_Name order by captain desc;
   #=====================================================================================
   
   # stored procedures
   # stored procedure is a pre compiled block of code
   #compile n check for syntax errors
   # create exection plan
   # parse values
   # run
   
   # stored procedures r faster than normal queries 
   # code reusability
   # faster execution due to cached execution plan. 
   #  mainatais level of abstraction n hides the complexity from other users.
   
   /*
   how to create stored procedure 
   go to ipl database 
   go to stored procedue
   create stored procedure
   
   */
   # created stored_procedures most_sixes
   # calling stored procedures
call most_sixes();



# create stored procedure on moviedb pattern star , startend end date 

select * from movies.film;
select  title,releasedate
from movies.film
where title like "%star%" and year(ReleaseDate) between 1990 and 2000;


call movies.star_movies_proc("star","1990-1-1","2004-12-31");
#=============================================================================================
# loops
select oscarwins, count(*) as number_fims
from movies.film group by oscarwins order by oscarwins;

call sp_loop(10);

create table movies.filmcopy as 
select * from movies.film;

 set sql_safe_updates=0;
 update movies.filmcopy 
 set oscarwins=7 where oscarwins=8;
 
 select  oscarwins,count(*) as number_films
 from movies.filmcopy group by oscarwins order by number_films desc;
 
 call sposcars();
 
 # start date end date
 #date, year,month,quarter,weeknum,monthname,dayname,long date format,short date format,weektype
 call sp_calendar("2020-1-1","2020-12-12");
 
 select * from table_calendar1;


#==========================================================================================
# TRIGGERS
#TRIGGER IS A BLOCK OF CODE WHICH WILL RUN IN RESPONSE TO OTHER EVENT. 
# before insert,after insert,before update,after update,before delete after delete
CREATE DATABASE TRIGGER2;
USE TRIGGER2;

CREATE TABLE CUSTOMERS( cust_id int primary key auto_increment,
cust_name varchar(500),
age int);
# delimiter // start of block of code

DELIMITER //
CREATE TRIGGER TRIGCUSTAGE
BEFORE INSERT ON CUSTOMERS
FOR EACH ROW 
BEGIN
IF NEW.age  < 0 then set new.age=18;

END IF;
END //
# end of block of code ....
DELIMITER ;

insert into trigger2.customers(cust_name,age) 
values("wasim",-10),("kamran",10);

use trigger2;
create table emp(empid int primary key auto_increment,
empname varchar(300),email varchar(500),birthdate datetime);

create table message(id int auto_increment,messageid int ,
message varchar(500),primary key(id,messageid));

Delimiter //
create trigger after_insert 
after insert on trigger2.emp
for each row 
begin
if new.birthdate is null then 
insert into message(messageid,message)
values(new.empid,concat("Hii ",new.empname," plzz enter your dob"));
end if;
end // 
Delimiter ;

insert into emp(empname)
values("anu");

use trigger2;
create table employees(empid  int primary key auto_increment,empname varchar(400),
empsal double);

insert into employees(empname,empsal)
values("Rehan",23000),("Zeeshan",12000),("Anil",4000),("Raj",20000);

Delimiter //
create trigger trsalary 
before update on employees 
for each row 
begin 
if new.empsal < 50000 then 
set new.empsal=500000;
elseif new.empsal<80000 then
set new.empsal=80000;
end if;
End //
Delimiter ;

set sql_safe_updates=0;
update  trigger2.employees
set empsal=30000 where empsal<30000;



# delete trigger 

use trigger2;
create table salary3(empid int primary key auto_increment,
empname varchar(500),cdate datetime,salary double);

create table salarydel3(empid int primary key,
empname varchar(500),cdate datetime,salary double,deldate timestamp default now());

insert into salary3(empname,cdate,salary) 
values("karan","2000-12-12",40000),("neha","2012-12-12",90000),("rehana","2005-09-09",100000);


Delimiter //
create trigger before_delete3
before delete on salary3
for each row 
begin 
insert into salarydel3(empid,empname,cdate,salary)
values(old.empid,old.empname,old.cdate,old.salary);
End //
Delimiter ;

delete from salary3 where empname="neha";

# =====================================================================================
truncate employees.tcl;
# tcl commands 
 set autocommit=0;
 create table employees.tcl
 (custid int primary key auto_increment,
 custname varchar(500),
 salary double);
 

start transaction;
insert into employees.tcl(custname,salary)
values("shabbar",1000000),("mubarak",2000000),("nausheen",2222222);
commit;

start transaction;
insert into employees.tcl(custname,salary)
values("shabbar1",1000000),("mubarak1",2000000),("nausheen1",2222222);

savepoint insertion;

update employees.tcl 
set salary=150000 where custname="shabbar";
savepoint updation;

rollback to insertion;
select * from employees.tcl;

start transaction;
savepoint insert2;
delete from employees.tcl 
where custname="shabbar1";
savepoint deletion;

rollback to insert2;

#=========================================================================================
# Display list of films n age of director when his film got released

select f.title,fullname,concat(timestampdiff(year,d.dob,f.releasedate),"years ",
timestampdiff(month,d.dob,f.releasedate)%12,"months") as Age_at_that_time
 from
 movies.film f inner join movies.Director d
on f.directorid =d.directorid
group by fullname,title,Age_at_that_time order by fullname ;


# display list of directors sorted by their versatility
#  director genrecount(different genres)

select d.fullname,count(distinct g.genre) as genrecount
 from movies.film f inner join movies.director  d
on f.directorid=d.directorid 
inner join movies.genre g 
on f.GenreID=g.genreid 
group by fullname order by genrecount desc;

#==================================================================================================
   #===========================Thanks=============================================#














 


   
   
   
   
   
  


  


  
  
  
  

  
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

















   
   
   
   
   
   
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



























 












 




















































#=============================================================================================




 
 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

















 




 
 
 
 
 
 
 





 





 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
  
 
 

 
 
 
 
 
 
 
































    



 
 
 
 


 


