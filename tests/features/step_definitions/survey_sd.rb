# frozen_string_literal: false

# ---
Dado('depois eu vá para o menu Pesquisa - QA') do
  survey_page.click_on_a_link_pesquisa_qa
end

Quando('eu preencher todos os campos obrigatórios') do
  survey_page.fill_first_name_textbox
  survey_page.fill_last_name_textbox
  survey_page.fill_email_address_textbox
  survey_page.fill_confirmation_email_address_textbox
  survey_page.fill_phone_number_textbox
  survey_page.select_age_radio_button
  survey_page.select_option_how_long_as_qa
  survey_page.select_why_qa_area
  survey_page.select_skill_radio_button
  survey_page.fill_language_to_learn_textbox
  survey_page.fill_career_summary_textarea
  survey_page.click_register_sbmt_button
end

Então('deverei ser direcionado para uma página de sucesso') do
  survey_page.validate_success_page
  sleep 20
end
