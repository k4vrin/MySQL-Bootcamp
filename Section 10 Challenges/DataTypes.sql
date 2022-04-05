# What's good use for char?
# Country or state Abbreviations

# CREATE TABLE inventory (
#     item_name ____________,  VARCHAR(100)
#     price ________________,  DECIMAL(9, 3)
#     quantity _____________   INT
# );

# What's the difference between
# DATETIME and TIMESTAMP?
# TIMESTAMP has limits in range

SELECT CURRENT_TIME ;
SELECT CURTIME();


SELECT CURRENT_DATE;
SELECT CURDATE();

SELECT DAYOFWEEK(NOW());

SELECT DAYNAME(NOW());

SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');

CREATE TABLE tweets(
    content VARCHAR(140),
    Username VARCHAR(20),
    time_created TIMESTAMP DEFAULT NOW()
);
