# frozen_string_literal: false

# ---
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')]
  .each { |file| require file }

# ---
module Pages
  def main_page
    @main_page ||= MainPage.new
  end

  def create_account_page
    @create_account_page ||= CreateAccountPage.new
  end
end
