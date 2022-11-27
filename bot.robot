*** Settings ***
Documentation    Bot de navegação no youtube

Resource         bot_resources.robot
Test Setup       Abrir o Navegador
Test Teardown    Fechar o Navegador

*** Test Cases ***
Bot Tube
  [Documentation]  Bot de navegação no youtube
  [Tags]           site
  Acessa a home page do Youtube
  Verificar se o título da página aparece YouTube
  Pesquisar sobre Robot Framework