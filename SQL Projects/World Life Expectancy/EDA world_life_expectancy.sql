# World Life Expectancy Project (Exploratory Data Analysis)

SELECT *
FROM world_life_expectancy;

SELECT country, MIN(`Life expectancy`), MAX(`Life expectancy`), ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`), 1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY country
HAVING MAX(`Life expectancy`) <> 0 
AND MIN(`Life expectancy`) <> 0
ORDER BY Life_Increase_15_Years DESC;


SELECT year, ROUND(AVG(`Life expectancy`), 2)
FROM world_life_expectancy
GROUP BY year
ORDER BY year;

SELECT country, ROUND(AVG(`Life expectancy`), 1) AS Life_exp, ROUND(AVG(GDP), 1) AS GDP
FROM world_life_expectancy
GROUP BY country
HAVING Life_exp > 0
AND GDP > 0
ORDER BY GDP ASC;


SELECT country, ROUND(AVG(`Life expectancy`), 1) AS Life_exp, ROUND(AVG(GDP), 1) AS GDP
FROM world_life_expectancy
GROUP BY country
HAVING Life_exp > 0
AND GDP > 0
ORDER BY GDP ASC;

