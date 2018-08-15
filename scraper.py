from selenium_get import simple_get
from bs4 import BeautifulSoup

raw_html = simple_get('https://classifieds.ksl.com')
html = BeautifulSoup(raw_html, 'html.parser')
new_items = html.find_all(class_="newestListings-listingTitle")

print(new_items)