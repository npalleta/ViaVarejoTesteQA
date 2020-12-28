# frozen_string_literal: false

require 'yaml'

# ---
class Settings
  def self.configure_environment_path
    yaml_file_path   = "/config/#{ENVIRONMENT}.yaml"
    environment_path = YAML.load_file(File.dirname(__FILE__) + yaml_file_path)
    environment_path
  end

  def self.generate_configurations
    config = configure_environment_path

    Capybara.configure do |config|
      config.default_driver = :selenium
    end

    Capybara.default_max_wait_time = 10
    Capybara.current_session.driver.browser.manage.window.maximize
    config
  end

  def self.get_url(url_key, path)
    "#{generate_configurations[url_key]}/#{path}"
  end
end
