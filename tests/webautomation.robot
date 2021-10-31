***Settings***
Documentation       Exercicio prático de automação para o curso Prime Heroes.

Library     SeleniumLibrary

Test Setup      Abrir Navegador

Test Teardown       Fechar Navegador

*** Variables ***
${URL}           http://automationpractice.com/index.php
${BROWSER}       chrome
${NOME}          Diogo
${SOBRENOME}     Bollineli
${EMAIL}         email_teste8@outlook.com

***Test Cases***

Caso de Teste 01: Pesquisar produto existente
        [tags]                      CASE01
    Acessar a página home do site Automation Practice
    
    Digitar o nome do produto "Blouse" no campo de pesquisa

    Clicar no botão pesquisar

    Conferir se o produto "Blouse" foi listado no site

Caso de teste 02: Pesquisar produto não existente
        [Tags]                      CASE02
    Acessar a página home do site Automation Practice

    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa

    Clicar no botão pesquisar 

    Conferir mensagem "No results were found for your search "itemNãoExistente""

Caso de teste 03: Listar Produtos
        [tags]                     CASE03
    Acessar a página home do site Automation Practice

    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias

    Clicar na sub-categoria "Summer Dresses"

    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de teste 04: Adicionar cliente
        [tags]                     CASE04
    Acessar a página home do site Automation Practice

    Clicar em "Sign in"

    Informar um e-mail válido

    Clicar em "Create an account"

    Preencher os dados obrigatórios

    Submeter cadastro

    Confere se o cadastro foi efetuado com sucesso

***Keywords***

Abrir navegador
    Open Browser                browser=${BROWSER}
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser
Acessar a página home do site Automation Practice
    go to                                 ${URL}
    Title should be                       My Store
    wait until element is visible         id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    input text          id=search_query_top     ${PRODUTO}

Clicar no botão pesquisar 
    Click Element       xpath=//*[@name='submit_search' and @type='submit']       

Conferir se o produto "${PRODUTO}" foi listado no site

    wait until element is visible        id=center_column
    title should be                      Search - My Store
    Page Should Contain Image            xpath=//*[@id='center_column']//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']

Conferir mensagem "${MENSAGEM}"

    wait until element is visible       xpath=//*[@id='center_column' and @class='center_column col-xs-12 col-sm-9']
    title should be                     Search - My Store
    Element Text Should Be              xpath=//*[@class='alert alert-warning']                 ${MENSAGEM}

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias

    Mouse over                          xpath=//*[@class='sf-with-ul' and @title='Women']

Clicar na sub-categoria "${SUB_CAT}"

    wait until element is visible       xpath=//*[@class='submenu-container clearfix first-in-line-xs']
    Click element                       xpath=//*[@title='Summer Dresses']

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

    Wait until element is visible       xpath=//*[@class='row']//*[@class='product_list grid row']
    title should be                     Summer Dresses - My Store
    Page should contain image           xpath=//*[@class='product_list grid row']//*[@src='http://automationpractice.com/img/p/1/2/12-home_default.jpg']
    ...                                 //*[@src='http://automationpractice.com/img/p/1/6/16-home_default.jpg']  
    ...                                 //*[@src='http://automationpractice.com/img/p/2/0/20-home_default.jpg']

Clicar em "Sign in"

    wait until element is visible       xpath=//*[@class='header-container']
    title should be                     My Store
    click element                       xpath=//*[@class='login' and @title='Log in to your customer account']

Informar um e-mail válido

    wait until element is visible       id=columns
    input text                          id=email_create                                         ${EMAIL} 

Clicar em "Create an account"

    Click Button                        id=SubmitCreate

Preencher os dados obrigatórios
    wait until element is visible       id=account-creation_form
    click element                       id=id_gender1
    input text                          id=customer_firstname                                   ${NOME} 
    input text                          id=customer_lastname                                    ${SOBRENOME}
    input text                          id=passwd                                               senha123
    select from list by index           xpath=//*[@id='days']                                   27
    select from list by index           xpath=//*[@id='months']                                 12
    select from list by value           xpath=//*[@id='years']                                  2002
    input text                          id=firstname                                            ${NOME}
    input text                          id=lastname                                             ${SOBRENOME}
    input text                          id=company                                              company
    input text                          xpath=//*[@id='address1']                               W 5th Ave
    input text                          id=address2                                             House
    input text                          id=city                                                 Nome
    select from list by index           id=id_state                                             2
    input text                          id=postcode                                             99762
    select from list by index           id=id_country                                           1
    input text                          id=phone                                                2345678
Submeter cadastro
    page should contain Button          id=submitAccount
    click element                       id=submitAccount
Confere se o cadastro foi efetuado com sucesso
    wait until element is visible       xpath=//*[@id="columns"]
    title should be                     My account - My Store
    page should contain element         xpath=//*[@id="center_column"]                                  

    

