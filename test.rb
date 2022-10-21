require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized', 'user-data-dir=./foo/'])
service = Selenium::WebDriver::Service.chrome(path: './chromedriver')

driver = Selenium::WebDriver.for :chrome, service: service, capabilities: options

driver.get("https://n.trucklagbe.com/atest/login")