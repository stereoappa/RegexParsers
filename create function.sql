CREATE FUNCTION GetNumRazresh(@numRazresh NVARCHAR(256))
RETURNS nvarchar(700)
AS
EXTERNAL NAME Parsers.[RegexParsers.Parsers].ParserValya

sp_configure 'clr enabled', 1
reconfigure

select Id, memo, cost, dbo.GetCost(memo) as CostPARSER
from ������
where --cost is null 
--and 
memo is not null 
and id < 10000
and dbo.GetCost(memo) >0
--and 
--and id = 11766
and Memo not  like '%���������%'
--and Memo not like '���'
order by ID desc

select memo 
from  ������ 
where  id>8000 and id<8100 ;

update ������ 
set Cost = dbo.GetCost(Memo)
where cost is null and
--Memo is not null and
dbo.GetCost(Memo) > 0
-- id>8000 and id<8100 
-- and Memo is not null
;
 --and dbo.GetCost(������.Memo) > 0

 update ������ set Cost = 1120 where id = 7597
  update ������ set Cost = 10 where id = 10834
  update ������ set Cost = 200 where id = 11003

declare @i int = 0;
while @i <200 
begin
update ������ 
set Cost = dbo.GetCost((Select Memo from ������ where id = @i))
where  id=@i --and dbo.GetCost(������.Memo) > 0 
--and Cost is null
set @i = @i+1
end;
go;
select *
from ������
where Memo is null;