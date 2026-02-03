/*
Problem 5: Top pharmaceutical companies using ranitidine

Objective:
Identify the top 3 companies that manufacture medicines
containing the substance 'ranitidine'.

Concepts Used:
- Text filtering using LIKE
- GROUP BY
- ORDER BY with LIMIT
*/
Select Companyname
from medicine
where lower(substanceName) like '%ranitidina%'
group by companyName
order by companyName desc
limit 3;