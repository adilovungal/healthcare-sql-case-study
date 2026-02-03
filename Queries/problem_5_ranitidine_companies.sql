Select Companyname
from medicine
where lower(substanceName) like '%ranitidina%'
group by companyName
order by companyName desc
limit 3;