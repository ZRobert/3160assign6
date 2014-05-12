/*
Robert Payne
2/24/2013
ITCS-3160-001
HW#6
*******************************************/

Use AutoDealer3
Go

--Part I Problem 1.1
Create table SalesVisits(
	CustomerID	int	not null,
	SalesPersonID	int not null,
	VisitDate date not null,
	VisitID		int not null

	Constraint PK_VisitID Primary Key CLUSTERED(VisitID),
	Constraint FK_CustomerID Foreign Key(CustomerID) references Customers(ID) on delete No action,
	Constraint FK_SalesPersonID Foreign Key(SalesPersonID) references SalesPeople(ID) on delete No action
)

--Part 1 Problem 1.2
Create table SalesVisitInterests(
	VisitID int	not null,
	VehicleID char(15) not null,

	Constraint FK_VisitID Foreign Key(VisitID) references SalesVisits(VisitID),
	Constraint FK_VehiclesID Foreign Key(VehicleID) references Cars(VehicleID)
)

--Part 1 Problem 1.3
Create table CarSales(
	CustomerID int not null,
	SalesPersonID int not null,
	VehicleID char(15) not null,
	BankID char(9) not null,
	SalesDate date not null,
	Price decimal(8,2) not null

	Constraint FK_CS_CustomerID Foreign Key(CustomerID) references Customers(ID),
	Constraint FK__CS_SalesPersonID Foreign Key(SalesPersonID) references SalesPeople(ID),
	Constraint FK_VehicleID Foreign Key(VehicleID) references Cars(VehicleID),
	Constraint FK_BankID Foreign Key(BankID) references Banks(RoutingNumber),
	Constraint PK_VehicleID Primary Key Clustered(VehicleID)
)

--Part 1 Problem 2.1
--At least one visit per customerID
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(1, 1, '2-14-2013',1)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(2, 2, '2-15-2013',2)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(3, 3, '2-16-2013',3)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(4, 4, '2-17-2013',4)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(5, 1, '2-14-2013',5)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(6, 2, '2-15-2013',6)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(7, 3, '2-16-2013',7)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(8, 4, '2-17-2013',8)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(9, 1, '2-14-2013',9)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(10, 2, '2-15-2013',10)

--Part 1 Problem 2.2
--Multiple visits for 5 customers with the same salesperson
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(1, 1, '2-14-2013',11)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(2, 2, '2-16-2013',12)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(3, 3, '2-17-2013',13)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(4, 4, '2-16-2013',14)
Insert Into SalesVisits (CustomerID, SalesPersonID, VisitDate, VisitID)
Values(5, 1, '2-14-2013',15)

--Part 1 Problem 2.3
--For each sales visit, 1-3 cars of interest
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(1, 'ATL968LXW390R')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(1, 'ATN939EHX518P')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(2, 'BAD307HWL202L')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(2, 'FZM316GZL472R')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(3, 'IIL684DZK615B')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(3, 'KEQ147IOU683X')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(4, 'LDY979WTJ060K')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(5, 'JPE149FJA732O')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(6, 'ZYF684IPV746C')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(7, 'WZF772BDH141P')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(8, 'SZO056UYL283Y')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(9, 'QLT113IHU647S')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(10, 'PCS756ISI197O')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(11, 'MOO812GXL343T')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(12, 'NGU492HSI763G')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(13, 'LCG844FON360I')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(14, 'IUO393MFL917C')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(15, 'FZM316GZL472R')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(15, 'EBR160TJU474B')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(12, 'UOT863VSR817J')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(7, 'RQG635HYC165U')
Insert Into SalesVisitInterests (VisitID, VehicleID)
Values(9, 'XVV027IXQ600Z')

--Part 1 Problem 2.4
--Create car sales data with 6 purchases, each bank used, sales price greater than cost
Insert Into CarSales(CustomerID, SalesPersonID, VehicleID, BankID, SalesDate, Price)
Values(1, 1, 'ATL968LXW390R', '053000196', '2-18-2013', 32000.00)
Insert Into CarSales(CustomerID, SalesPersonID, VehicleID, BankID, SalesDate, Price)
Values(2, 2, 'FZM316GZL472R', '053112712', '2-18-2013', 32000.00)
Insert Into CarSales(CustomerID, SalesPersonID, VehicleID, BankID, SalesDate, Price)
Values(4, 4, 'LDY979WTJ060K', '055003492', '2-18-2013', 32000.00)
Insert Into CarSales(CustomerID, SalesPersonID, VehicleID, BankID, SalesDate, Price)
Values(5, 1, 'JPE149FJA732O', '053000196', '2-18-2013', 32000.00)
Insert Into CarSales(CustomerID, SalesPersonID, VehicleID, BankID, SalesDate, Price)
Values(8, 4, 'SZO056UYL283Y', '053112712', '2-18-2013', 32000.00)
Insert Into CarSales(CustomerID, SalesPersonID, VehicleID, BankID, SalesDate, Price)
Values(9, 1, 'XVV027IXQ600Z', '055003492', '2-18-2013', 32000.00)

--Part 2 Problem 1
Select VisitDate, [Sales Assoc.],Customers.FirstName + ' ' + Customers.LastName as [Customer Name]
From( 
	Select VisitDate, SalesPeople.FirstName + ' ' + SalesPeople.LastName as [Sales Assoc.], 
 CustomerID
	From SalesVisits join SalesPeople on SalesVisits.SalesPersonID = SalesPeople.ID
)as Table1 join Customers on Table1.CustomerID = Customers.ID
Order by VisitDate

--Part 2 Problem 2
--Display the number of Sales visits each SalesPerson had by date
Select VisitDate, T1.[Number of Visits], SalesPeople.FirstName + ' ' + SalesPeople.LastName as [Sales Assoc.]
From ( 
	Select Count(SalesPersonID) as [Number of Visits], SalesPersonID, VisitDate
	From SalesVisits
	Group by SalesPersonID, VisitDate
)as T1 join SalesPeople on T1.SalesPersonID = SalesPeople.ID

                                            
--Part 2 Problem 3
Select T3.FirstName + ' '+ T3.LastName as [Customer], T3.VisitDate, 
SalesPeople.FirstName + ' '+ SalesPeople.LastName as [Sales Person],
T3.Manufacturer, T3.Model, T3.Year, T3.Cost	 
From(
	Select *
	From(
		Select T1.VehicleID, VisitDate, CustomerID, Manufacturer, Model, Year, Cost, SalesPersonID
		From(
			Select VehicleID, CustomerID, VisitDate, SalesPersonID
			From SalesVisitInterests join SalesVisits on SalesVisitInterests.VisitID = SalesVisits.VisitID
		) as T1 join Cars on T1.VehicleID = Cars.VehicleID
	) as T2 join Customers on T2.CustomerID = Customers.ID
)as T3 join SalesPeople on T3.SalesPersonID = SalesPeople.ID

--Part 2 Problem 4
Select Banks.BankName, [Customer Name], VehicleID, Manufacturer, Model, Color, Year, Cost, Price, [Sales Person], SalesDate
From(	
	Select [Customer Name], BankID, Cars.VehicleID, Manufacturer, Model, Color, Year, Cost, Price, [Sales Person], SalesDate 
	From(	
		Select [Customer Name], BankID, SalesDate, Price, SalesPeople.FirstName + ' ' + SalesPeople.LastName as [Sales Person], VehicleID
		From(
			Select FirstName + ' ' + LastName as [Customer Name], BankID, SalesDate, Price, SalesPersonID, VehicleID
			From(	
				Select CustomerID, SalesPersonID, VehicleID, BankID, SalesDate, Price
					From CarSales join Banks on Carsales.BankID = Banks.RoutingNumber
			)as T1 join Customers on T1.CustomerID = Customers.ID

		)as T2 join SalesPeople on T2.SalesPersonID = SalesPeople.ID

	)as T3 join Cars on T3.VehicleID = Cars.VehicleID
)as T4 join Banks on T4.BankID = Banks.RoutingNumber

--Part 2 Problem 5
Select T1.[Number of Sales], SalesPeople.FirstName + ' ' + SalesPeople.LastName as [Sales Assoc.]
From ( 
	Select Count(SalesPersonID) as [Number of Sales], SalesPersonID
	From CarSales
	Group by SalesPersonID
)as T1 join SalesPeople on T1.SalesPersonID = SalesPeople.ID
Order by [Number of Sales] DESC

--Part 2 Problem 6
Select [Customer], BankName, SalesPeople.FirstName + ' ' + SalesPeople.LastName as [Sales Person], VehicleID, Model, Manufacturer, Cost, Price, SalesDate
From(
	Select [Customer], Banks.BankName as BankName, SalesPersonID, SalesDate, VehicleID, Cost, Model, Year, Manufacturer, Price
	From( 
		Select Customers.FirstName + ' ' + Customers.LastName as [Customer], BankID, SalesDate, SalesPersonID, VehicleID, Cost, Price , Model, Year, Manufacturer
		From(
			Select (T2.Price - T2.Cost) as [Profit], CustomerID, BankID, SalesDate, SalesPersonID, VehicleID, Cost, Model, Year, Manufacturer, Price
			From(
				Select Price, Cars.Cost, CarSales.VehicleID, CustomerID, SalesPersonID, BankID, SalesDate, Cars.Model, Cars.Year, Cars.Manufacturer
				From CarSales join Cars on CarSales.VehicleID = Cars.VehicleID
			)as T2
		Where (Price-Cost) in (
			Select Max(T1.Price - T1.Cost) as [Profit]
			From(
				Select Price, Cars.Cost, CarSales.VehicleID, CustomerID, SalesPersonID, BankID, SalesDate
				From CarSales join Cars on CarSales.VehicleID = Cars.VehicleID
			)as T1
			)
		)as T3 join Customers on T3.CustomerID = Customers.ID
	)as T4 join Banks on T4.BankID = Banks.RoutingNumber
)as T5 join SalesPeople on T5.SalesPersonID = SalesPeople.ID


