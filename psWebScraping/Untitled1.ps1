clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.32/toBeScraped.html

#Get a count of links in the page
#$scraped_page.Links.Count

#Display links as HTML Element
#$scraped_page.Links

#Display only URL and its text
$scraped_page.Links | Select-Object outerText, href