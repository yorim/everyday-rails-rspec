require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

client = Selenium::WebDriver::Remote::Http::Default.new
client.read_timeout = 120 #instead of the default 60

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  # capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: { args: %w[headless disable-gpu] })
  # Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :headless_chrome

