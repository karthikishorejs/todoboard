require "selenium/webdriver"

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1400,1000])
  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)
end

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless] }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: options)
end

Capybara.javascript_driver = :headless_chrome
Capybara.default_driver = :headless_chrome
