SELECT TOP (1000) [DateKey]
      ,[FullDateAlternateKey]
      ,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek]
      ,[SpanishDayNameOfWeek]
      ,[FrenchDayNameOfWeek]
      ,[DayNumberOfMonth]
      ,[DayNumberOfYear]
      ,[WeekNumberOfYear]
      ,[EnglishMonthName]
      ,[SpanishMonthName]
      ,[FrenchMonthName]
      ,[MonthNumberOfYear]
      ,[CalendarQuarter]
      ,[CalendarYear]
      ,[CalendarSemester]
      ,[FiscalQuarter]
      ,[FiscalYear]
      ,[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]

SELECT distinct CalendarYear
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  order by CalendarYear desc

 SELECT TOP (1000) [CustomerKey]
      ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[NameStyle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Suffix]
      ,[Gender]
      ,[EmailAddress]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[SpanishEducation]
      ,[FrenchEducation]
      ,[EnglishOccupation]
      ,[SpanishOccupation]
      ,[FrenchOccupation]
      ,[HouseOwnerFlag]
      ,[NumberCarsOwned]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer]

SELECT TOP (1000) [ProductKey]
      ,[ProductAlternateKey]
      ,[ProductSubcategoryKey]
      ,[WeightUnitMeasureCode]
      ,[SizeUnitMeasureCode]
      ,[EnglishProductName]
      ,[SpanishProductName]
      ,[FrenchProductName]
      ,[StandardCost]
      ,[FinishedGoodsFlag]
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[ListPrice]
      ,[Size]
      ,[SizeRange]
      ,[Weight]
      ,[DaysToManufacture]
      ,[ProductLine]
      ,[DealerPrice]
      ,[Class]
      ,[Style]
      ,[ModelName]
      ,[LargePhoto]
      ,[EnglishDescription]
      ,[FrenchDescription]
      ,[ChineseDescription]
      ,[ArabicDescription]
      ,[HebrewDescription]
      ,[ThaiDescription]
      ,[GermanDescription]
      ,[JapaneseDescription]
      ,[TurkishDescription]
      ,[StartDate]
      ,[EndDate]
      ,[Status]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct]

SELECT TOP (1000) [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[PromotionKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      ,[SalesOrderLineNumber]
      ,[RevisionNumber]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[UnitPriceDiscountPct]
      ,[DiscountAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[CarrierTrackingNumber]
      ,[CustomerPONumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]

  --Query to clean Date table, get abrv for months

 SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS DATE, 
  [EnglishDayNameOfWeek] AS DAY, 
  [WeekNumberOfYear] AS WEEKNOY, 
  [EnglishMonthName] AS MONTH, 
  --TO GET ONLY MONTH ABRREVIATION 
  LEFT([EnglishMonthName], 3) AS MONTHSHORT, 
  [MonthNumberOfYear] AS MONTHNOY, 
  [CalendarQuarter] AS QUARTER, 
  [CalendarYear] AS YEAR 
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
  WHERE [CalendarYear] >= 2019

 --Query to clean customer table, concate 1st nd 2nd name

SELECT 
  C.CustomerKey as customerkey, 
  C.FirstName as Firstname, 
  C.LastName as lastname, 
  -- combining fristname and lastname
  concat(FirstName, ' ', lastName) as [fullname], 
  --[Gender],
  case C.Gender when 'M' then 'Male' when 'F' then 'Female' end as gender, 
  C.DateFirstPurchase as DATEofPurchase, 
  D.City as customercity 
FROM 
  [AdventureWorksDW2019].dbo.DimCustomer as C 
  left join [AdventureWorksDW2019].dbo.DimGeography as D 
  on D.GeographyKey = C.GeographyKey
  order by C.Customerkey Asc

--Query to clean Product table also remove null and replace with outdated in status

SELECT 
  A.ProductKey as product_key, 
  A.ProductAlternateKey as product_alter_key,
  A.EnglishProductName as product_name,
  A.Color as colour,
  A.Size as size,
  A.ProductLine as product_line,
  A.ModelName as model_name,
  A.EnglishDescription as description,
  B.EnglishProductSubcategoryName as Product_subcategory, 
  C.EnglishProductcategoryName as product_category 
  , isnull(A.status, 'outdated') as Status
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] as A 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductSubcategory] as B
  on B.ProductSubcategoryKey = A.ProductSubcategoryKey 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductCategory] as C 
  on B.ProductCategoryKey = C.ProductCategoryKey
  order by product_key


  --query to clear internetsales table, also --date extraction as per user requirement ( the budget is for 2024 and we need 2 years back in time )



SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  [PromotionKey], 
  [CurrencyKey] --,[SalesTerritoryKey]
  --,[SalesOrderNumber]
  , 
  [SalesOrderLineNumber] --,[RevisionNumber]
  --,[OrderQuantity]
  --,[UnitPrice]
  --,[ExtendedAmount]
  --,[UnitPriceDiscountPct]
  --,[DiscountAmount]
  --,[ProductStandardCost]
  --,[TotalProductCost]
  , 
  [SalesAmount] --,[TaxAmt]
  --,[Freight]
  --,[CarrierTrackingNumber] 
  --,[CustomerPONumber]
  --,[OrderDate]
  --,[DueDate]
  --,[ShipDate]
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales]
  --date extraction as per user requirement ( the budget is for 2024 and we need 2 years back in time )
where left(OrderDateKey , 4) >= year(getdate()) -4
order by OrderDateKey asc

  

