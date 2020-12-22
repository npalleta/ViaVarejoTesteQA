  # encoding: utf-8
  # language: pt
  
  Funcionalidade: Acessando a URL da Página da Pesquisa QA
  
  - Eu, como usuário, gostaria de acessar a página inicial da Página da Pesquisa QA
  
  @CT_000_A
  Esquema do Cenário: Acessar a URL da Página da Pesquisa QA
  Dado que eu acesso a <pagina> desejada
  Então a <pagina_inicial> deverá ser apresentada
  Exemplos:
      | pagina | pagina_inicial                              | 
      | "/"    | "http://www.lourencodemonaco.com.br/vvtest" | 
  
  @CT_000_B
  Cenário: Acessar a URL principal da Página da Pesquisa QA - Via Varejo
  Dado que eu acesse a página da VV Test