# frozen_string_literal: false

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require_relative 'page_helper.rb'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)

BROWSER = ENV['BROWSER']
ENVIRONMENT = ENV['ENVIRONMENT']

Capybara.register_driver :selenium do |app|
  # preferences = {
  #  'credentials_enable_service'        => false,
  #  'profile.password_manager_enabled'  => false
  # }
  # capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
  # capabilities['chromeOptions'] = { 'prefs' => preferences }

  chromedriver_path = File.join(File.absolute_path('./', File.dirname(__FILE__)),
                                '/drivers/chrome/chromedriver.exe')

  chrome_bin = File.join(File.absolute_path('D:/Program Files (x86)/Google/Chrome/Application', File.dirname(__FILE__)),
                         'chrome.exe')

  if BROWSER.eql?('chrome')
    service = Selenium::WebDriver::Chrome::Service.chrome(path: chromedriver_path)
    options = Selenium::WebDriver::Chrome::Options.new(
      options: { 'excludeSwitches' => %w[enable-automation load-extension] }
    )
    options.binary = chrome_bin
    # options.add_argument('--aggressive-cache-discard')
    options.add_argument('--disable-extensions')
    options.add_argument('--disable-extensions-file-access-check')
    options.add_argument('--disable-infobars')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--enable-application-cache')
    options.add_argument('--reduce-security-for-testing')

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      # desired_capabilities: capabilities,
      service: service,
      options: options
    )
  elsif BROWSER.eql?('chrome_linux')
    options = Selenium::WebDriver::Chrome::Options.new(
      options: { 'excludeSwitches' => %w[enable-automation load-extension] }
    )
    options.add_argument('--disable-extensions')
    options.add_argument('--disable-extensions-file-access-check')
    options.add_argument('--disable-infobars')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--enable-application-cache')
    options.add_argument('--reduce-security-for-testing')

    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options
    )
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      marionette: true
    )
  end
end
