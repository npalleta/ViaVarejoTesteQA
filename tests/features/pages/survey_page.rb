# frozen_string_literal: false

require 'rspec'
require 'site_prism'

# --- create_account_page.rb
class SurveyPage < SitePrism::Page
  include RSpec::Matchers

  elements :text_areas, :xpath, '//textarea'
  elements :paragraphs, :xpath, '//p'

  def click_on_a_link_pesquisa_qa
    Utils.get_element_click_on_value('a', 'Pesquisa – QA')
  end

  def fill_first_name_textbox
    Utils.get_element_in_list_and_fill_by_type('text', '0', 'Niky')
  end

  def fill_last_name_textbox
    Utils.get_element_in_list_and_fill_by_type('text', '1', 'Palleta Moura Lima')
  end

  def fill_email_address_textbox
    Utils.get_element_in_list_and_fill_by_type('email', '0', 'palleta.sp@gmail.com')
  end

  def fill_confirmation_email_address_textbox
    Utils.get_element_in_list_and_fill_by_type('text', '2', 'palleta.sp@gmail.com')
  end

  def fill_phone_number_textbox
    Utils.get_element_in_list_and_fill_by_type('tel', '0', '11968745553')
  end

  def select_age_radio_button
    Utils.click_on_input_by_index('radio', '1')
  end

  def select_option_how_long_as_qa
    Utils.get_element_click_on_value('option', 'mais de 5 anos')
  end

  def select_why_qa_area
    Utils.get_element_click_on_value('option', 'Sou mega chato')
  end

  def select_skill_radio_button
    Utils.click_on_input_by_index('radio', '4')
  end

  def fill_language_to_learn_textbox
    Utils.get_element_in_list_and_fill_by_type('text', '3', 'Kotlin, Rust e continuar me aperfeiçoando nas que conheço.')
  end

  def fill_career_summary_textarea
    Utils.fill_element_in_list_by_index(text_areas, 0, 'Se tudo caminhar bem, tenho vontade de seguir a carreira com Head ou Tech Lead de QA.
Estou lendo sobre liderança e organização de equipes, 
gestão de entregas e procuro acompanhar o mercado no que diz respeito a inovação e demanda de mercado.')
  end

  def click_register_sbmt_button
    Utils.get_element_in_list_click_on_value_by_prop('value', '0', 'Enviar')
  end

  def validate_success_page
    expect(Capybara.page).to have_content('Your form has been successfully submitted.')
  end
end
