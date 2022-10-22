# require "./api/bidding"
# require "./api/auth"
require "./api/requests"

require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized', 'user-data-dir=./user_data/'])
service = Selenium::WebDriver::Service.chrome(path: './chromedriver')

driver = Selenium::WebDriver.for :chrome, service: service, capabilities: options

driver.get(API_REQUESTS)
sleep 300