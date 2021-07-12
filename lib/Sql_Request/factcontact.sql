select creationdate, count(contactid) as contactpermonth 
from factcontact
group by creationdate;