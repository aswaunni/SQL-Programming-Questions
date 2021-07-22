/*

A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

Input Format

The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.

*/

select round(LAT_N, 4) from STATION s where (select count(LAT_N) from STATION where s.LAT_N > LAT_N) = (select count(LAT_N) from STATION where s.LAT_N < LAT_N)
