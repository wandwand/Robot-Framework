*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o organo
Test Teardown    Fechar navegador


*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{selecionar_times}
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')]
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação e Gestão')]



*** Test Cases ***

Verificar se ao preencher os campos do formulario corretamente os dados sao inseridos na lista e se um novo card e criado no time esperado
    
    Dado que preencha os campos do formulario 
    E clique no bootao criar card
    Entao indentificar se um novo card foi criado no time esperado

Verificar se é possível criar mais de um card se preenchermos os campos corretamente
    Dado que preencha os campos do formulario
    E clique no bootao criar card
    Então criar 3 cards no time esperado

Verificar se é possível criar um carde para cada time disponível se preenchermos os campos corretamente
        Dado que preencha os campos do formulario 
        Então criar e identificar 1 card para cada time disponivel

  

*** KeyWords ***
    

Dado que preencha os campos do formulario
    ${Nome}     FakerLibrary.First_name 
    Input Text  ${CAMPO_NOME}    ${Nome}
    ${Cargo}    FakerLibrary.Job
    Input Text  ${CAMPO_CARGO}   ${Cargo}
    ${Imagem}   FakerLibrary.Image Url    width=100  height=100
    Input Text  ${CAMPO_IMAGEM}  ${Imagem}
    Click Element  ${CAMPO_TIME}  
    Click Element  ${selecionar_times[0]}

E clique no bootao criar card
    Click Element  ${BOTAO_CARD}

Entao indentificar se um novo card foi criado no time esperado
    Element Should Be Visible  ${selecionar_times[0]}

Então criar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulario 
        E clique no bootao criar card
    END
    Sleep  10s

Então criar e identificar 1 card para cada time disponivel
    FOR   ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que preencha os campos do formulario 
        Click Element  ${time}  
        E clique no bootao criar card
        Element Should Be Visible  ${time}
    END

    Sleep  10s