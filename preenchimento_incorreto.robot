*** Settings ***
Library          SeleniumLibrary
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o organo
Test Teardown    Fechar navegador


*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${MENSAGEM_NOME_ERRO}     id:form-nome-erro
${MENSAGEM_CARGO_ERRO}    id:form-cargo-erro
${MENSAGEM_TIME_ERRO}     id:form-times-erro
${BOTAO_CARD}             id:form-botao


*** Test Cases ***

Verificar se ao preencher os campos do formulario incorretamente uma mensagem de erro e exibida para cada campo obrigatorio
...    Clique no botao criar cards
       Entao indentificar se um a mensagem de erro foi exibida para cada campo obrigatorios

*** KeyWords ***

Clique no botao criar cards
    Click Element  ${BOTAO_CARD}

Entao indentificar se um a mensagem de erro foi exibida para cada campo obrigatorios
    Element Should Be Visible  ${MENSAGEM_NOME_ERRO} 
    Element Should Be Visible  ${MENSAGEM_CARGO_ERRO}
    Element Should Be Visible  ${MENSAGEM_TIME_ERRO}
