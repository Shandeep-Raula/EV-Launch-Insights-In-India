SELECT maker, SUM(electric_vehicles_sold) AS Total_EV_Sold
FROM maker 
GROUP BY maker 
ORDER BY Total_EV_Sold DESC
LIMIT 5;


SELECT EXTRACT(YEAR FROM date) AS Year, SUM(electric_vehicles_sold) AS Total_EV_Sold
FROM maker 
GROUP BY EXTRACT(YEAR FROM date)
ORDER BY EXTRACT(YEAR FROM date);



SELECT 
    EXTRACT(YEAR FROM date) AS Year, 
    SUM(electric_vehicles_sold) AS Total_EV_Sold, 
    LAG(SUM(electric_vehicles_sold)) OVER(ORDER BY EXTRACT(YEAR FROM date)) AS Previous_Year_EV_Sold,
    ROUND((SUM(electric_vehicles_sold) - LAG(SUM(electric_vehicles_sold)) OVER(ORDER BY EXTRACT(YEAR FROM date))) / 
    LAG(SUM(electric_vehicles_sold)) OVER(ORDER BY EXTRACT(YEAR FROM date)) * 100,3) AS Year_Over_Year_Growth_Percentage
FROM 
    maker 
GROUP BY 
    EXTRACT(YEAR FROM date)
ORDER BY 
    EXTRACT(YEAR FROM date);
