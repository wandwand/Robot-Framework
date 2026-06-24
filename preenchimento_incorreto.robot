*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${MENSAGEM_NOME_ERRO}     id:form-nome-erro
${MENSAGEM_CARGO_ERRO}    id:form-cargo-erro
${MENSAGEM_TIME_ERRO}     id:form-times-erro
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]


*** Test Cases ***

Verificar se ao preencher os campos do formulario corretamente os dados sao inseridos na lista e se um novo card e criado no time esperado
    Dado que eu acesse o organos
    E clique no bootao criar cards
    Entao indentificar se um a mensagem de erro foi exibida para cada campo obrigatorios

*** KeyWords ***

Dado que eu acesse o organos
    Open Browser    url=${URL}    browser=Chrome

E clique no bootao criar cards
    Click Element  ${BOTAO_CARD}

Entao indentificar se um a mensagem de erro foi exibida para cada campo obrigatorios
    Element Should Be Visible  ${MENSAGEM_NOME_ERRO} 
    Element Should Be Visible  ${MENSAGEM_CARGO_ERRO}
    Element Should Be Visible  ${MENSAGEM_TIME_ERRO}
