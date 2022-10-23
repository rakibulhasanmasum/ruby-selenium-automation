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

# el = driver.find_element(:class, "suggestion")

el = driver.find_element(:css => ".suggestion > div:nth-child(1)")
el.click

sleep 1

el = driver.find_element(:xpath, "//input[@placeholder='Search Unload Location']")
el.send_keys "kasba"

sleep 1

el = driver.find_element(:css => ".suggestion-item:first-of-type .title")
el.click

sleep 1

el = driver.find_element(:class, "blue-btn")
el.click

sleep 1

el = driver.find_element(:class, "blue-btn")
el.click

sleep 1

el = driver.find_element(:id, "truckCategoryDropdown")
el.click

sleep 1

el = driver.find_element(:css, ".ton-body-top > button:nth-child(1)")
el.click

sleep 1

el = driver.find_element(:css, ".feet-body-top > button:nth-child(1)")
el.click

sleep 1

el = driver.find_element(:css, ".trailer-shape-type-body > button:nth-child(1)")
el.click

sleep 1

el = driver.find_element(:id, "apply")
el.click

sleep 1

el = driver.find_element(:xpath, '//button[text()="Bidding "]')
el.click

sleep 1

el = driver.find_element(:id, "dateDropdown")
el.click

sleep 1

el = driver.find_elements(:css, '.btn-light')
el.each do |item|
    if item.text == "25"
        item.click
    end
end

sleep 1

el = driver.find_element(:css => 'select option[value="02:00:00"]')
el.click 

sleep 1

el = driver.find_element(:id, 'product_details')
el.send_keys "test automation"

sleep 1

el = driver.find_element(:css => '[formcontrolname="isCashTrip"]')
el.click

sleep 1

el = driver.find_element(:xpath, '//button[text()="PUBLISH TRIP "]')
el.click

sleep 5

# sleep 300
