from simple_get import simple_get
from bs4 import BeautifulSoup

raw_html = simple_get('https://classifieds.ksl.com')
html = BeautifulSoup(raw_html, 'html.parser')
new_items = html.find_all('div', class_="page-wrap")

print(new_items)