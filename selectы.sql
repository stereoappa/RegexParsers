select Sum(Cost) from Журнал where Cost is not null

select Id, Memo, Cost from Журнал 
where --Memo --LIKE '%бесплатно%' and 
  cost is null
 and Memo not LIKE '%бесплатно%'
order by id desc

select Id, Memo, Cost from Журнал 
where --Memo --LIKE '%бесплатно%' and 
  cost is null
 and Memo  LIKE '%платно%' and Memo not like  '%бесплатно%'
order by id desc

select Id, Memo, Cost from Журнал 
where --Memo --LIKE '%бесплатно%' and 
 cost is null
 --and Memo not LIKE '%руб%'
 and (Memo  LIKE '%лпатно%'
  or Memo  LIKE '%патно%'
  or Memo  LIKE '%палтно%'
  or Memo  LIKE '%палтн%')
  --and Memo  like  '%бесплатно%' 
order by id desc

select id,memo,cost, dbo.GetCost(Memo) from Журнал Where dbo.GetCost(Memo) > 0
order by dbo.GetCost(Memo) desc

select id, memo, cost from Журнал where id = 7543 or id = 7453

 update Журнал set Cost = 1120 where id = 7597
 update Журнал set Cost = 10 where id = 10834
 update Журнал set Cost = 200 where id = 11003
 update Журнал set Cost = 11000 where id = 12278
 update Журнал set Cost = 7000 where id = 13936

  update Журнал set Cost = 1000 where id = 12660
    update Журнал set Cost = 1000 where id = 12438
	   update Журнал set Cost = 18000 where id = 12290
	   update Журнал set Cost = 1000 where id = 12289
	   update Журнал set Cost = 4000 where id = 12040
	   update Журнал set Cost = 100 where id = 13060

	   update Журнал set Cost = 5800 where id = 11175
	   update Журнал set Cost = 1610 where id = 11152

	   update Журнал set Cost = 1100 where id = 10803
	   update Журнал set Cost = 4500 where id = 10668
	   update Журнал set Cost = 1100 where id = 10549
	   update Журнал set Cost = 3500 where id = 10477
	   update Журнал set Cost = 2600 where id = 10094
	   update Журнал set Cost = 1400 where id = 9322
	   update Журнал set Cost = 1100 where id = 8595
	   update Журнал set Cost = 2900 where id = 8295
	   update Журнал set Cost = 200 where id = 8177
	   update Журнал set Cost = 1200 where id = 8167
	   update Журнал set Cost = 10 where id = 7622
	   update Журнал set Cost = 20 where id = 7561
	   update Журнал set Cost = 30 where id = 7543
	   update Журнал set Cost = 10 where id = 7453
	   update Журнал set Cost = 1500 where id = 7401
	   update Журнал set Cost = 2900 where id = 7382
	   update Журнал set Cost = 10 where id = 7219
	     update Журнал set Cost = 300 where id = 6928
		 update Журнал set Cost = 100 where id = 6147
		 update Журнал set Cost = 1300 where id = 6127
		 update Журнал set Cost = 700 where id = 6117
		 update Журнал set Cost = 5600 where id = 5879
		 update Журнал set Cost = 1300 where id = 5793
		 update Журнал set Cost = 2200 where id = 5786
		 update Журнал set Cost = 100 where id = 5743
		 update Журнал set Cost = 100 where id = 5728
		 update Журнал set Cost = 500 where id = 5724
		 update Журнал set Cost = 1800 where id = 5715
		 update Журнал set Cost = 2100 where id = 5579
		 update Журнал set Cost = 10 where id = 5432
		  update Журнал set Cost = 10 where id = 5424

		  update Журнал set 
		  Cost = 0
		  where 
		  Memo LIKE '%бесплатно%' and cost is null 

		  select id,memo,cost from Журнал where cost is null order by id desc

		  update Журнал set 
		  Cost = 0
		  where 
		 id = 353

		  select sum(cost) from Журнал where id >15030 and cost is not null

		 select id,memo,cost from Журнал where cost=45
