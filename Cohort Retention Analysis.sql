-- total records: 541,909
SELECT [InvoiceNo]
      ,[StockCode]
      ,[Description]
      ,[Quantity]
      ,[InvoiceDate]
      ,[UnitPrice]
      ,[CustomerID]
      ,[Country]
  FROM [Retail].[dbo].[Online_Retail]

-- cleaning data
-- exclude null customerID and negative/zero unit price and quantity
-- exclude duplicate records

with online_retail2 as
(
	select *
	from [Retail].[dbo].[Online_Retail]
	where CustomerID is not null
	and Quantity >= 0 and UnitPrice > 0
),

dup_check as
(
	select *, ROW_NUMBER() over (partition by InvoiceNo, StockCode, Quantity order by InvoiceDate) as dup_flag
	from online_retail2
)

-- 392,669 clean records
-- create a temp table
select *
into #online_retail_main
from dup_check
where dup_flag=1

-- cohort analysis
select 
	customerID,
	min(InvoiceDate) as first_purchase_date,
	datefromparts(year(min(invoicedate)), month(min(invoicedate)), 1) as cohort_date
into #cohort
from #online_retail_main
group by customerid

-- create cohort index
with cohort_analysis1 as
(
	select
		m.*,
		c.cohort_date,
		year(m.invoicedate) as invoice_year,
		month(m.invoicedate) as invoice_month,
		year(c.cohort_date) as cohort_year,
		month(c.cohort_date) as cohort_month
	from #online_retail_main m
	left join #cohort c
	on m.customerID = c.customerid
),

cohort_analysis2 as
(
	select 
		*,
		year_diff = invoice_year - cohort_year,
		month_diff = invoice_month - cohort_month
	from cohort_analysis1
)

select 
	*,
	cohort_index = year_diff * 12 + month_diff
into #cohort_retention
from cohort_analysis2

select *
from #cohort_retention

-- pivot data to see the cohort table
select *
into #cohort_pivot
from
(
	select distinct
		customerID,
		cohort_date,
		cohort_index
	from #cohort_retention
) cohort_table
pivot(
	count(customerID) 
	for cohort_index in
	([0],[1],[2],[3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
) as pivot_table

select *
from #cohort_pivot
order by cohort_date

-- calculate cohort retention rate
select Cohort_Date ,
	[0] * 100.0 /[0] as [0], 
	[1] * 100.0 /[0] as [1], 
    [2] * 100.0 /[0] as [2], 
    [3] * 100.0 /[0] as [3],  
    [4] * 100.0 /[0] as [4],  
    [5] * 100.0 /[0] as [5], 
    [6] * 100.0 /[0] as [6], 
    [7] * 100.0 /[0] as [7], 
	[8] * 100.0 /[0] as [8], 
    [9] * 100.0 /[0] as [9], 
    [10] * 100.0 /[0] as [10],   
    [11] * 100.0 /[0] as [11],  
    [12] * 100.0 /[0] as [12]
from #cohort_pivot
order by cohort_date

