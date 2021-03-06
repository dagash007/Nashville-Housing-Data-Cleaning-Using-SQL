--cleaning the data
select *
from PortfolioProject..HouseNashville

alter table HouseNashville
add ConvertedSalesDate date

update HouseNashville
set ConvertedSalesDate = CONVERT(date,SaleDate)

--------------------------------------------------------------------------------------------------
--Populate Property Address Data

select *
from PortfolioProject..HouseNashville
where PropertyAddress is null
order by ParcelID

select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,ISNULL(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..HouseNashville a
join PortfolioProject..HouseNashville b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..HouseNashville a
join PortfolioProject..HouseNashville b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

----------------------------------------------------------------------------------------
--Breaking Address into individual columns
