import re
import json
from selenium_get import simple_get
from bs4 import BeautifulSoup

get_first_page_listings = simple_get('https://classifieds.ksl.com')

regex = r"""window.homepage.newestListingsData.listings\s=\s(\[{[^\]]+\"}\]);"""
flags = 0
listings = re.compile(regex, flags).findall(get_first_page_listings)
listings = listings[0]
listings = json.loads(listings)

get_listing_details = simple_get('https://classifieds.ksl.com/listing/' + str(listings[0]['id']))

regex = r"""window.detailPage.listingData\s=\s({[\w\W]+});\n?window.detailPage.sellerData\s=\s({[\w\W]+});\n?""" #Needs updating
details = re.compile(regex, flags).findall(get_listing_details)
listing_details = details[0]
listing_details = json.loads(listing_details)
print(listing_details)

seller_details = details[1]
seller_details = json.loads(seller_details)
print(seller_details)