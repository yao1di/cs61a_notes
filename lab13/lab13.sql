.read data.sql


CREATE TABLE bluedog AS
  SELECT color,pet FROM students WHERE color="blue" and pet="dog";

CREATE TABLE bluedog_songs AS
  SELECT color,pet,song FROM students WHERE color="blue" and pet="dog";


CREATE TABLE smallest_int_having AS
  SELECT time,smallest FROM students GROUP BY smallest HAVING count(smallest)=1;


CREATE TABLE matchmaker AS
  SELECT a.pet,b.song,a.color,b.color FROM students as a,students as b 
  WHERE a.pet=b.pet and a.song=b.song and a.time < b.time;


CREATE TABLE sevens AS
  SELECT a.seven FROM students as a,numbers AS number 
  WHERE number.'7' = "True" and a.time=number.time and a.number=7;


CREATE TABLE average_prices AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE lowest_prices AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE shopping_list AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE total_bandwidth AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

