--tables book
create database michal_project collate hebrew_100_ci_as
use michal_project
go
---3 טבלאות מרכזיות
go

create table book
(
BookId int identity(1,1) not null,
NameBook varchar(30) not null,
soferID int not null,
YearsOztaa varchar(4) null,
ISBN varchar(10) not null,
Teur varchar(30) null,
Topic varchar(30) null,
TypeBookID int null,
Eara varchar(30) null,
Cost int null,
HowPeper varchar(30) null,
constraint pk_book primary key(BookId),
constraint fk_book_TypeBookID foreign key (TypeBookID) references typeBook(TypeBookID),
constraint fk_book_soferID foreign key (soferID) references sofer(soferID)
)
go



create table oved
(
ovedId int identity(1,1) not null,
typeOvedId int not null,
FirstName varchar(20) not null,
LastName varchar(20) not null,
tz bigint not null,
CityID int null,
StreetID int null,
MikudID int null,
Phon varchar(10) null,
Email varchar(20) null,
Eara varchar(50) null,
constraint pk_oved primary key(ovedId),
constraint fk_oved_typeOvedId foreign key (typeOvedId) references TypeOved(typeOvedId),
constraint fk_oved_CityID foreign key (CityID) references City(CityID),
constraint fk_oved_StreetID foreign key (StreetID) references Street(StreetID),
constraint fk_oved_MikudID foreign key (MikudID) references Mikud(MikudID)
)

go

create table shop
(
shopID int identity(1,1) not null,
ShopName varchar(20) not null,
CityID int not null,
StreetID int not null,
MikudID int null,
Phon varchar(10) null,
Eara varchar(50) null,
constraint pk_shop primary key(shopId),
constraint fk_shop_CityID foreign key (CityID) references City(CityID),
constraint fk_shop_StreetID foreign key (StreetID) references Street(StreetID),
constraint fk_shop_MikudID foreign key (MikudID) references Mikud(MikudID)
)

 go
 create table costumer
 (
 costumerID int identity not null,
 firstName varchar(15) not null,
 lastName varchar(30) not null,
 tz bigint not null,
 phone varchar(15) not null,
 streetID int null,
 cityID int null,
 MikudID int null,
 shopID int not null,
constraint pk_costumerID primary key (costumerID),
constraint fk_costumer_streetID foreign key (streetID) references street(streetID),
constraint fk_costumer_cityID foreign key (cityID) references City(cityID),
constraint fk_costumer_shopID foreign key (shopID) references shop(shopID),
constraint fk_costumer_MikudID foreign key (MikudID) references Mikud(MikudID)
 )

---4 טבלאות קטנות 

create table TypeBook 
(
TypeBookID int identity(1,1) not null,
TypeBookName varchar(30) not null
constraint pk_TypeBook primary key(TypeBookId)
)

create table City 
(
CityId int identity(1,1) not null,
CityName varchar(30) not null
constraint pk_City primary key(CityId)
)

create table Street
(
StreetId int identity(1,1) not null,
StreetName varchar(30) not null
constraint pk_Street primary key(StreetId)
)

create table typeOved
(
typeOvedId int identity(1,1) not null,
typeOvedName varchar(30) not null
constraint pk_typeOved primary key(typeOvedID)
)

create table Mikud
(
MikudID int identity(1,1) not null,
MikudNumber varchar(30) not null
constraint pk_Mikud primary key(MikudID)
)

create table sofer
(
soferID int identity(1,1) not null,
soferName varchar(30) not null
constraint pk_sofer primary key(soferID)
)
select*from sofer


----הכנסת נתונים
---------------------------------------insert------------------------------------------

insert into book(NameBook,soferID,YearsOztaa,ISBN,Teur,Topic,TypeBookID,Eara,Cost,HowPeper)
values
('הפיצוץ',1,'2004','3456778','ספר יפה','אודות הפצצת אטום',1,'מתח',80,'458'),
('עלים שעלו מהעפר',2,'2022','9087564','סיפור ניצולת שואה','שואה',5,null,180,'690'),
('לבשל בקלות',5,'2019','5674256','נותן הדרכה מעשית וקלה','אוכל לשבת',4,'במבצע',70,'120'),
('גם כי אלך',3,'2021','9076524','ספר מרגש על נכות',null,6,null,150,'500'),
('לב של קרח',4,'2020','5642100','סיפור יפה ברוסיה',null,1,null,95,'300'),
('אלגברה',2,'2021','6741230','הכנה לבגרות','טכניקה אלגברית',2,'חלק ב',120,'200'),
('המכונה המשוכללת ביותר',2,'1998','6751230','לימוד מעשי לתואר בביולוגיה','הלב וכלי הדם',3,null,90,'100')

select*from book

insert into oved(typeOvedID,FirstName,LastName,tz,CityID,StreetID,MikudID,Phon,Email,Eara)
values
(1,'כהן','משה',123456789,1,2,2,'0478393845','moshe@gmail.com',null),
(2,'אור','לוי',987654321,2,1,1,'023847562','or@gmail.com',null),
(3,'אורן','דיין',245643567,3,3,3,'083424324','oren@gmail.com',null),
(4,'שושנה','סלבה',789452309,2,4,7,'027864532','slava@gmail.com',null),
(5,'אפרים','לורן',678904321,5,9,6,'098765467','loren@gmail.com',null)

select*from oved


insert into costumer(FirstName,LastName,tz,phone,CityID,StreetID,MikudID,shopID)
values
('שירה','לוריא',673456908,'067542345',3,2,2,5),
('מיכל','אלקיים',999999999,'020987890',4,1,1,4),
('מנחם','בן שלום',888888888,'085674323',5,3,3,3),
('אברהם','זיו',555556666,'020989076',3,4,7,2),
('ציפי','לשם',888884444,'096544564',1,9,6,1)


insert into shop(ShopName,CityID,StreetID,MikudID,Phon,Eara)
values
('ספרות',2,1,1,'025436545','חניה נוחה ללקוחות'),
('ספר לכל',3,2,2,'035432222','הנחות לרגל החג'),
('מייספר',4,3,3,'043435565',null),
('ספר',3,5,5,'046785065',null)


insert into TypeBook(TypeBookName)
values('מתח'),('לימוד'),('רפואה'),('בישול'),('שואה'),('רגש')

insert into City(CityName)
values('ירושלים'),('בני ברק'),('אשדוד'),('אילת'),('באר שבע')

insert into Mikud(MikudNumber)
values('654400'),('809088'),('455343'),('666777'),('777888'),('123456'),('654321'),('127656'),('698701')

insert into Street(StreetName)
values('הפרחים'),('שקד'),('שושנה'),('נרקיס'),('ארלוזרוב'),('יצחק שמיר')

insert into typeOved(typeOvedName)
values('מנהל'),('מוכר'),('משווק'),('מנקה'),('מוציא לאור')

insert into sofer(soferName)
values('רחל לוי'),('שלום כהן'),('ליבי קליין'),('מיה קיינן'),('מיכאל השף')


-----------------------------alter------------------------------
alter table costumer
add numbercount varchar(10) null


-------------------------------drop------------------------
--drop table shop

------------------------------update------------------------
-------עדכון עובד מספר 1 לשם חיים-----
update oved
set FirstName='חיים'
where ovedId=1
-------בטבלת העובדים עידכון כל מי ששם המשפחה דורון לתז מסוימת
update oved
set LastName='דורון'
where tz=789452309

--------------------פעולות מחיקה--------delete-------------------------------

---למחוק את אורן מטבלת העובדים
delete from oved where FirstName='אורן'
---פעולה למחיקת כל הרשומות בטבלת ספרים חוץ מהספרים
--delete from books


-------------truncate----------------לרוקן את טבלת העובדים---
truncate table book
---פעולות עידכון




select* from book

---------------פרוצדורה שבודקת האם ספר מסוים קיים במערכת ואם לא מכניס אותו-------procedure----------------variables-----if else---print-
alter procedure dbo.pr_newbook  (@NameBook varchar(30),@sofer int,@YearsOztaa varchar(4),@ISBN varchar(10),@Teur varchar(30) null,
@Topic varchar(30),
@TypeBookID int,
@Eara varchar(30),
@Cost int,
@HowPeper varchar(30))
	   as
	   begin 
	   declare @check varchar(10)
	   set @check=(
	   select ISBN
	   from book b
	   where ISBN=@ISBN
	   )
	   if(@check is not null)
	   print('הספר קיים במערכת')
	   else 
	   insert into book 
	   values (@NameBook,@sofer,@YearsOztaa,@ISBN,@Teur,@Topic,@TypeBookID,@Eara,@Cost,@HowPeper)
	   print ('הוכנס בהצלחה')
	   end

	   exec dbo.pr_newbook 'גם',3,'2021','9056524','ספר מרגש על נכות',null,6,null,150,'500'

	   -----------------------------------------------function-------------------------------------------------
	   ------------------------------פונקציה שבודקת האם התעודת זהות שהוזנה תקינה--------------------------------
	   
	   create function dbo.tz (@tz bigint)
	   returns varchar(10)
	   as
	   begin
	   declare @check varchar(10)
	   set @check = case len(@tz)
	   when 9 then 'תקין'
	   else 'לא תקין'
	   end
	   return(@check)
	   end
	   go

	select dbo.tz (7767865)

 -------------------פונקציה בתוך פרוצדורה-------------------------
	   -----------------מקבלת ת"ז בודקת אם תקין ואם כן בודקת אם זה עובד או לקוח----------------------------
	   create or alter procedure PR_tz_ovedOrCostumer(@tz varchar(9))
	   as 
	   begin

	   if(select dbo.tz(@tz))='תקין'
	        begin 
	        if(select tz from oved where tz=@tz) is not null
			select 'עובד'
			else
			if(select tz from costumer where tz=@tz) is not null
			select 'לקוח'
			else
			select 'לא קיים במערכת'
			end
      else select dbo.tz(@tz)
	  end

	  exec PR_tz_ovedOrCostumer '6734508'
	  go


	  	   --select מתוך טבלה שמשתמש בפונקציה-----------join-------------
	   --מציאת העובד הגר בעיר מסוימת
	  
go
create function dbo.cityoved(@city varchar(10))
returns table
as
return
(select o.tz,o.FirstName,o.LastName,C.CityName
join City C on C.CityId=o.CityID
where @city =C.CityName)
go


select *from dbo.cityoved('אשדוד')



	   -----------------------------view לטבלת עובדים-----------join--------left join-----------
	   go
	  create view allNames
	  as
	  select o.FirstName, o.LastName, o.tz
	  from oved  o left join street s 
	  on s.streetID=o.streetID
	  join costumer co
	  on o.streetID=co.streetID
	  go


	  select * from allNames


	  -------------------טריגר הפועל בעת עידכון נתונים triger----------------------------------

go
 create or alter trigger trg_costumer
 on costumer
 for update
 as
 print'שונה בהצלחה'
 


 update costumer
 set firstName='איילת'
 where firstName='שירה'

 --select * from costumer


  ----------------------------טריגר כשנכנס לקוח חדש--------------- 
       go
       create trigger trg_newCostumer
       on costumer
       for insert
       as
       print'ברוך הבא! לקוח חדש הצטרף למערכת'

	   ----------------------------טריגר כשמוחקים מטבלת עובדים--------------- 
       go
       create trigger trg_deleteoved
       on oved
       for delete
       as
       print'נמחק בהצלחה'

	   

----------------------------שולף את העובדים ללא מיקוד--------------procedure--left join+ where null--------------------
	  create procedure dbo.pr_noMikud
	  as
	  begin
	  select o.FirstName,o.LastName,o.tz, o.MikudID
	  from oved o left join Mikud M
	  on M.MikudID=o.MikudID
	  where o.MikudID is null
	  end
	  go
	  exec dbo.pr_noMikud
	  go


	   -----------------------------------------------------------

------------------------פרוצדורה המחשבת באיזה עיר גרים הכי הרבה לקוחות-----------having---------------------
-----------------------group by+subselect----------------------
create procedure dbo.max_city
as
begin
select C.CityName, count(*) as amount
from costumer co
join City C on co.cityID=C.CityId
group by C.CityName
having count(*)=(select max(amount)
from(select co.cityID, count(*) as amount
from costumer co
join City C on co.cityID=C.CityId
group by co.cityID)ff)
end
exec dbo.max_city

---------------------------------------------פונקציות אגרגטיביות----------------------------------------

	    ----------------------------פונקציה שבודקת האם הספר חדש-------while----------------
	   
	   go
	   create function dbo.costbook (@cost int)
	   returns varchar(10)
	   as
	   begin
	   while(@cost>100)
	   begin
	   return ('ספר חדש')
	   end
	   return ('ספר ישן')
	   end

	   

         
		 -----------------פרוצדורה שפועלת בעת שליפת מידע ובודקת מי מבקש המידע ושולפת נתונים בהתאם להרשאות--------if else--- union---- join ----print--------
         go
		 create procedure dbo.typeovedchek
         as
         begin
         declare @typeoved varchar(30)
         set @typeoved='מוכר'
         if(@typeoved='מנהל')
         begin
         declare @nams varchar(max)
         set @nams=' '
         select @nams = co.firstName +' '+ co.lastName+' '+co.tz+' '+co.phone+' '+co.cityID+' '+co.streetID
         from costumer co
         join city c on c.CityID=co.CityID
         where c.CityName='אשדוד'
         print @nams
		 end
        else
         if(@typeoved='מוכר')
         begin
         select co.firstName , co.lastName
         from costumer co
         union
         select o.FirstName, o.LastName
         from oved o
         end
       else
	   if(@typeoved='מנקה' or @typeoved='משווק')
         print 'אינך מורשה'
       
	   end
exec dbo.typeovedchek 
go

	 ------------try catch-----------שגיאה---------------- 

alter procedure netunimBooks 
as
begin try
insert into book values('שושנת העמקים',4,56757678)
end try

begin catch
print('שים לב להכניס ערכים לפי טיפוס הנתונים')
end catch
go
exec netunimBooks 


--create table sings
--(
--single varchar(10)
--)

--insert into sings
--values('להלהלה')

--insert into sings
--values(45)

--begin try
--insert into sings
--values(4)
--end try
--begin catch
--select('שים לב להכניס ערכים לפי טיפוס הנתונים')
--end catch
--select*from sings



----------------------left join המשתמש ב and  בon+ פרוצדורה---------------------------
go
create or alter procedure ovedcity
as
select o.FirstName+' '+o.LastName as ovedFullName,C.CityId
from oved o
left join City C on C.CityId=o.CityID
and C.CityId between 1 and 2
go

exec ovedcity


              ---------------------------order by---------------------------
	  -------------------------------מציג לפי סדר עולה של הקוד עיר--------------------
	
	  select* from costumer
	  order by cityID

	   -------------------------------מציג לפי סדר יורד של הקוד עיר--------------------
	  select* from costumer
	  order by cityID desc

	  


	  -------------------------end----------------------------------

	  