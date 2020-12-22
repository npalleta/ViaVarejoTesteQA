  # encoding: utf-8
  # language: pt
  
  @CT_001_A
  Funcionalidade: Pesquisa com o QA
  
  - Como um recrutador
  - Quero colher dados da pesquisa 
  - Para fazer análises mais detalhadas do QA

  Contexto:
    Dado que eu acesse a página da VV Test
    
  Cenário: Preencher pesquisa com dados obrigatórios válidos
  E depois eu vá para o menu Pesquisa - QA
  Quando eu preencher todos os campos obrigatórios 
  Então deverei ser direcionado para uma página de sucesso