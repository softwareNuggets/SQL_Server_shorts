--YouTube: @SoftwareNuggets

use LearnSQL;


declare @random_name		VARCHAR(20);

SET @random_name = (
    SELECT TOP 1 fname
    FROM first_names
    WHERE gender = 'F'
    AND fname LIKE 'M%a%i%e%'
    ORDER BY NEWID()  -- Randomly order the result
);

select @random_name