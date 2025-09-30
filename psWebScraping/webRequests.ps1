clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.32/toBeScraped.html

#Get a count of links in the page
#$scraped_page.Links.Count

#Display links as HTML Element
#$scraped_page.Links

#Display only URL and its text
#$scraped_page.Links | Select-Object outerText, href

#Get outer text of every element with the tag h2
#$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select-Object outerText
#$h2s

#Print innerText of every div element that has the class "div-1"
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where {
$_.getAttributeNode("class").Value -ilike "div-1"} | select innerText
$divs1