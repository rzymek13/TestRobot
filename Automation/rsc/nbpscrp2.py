import requests
from bs4 import BeautifulSoup
from robot.api.deco import keyword

@keyword(name="Find Euro Currency")
def find_curr_value(webpage_content: str):
    url = "https://www.nbp.pl/home.aspx?f=/kursy/kursya.html"
    result = requests.get(url).text
    doc = BeautifulSoup(result, "html.parser")

    page_text = doc.find_all(class_="right")
    value=page_text[15]
    valueee = str(value)
    curr = valueee[18:24]
    currr = float(curr.replace(",","."))
    return currr

