# frozen_string_literal: false

# ---
Dado('que eu acesso a {string} desejada') do |url|
  main_page.access_main_page(url)
end
  
Então('a {string} deverá ser apresentada') do |pagina_inicial|
  main_page.verify_main_url(pagina_inicial)
end

Dado('que eu acesse a página da VV Test') do
  main_page.navigate_to_main_page
end
