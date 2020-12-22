# frozen_string_literal: false

# ---
require_relative 'helper.rb'

After do |scenario|
  # after each scenario it takes a print,
  # remove bars and change generic spaces
  # to blank space and removes:
  # commas
  # parentheses
  # and sharps
  scenario_name = scenario.name.gsub(/\s+/, ' ').tr('/', ' ')
  scenario_name = scenario_name.delete(',', '')
  scenario_name = scenario_name.delete('(', '')
  scenario_name = scenario_name.delete(')', '')
  scenario_name = scenario_name.delete('#', '')
  @helper = Helper.new
  # take screenshot if scenario fails,
  @helper.take_screenshot(scenario_name, 'scenario_failed') if scenario.failed?
  puts 'O cenário ' + scenario_name + ' foi finalizado!'
end
