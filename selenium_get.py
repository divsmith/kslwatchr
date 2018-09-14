from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import os

def simple_get(url):
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--window-size=1920x1080")
    chrome_driver = os.getcwd() + ("/chromedriver.exe" if os.name == 'nt' else "/chromedriver")
    
    driver = webdriver.Chrome(chrome_options=chrome_options, executable_path=chrome_driver)

    driver.get(url)
    
    raw_html = driver.execute_script("return document.body.innerHTML")

    return raw_html