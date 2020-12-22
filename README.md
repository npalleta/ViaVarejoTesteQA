# ViaVarejoTesteQA
Teste para a posição de QA na Via Varejo

## Automação utilizando:

* capybara
* chromedriver-helper
* cucumber', '~> 3.2'
* fivemat
* geckodriver-helper
* rcodetools
* rspec
* rubocop
* selenium-webdriver
* site_prism

## Desafio

Escolha a linguagem de programação de sua preferência para automatizar o fluxo abaixo:  

Funcionalidade: Pesquisa com o QA <br />
Como um recrutador <br />
Quero colher dados da pesquisa 
Para fazer análises mais detalhadas do QA <br />
Link: https://bit.ly/3jOMrR9 <br />

Cenário: Preencher pesquisa com dados obrigatórios válidos <br />
Dado que eu acesse a página da VV Test <br />
E acesse o menu "Pesquisa QA" <br />
Quando eu preencher todos os campos obrigatórios <br />
Então deve ser direcionado para uma página de sucesso <br />
Instruções: Após desenvolver a automação, suba o projeto no GitHub (público), COPIE e COLE o link aqui. <br />

DICAS ÚTEIS: <br />
1 - Reserve um tempo para fazer a automação, pois boas práticas serão consideradas. <br />
2 - Primeiramente, crie o repositório e já cole aqui para não correr o risco de sua internet ficar instável e perder a sessão. <br />
3 - Após salvar o repositório do github aqui, salve a questão e guarde o link final. Este link será enviado para o recrutador. <br />
4 - Qualquer problema entre em contato com o recrutador. Nosso time estará a disposição para tirar dúvidas. <br />

Boa sorte!!!

## Sobre o Código

Aqui explicarei sobre o padrão adotado para o desenvolvimento. Também abordarei sobre as gems utilizadas.

Bem, já conhecendo a estrutura e como o desafio pedia, foi adotado o padrão de Page Object e o conteúdo das pastas estão dispostos da seguinte forma:

- Na pasta **pages** nós temos as classes responsáveis por agrupar os elementos de página e suas ações como por exemplo:

```
element :button, 'button[name="btnClickHere"]'

def do_something
  button.click
end
```

- Na pasta **step_definitions** nós temos o *Cucumber*, responsável por intermediar a comunicação entre a especificação e as pages (páginas).

Exemplo:

```
Dado('que eu clico no botão da página') do
  --faz alguma coisa--
end
```

- E na pasta **specs** nós temos o *Gherkin*, que nada mais é que nosso *BDD*, ou seja, o que vai traduzir nosso código / lógica em especificação.

Exemplo:

```
Funcionalidade: Validar se o botão apresentado na página funciona

Cenário: Validar o clique do botão da página
  Dado que eu clico no botão da página
  Então ele deverá responder ao estímulo
```

- Na pasta **support** temos alguns arquivos que também são importantes:
- O **env.rb** tem como papel ajustar o relatório e utilizando o *Capybara*, configurar os navegadores que serão utilizados no projeto;
- O **helper.rb** é a classe responsável por organizar alguns facilitadores. No caso desse projeto, ela contém um método para *gerar evidências em .png*;
- O **hooks.rb** possui funções capazes de executar algo antes ou depois de um cenário ou funcionalidade, pode possuir 2 funções pré-estabelecidas que são o *Before* e o *After*;
- O **page_helper** é um gerenciador de *pages*, basicamente a sua responsabilidade é tornar esses objetos globais, para que possam ser usados sem que necessitemos criar novas instância demasiadamente;
- O **settings** é uma classe que está responsável por configurar as *urls* e *uris* e inicializar a instância do navegador. Foi criada com o intuito de diminuir a reescrita para essas configurações acima referidas... A idéia também é diminuir a criação de instâncias utilizando-se do objeto diretamente.

### Falando sobre as GEMS

Vou deixar aqui uma breve explicação sobre as gems adotadas nesse projeto:

- __capybara__
       - Basicamente é uma implementação do Selenium para Ruby, nosso motor para testes ponta-a-ponta.

- __chromedriver-helper__
       - O driver do navegador Google Chrome.

- __cucumber__
       - O interoperador da lógica com o Gherkin.

- __geckodriver-helper__
       - O driver do navegador Mozilla Firefox.

- __rspec__
       - Framework BDD com uma sintaxe bem fluída e bom recursos para a realização de testes.

- __selenium-webdriver__
       - O motor de drivers. O pacote de soluções primordial para qualquer teste ponta-a-ponta.

- __site_prism__
       - Um facilitador para a aplicação do Page Object, com bons recursos para testes - inclui bons validadores e redutores de verbosidade.

- __rubocop__
       - Lint para código Ruby. Traz sugestões de boas práticas de programação (Indentação, clean code...).
       
# Os outros arquivos do projeto

**Nesse projeto, existem 2 arquivos substanciais que auxiliam nossa configuração:**

> Um deles é o *cucumber.yml*, encontrado na raíz do projeto. Nele estão os comandos necessários para a execução dos testes. Ali, já temos pré-configurado, utilizando a tag *default* o browser, o relatório e o ambiente que queremos testar. Esse arquivo nos ajuda a reduzir o comando para a execução dos testes.

> O outro arquivo é o *environment.yaml*, encontrado na pasta *support*/**config**. Este arquivo é utilizado como um hash onde podemos organizar dados específicos da nossa arquitetura e economizar em classes ou módulos.
Nesse caso, utilizamos para armazenar os dados sobre os endereços dos nossos ambientes.

# Comandos para a execução dos testes

> Para rodar os testes é necessário apenas a execução do comando *cucumber* no terminal do seu editor, mas se preferir, poderá usar os comandos **cucumber -t @CT_00X_X** para a execução dos cenários. Ex: Cenário do Survey - **cucumber -t @CT_001_A**.
