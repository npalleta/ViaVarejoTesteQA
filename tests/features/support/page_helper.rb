# frozen_string_literal: false

# ---
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')]
  .each { |file| require file }

# ---
module Pages
  def main_page
    @main_page ||= MainPage.new
  end

  def survey_page
    @survey_page ||= SurveyPage.new
  end
end
