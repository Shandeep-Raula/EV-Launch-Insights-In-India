SELECT maker, SUM(electric_vehicles_sold) AS Total_EV_Sold
FROM maker 
GROUP BY maker 
ORDER BY Total_EV_Sold DESC
LIMIT 5;

SELECT EXTRACT(YEAR FROM date) AS Year, SUM(electric_vehicles_sold) AS Total_EV_Sold
FROM maker 
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY EXTRACT(YEAR FROM date);