import re
import json
import demjson
from selenium_get import simple_get
from bs4 import BeautifulSoup

get_first_page_listings = simple_get('https://classifieds.ksl.com')

listings_regex = r"""window.homepage.newestListingsData.listings\s=\s(\[{[^\]]+\"}\]);"""
flags = 0
listings = re.compile(listings_regex, flags).findall(get_first_page_listings)
if isinstance(listings, list):
    listings = listings[0]
listings = demjson.decode(listings)
# print(json.dumps(listings, sort_keys=True, indent=4)) # pretty prints as array of json objects

get_listing_details = simple_get('https://classifieds.ksl.com/listing/' + str(listings[0]['id']))

detail_data_regex = r"""window\.detailPage\.listingData\s=\s({[\s\w:\w\s,\[\]{}\\\/\'\"\.-]*);"""
seller_data_regex = r"""window\.detailPage\.sellerData\s=\s({[\s\w:\w\s,\[\]{}\\\/\'\"\.-]*);"""

# TODO: Set up one regex to work with both data for faster matching
# detail_page_regex = r"""window\.detailPage\.listingData\s=\s({[\s\w:\w\s,\[\]{}\\\/\'\"\.-]*);\s*window\.detailPage\.sellerData\s=\s({[\s\w:\w\s,\[\]{}\\\/\'\"\.-]*);"""

listing_data = re.compile(detail_data_regex, flags).findall(get_listing_details) # match listing data
if isinstance(listing_data, list):
    listing_data = listing_data[0]
listing_data = re.sub(r'\s+',' ', listing_data) # remove leading spaces and \n
listing_data = demjson.decode(listing_data) # convert to json object
# print(json.dumps(listing_data, sort_keys=True, indent=4)) # pretty prints as array of json objects


seller_data = re.compile(seller_data_regex, flags).findall(get_listing_details) # match listing data
if isinstance(seller_data, list):
    seller_data = seller_data[0]
seller_data = re.sub(r'\s+',' ', seller_data) # remove leading spaces and \n
seller_data = demjson.decode(seller_data) # convert to json object
# print(json.dumps(seller_data, sort_keys=True, indent=4)) # pretty prints as array of json objects