
# frozen_string_literal: false

require 'rspec'
require 'site_prism'

# --- main_page.rb
class MainPage < SitePrism::Page
  include RSpec::Matchers

  @@main_url = 'url'

  def access_main_page(url_path)
    visit(Settings.get_url(@@main_url, url_path))
  end

  def verify_main_url(url_path)
    expect(URI.parse(current_url).to_s).to include(url_path)
  end

  def navigate_to_main_page
    visit(Settings.get_url(@@main_url, '/'))
    expect(Capybara.page).to have_title 'VV Test – Página de teste da Via Varejo'
  end
end
