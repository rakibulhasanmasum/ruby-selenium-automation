# require "./api/bidding"
# require "./api/auth"
require "./api/requests"
require "./api/user"

require "selenium-webdriver"

options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized', 'user-data-dir=./user_data/'])
service = Selenium::WebDriver::Service.chrome(path: './chromedriver')

driver = Selenium::WebDriver.for :chrome, service: service, capabilities: options

driver.get(API_REQUESTS)

original_window = driver.window_handle

el = driver.find_element(:id, "create_new_trip")
el.click

sleep 1

el = driver.find_element(:name, "search_shipper")
el.send_keys API_USER_PHONE

el = driver.find_element(:id, "search_button")
el.click

sleep 1

el = driver.find_element(:id, "proceed")
el.click

sleep 1

# driver.get("https://n.trucklagbe.com/adev/trip_creation?shipperId=378526")

driver.window_handles.each do |handle|
    if handle != original_window
        driver.switch_to.window handle
        break
    end
end

el = driver.find_element(:xpath, "//input[@placeholder='Search Load Location']")
el.send_keys "maniknagar"

sleep 1

el = driver.find_element(:class, "suggestion")

p el

sleep 300
