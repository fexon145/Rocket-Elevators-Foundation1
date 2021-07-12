select creation, count(quote_id) as quotepermonth 
from factquote
group by creation;