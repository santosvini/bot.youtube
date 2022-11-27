*** Settings ***
Documentation    Bot para acesso e navegação no youtube

Library         Browser
Library         SeleniumLibrary

*** Variables ***
${url}            https://www.youtube.com/
${title}          //title[contains(.,'YouTube')]
# ${user}           viniciusdeusefiel.santos
# ${pass}           Luc@s!37
# ${login}          https://accounts.google.com/v3/signin/identifier?dsh=S-720781436%3A1669252526528163&continue=https%3A%2F%2Faccounts.google.com%2F&followup=https%3A%2F%2Faccounts.google.com%2F&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=ARgdvAsuwGhosvmahwb2EQ-shA2SaqWurG102MbFpvIX04VcRgrsOxReYHIZ6kG--EX3xdiGd7emnw  

*** Keywords ***
Abrir o Navegador
  New Browser               headless=False
  New Page                  ${url}

Fechar o Navegador
  Take Screenshot
  SeleniumLibrary.Close Browser

Acessa a home page do Youtube
  Wait For Elements State              (//a[@href='/'])[1]
  Wait For Elements State              selector=//ytd-mini-guide-renderer[@role='navigation']
  Sleep                                1

Verificar se o título da página aparece ${title}
  Browser.Get Title                    equal    ${title}

Pesquisar sobre Robot Framework
  Get Element States                    selector=(//yt-icon[@id='logo-icon'])[1]
  Browser.Get Text                      //input[contains(@placeholder,'Pesquisar')]
  Take Screenshot
  Type Text                             input#search    txt=Robot Framework
  # Clear Text                            selector=input#search
  Click                                 button#search-icon-legacy
  Browser.Get Text                      selector=//span[@title='Aprenda Robot Framework']
  Sleep                                 2s
  Click                                 //span[@title='Aprenda Robot Framework']
  Sleep                                 2s
  Click                                 //button[contains(.,'Pular anúncio')]
  Sleep                                 5s
  Click                                 //video[@tabindex='-1']
  Sleep                                 2s
  Get Element States                    //div[@id='primary']
  Click                                 //video[@tabindex='-1']
  Sleep                                 3s
  Evaluate JavaScript                   body                    (elem) => window.scrollTo(0, 500)
  Evaluate JavaScript                   div#placeholder-area    (elem) => elem.innerText = "Bot de Teste"
  # Fill Text                             div#placeholder-area    Sou um bot feito em robot
  # Click Button                          //button[contains(.,'Comentar')]     
  Sleep                                 8s

Verifica a playlist do curso
  Browser.Get Text                      input#search

# Fazer login no youtube
#   Wait For Elements State              (//div[@id='container'])[2]
#   Click                                (//div[contains(@class,'fill')])[11]
#   SeleniumLibrary.Go To                ${login}
#   Page Should Contain Image            locator=svg.BFr46e
#   Sleep                                10
#   Browser.Get Text                     input#identifierId
#   Fill Text                            css=input#identifierId      ${user}
#   Click                                css=div.VfPpkd-RLmnJb
#   Browser.Get Text                     input[name="Passwd"]
#   Fill Text                            css=input[name="Passwd"]    ${pass}    

  