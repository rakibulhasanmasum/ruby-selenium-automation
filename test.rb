require "selenium-webdriver"

service = Selenium::WebDriver::Service.chrome(path: '/Users/r_hasan/Downloads/chromedriver')
driver = Selenium::WebDriver.for :chrome, service: service

driver.get("https://facebook.com")