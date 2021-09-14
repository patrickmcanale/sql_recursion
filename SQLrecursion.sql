-- Define the CTE
WITH counting_numbers AS ( 
	SELECT 
  		-- Initialize number
  		1 AS number
  	UNION ALL 
  	SELECT 
  		-- Increment number by 1
  		number + 1 
  	FROM counting_numbers
	-- Set the termination condition
  	WHERE number < 50)
    
SELECT number
FROM counting_numbers;


-- Define the CTE calculate_potencies with the fields step and result
WITH calculate_potencies (step, result) AS (
    SELECT 
  		-- Initialize step and result
  		1,
  		1
    UNION ALL
    SELECT 
  		step + 1,
  		-- Add the POWER calculation to the result  
  		result + POWER(step + 1, step + 1)
    FROM calculate_potencies
    WHERE step < 9)
    
SELECT 
	step, 
    result
FROM calculate_potencies;


WITH alphabet AS (
	SELECT 
  		-- Initialize letter to A
	    65 AS number_of_letter
	-- Statement to combine the anchor and the recursive query
  	UNION ALL
	SELECT 
  		-- Add 1 each iteration
	    number_of_letter + 1
  	-- Select from the defined CTE alphabet
	FROM alphabet
  	-- Limit the alphabet to A-Z
  	WHERE number_of_letter < 90)

SELECT char(number_of_letter)
FROM alphabet;


WITH time_series AS (
	SELECT 
  		-- Get the current time
	    GETDATE() AS time
  	UNION ALL
	SELECT 
	    DATEADD(day, 1, time)
  	-- Call the CTE recursively
	FROM time_series
  	-- Limit the time series to 1 year minus 1 (365 days -1)
  	WHERE time < GETDATE() + 364)
    
SELECT time
FROM time_series
-- Increase the number of iterations (365 days)
OPTION(MAXRECURSION 365)