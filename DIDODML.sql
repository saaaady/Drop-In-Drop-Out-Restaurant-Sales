--Total number of transactions
select count(*) as total__number_of_transactions
from dido;


--Total number days of sales
SELECT COUNT(DISTINCT txndate) AS total_number_of_Days_sales
FROM dido;


--Total number of items sold based on rank of individual
SELECT ranking, SUM( doughnut + plainbrownie + moltenlava + chickenbread + chickenpatties + pastry + cardamomtea + coffee + chickenpizzal
        + cheesepizzal + zingerburger + chickenburger + chickenpiece + chickenparatharoll + frenchfries + pizzam + pizzas + shawarma)
        AS total_items_sold_by_rank
FROM dido
group by ranking
order by total_items_sold_by_rank desc;


--Average items per transaction
SELECT avg( doughnut + plainbrownie + moltenlava + chickenbread + chickenpatties + pastry + cardamomtea + coffee + chickenpizzal
        + cheesepizzal + zingerburger + chickenburger + chickenpiece + chickenparatharoll + frenchfries + pizzam + pizzas + shawarma)
        AS average_items_sold_per_txn
FROM dido;


--Dates with most items sold ordered in descending order
SELECT txndate , SUM( doughnut + plainbrownie + moltenlava + chickenbread + chickenpatties + pastry + cardamomtea + coffee + chickenpizzal
        + cheesepizzal + zingerburger + chickenburger + chickenpiece + chickenparatharoll + frenchfries + pizzam + pizzas + shawarma)
        AS total_items_sold
FROM dido
group by txndate 
order by total_items_sold desc;


--Top 8 items sold
SELECT item, total_number_of_items_sold
FROM
(
    SELECT 'doughnut'      AS item, SUM(doughnut)      AS total_number_of_items_sold FROM dido
    UNION ALL SELECT 'plainbrownie',SUM(plainbrownie) FROM dido
    UNION ALL SELECT 'moltenlava',SUM(moltenlava) FROM dido
    UNION ALL SELECT 'chickenbread',SUM(chickenbread) FROM dido
    UNION ALL SELECT 'chickenpatti', UM(chickenpatties) FROM dido
    UNION ALL SELECT 'pastry',SUM(pastry) FROM dido
    UNION ALL SELECT 'cardamomte',SUM(cardamomtea) FROM dido
    UNION ALL SELECT 'coffee',SUM(coffee) FROM dido
    UNION ALL SELECT 'chickenpizza',SUM(chickenpizzal) FROM dido
    UNION ALL SELECT 'cheesepizzal',SUM(cheesepizzal) FROM dido
    UNION ALL SELECT 'zingerburger',SUM(zingerburger) FROM dido
    UNION ALL SELECT 'chickenburger',SUM(chickenburger) FROM dido
    UNION ALL SELECT 'chickenpiece',SUM(chickenpiece) FROM dido
    UNION ALL SELECT 'chickenparal',SUM(chickenparatharoll) FROM dido
    UNION ALL SELECT 'frenchfries',SUM(frenchfries) FROM dido
    UNION ALL SELECT 'pizzam',SUM(pizzam) FROM dido
    UNION ALL SELECT 'pizzas',SUM(pizzas) FROM dido
    UNION ALL SELECT 'shawarma',SUM(shawarma) FROM dido
) AS items
ORDER BY total_number_of_items_sold DESC
LIMIT 8;



