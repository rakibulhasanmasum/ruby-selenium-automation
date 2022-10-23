# ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux-gnu]

# require "./api/bidding"
# require "./api/auth"
require "./api/requests"
require "./api/user"

require "selenium-webdriver"

options = {
    # args: ['disable-infobars', 'disable-gpu', 'privileged', 'ignore-certificate-errors', 'no-default-browser-check'],
    # args: ['user-data-dir=./user_data/', 'profile-directory=Profile 1'],
    args: ['user-data-dir=./user_data/'],
    w3c: true,
    mobileEmulation: {},
    prefs: {
        :protocol_handler => {
            :excluded_schemes => {
                tel: false,
            }
        }
    }
    # extensions: [ Base64.strict_encode64(File.open("../your_extension.crx", 'rb').read) ]
}

caps = Selenium::WebDriver::Chrome::Options.new(options: options)
service = Selenium::WebDriver::Service.chrome(path: './chromedriver')

driver = Selenium::WebDriver.for :chrome, service: service, options: caps

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

# el = driver.find_element(:xpath, '//button[text()="Fixed Price "]')
el = driver.find_element(:xpath, '//button[text()="Bidding "]')
el.click

sleep 1

el = driver.find_element(:id, "dateDropdown")
el.click

sleep 1

el = driver.find_element(:xpath, '//*[@id="trip-info-panel"]/app-trip-information/div[1]/div/app-date-time-selection/div/div/div/div[1]/app-bidding-date/div/div/div/div/ngb-datepicker/div[2]/div/ngb-datepicker-month/div[6]/div[2]/div')
el.click 

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