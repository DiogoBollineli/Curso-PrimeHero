*** Settings ***
Documentation       Exercicio prático sobre automação mobile para o curso Prime Heroes.

Library     AppiumLibrary

Test Setup                      Abrir aplicativo
Test Teardown                   Fechar aplicativo

***Variables***

${HOME}             com.google.android.youtube.HomeActivity
${APP}              com.google.android.youtube

*** Keywords ***
Abrir aplicativo
    Open Application            http://localhost:4723/wd/hub
    ...                         automationName=uiautomator2
    ...                         deviceName=35f7703e
    ...                         platformName=Android
    ...                         autoGrantPermissions=true
    ...                         appPackage=${APP}
    ...                         appActivity=${HOME}
Fechar aplicativo
    Close Application
Dado que o cliente esteja na tela de Home

    Wait Until Element Is Visible                id=youtube_logo
    Element Attribute Should Match               xpath=//android.widget.Button[@content-desc="Início"]/android.widget.ImageView           selected        True 

E pesquise um vídeo sobre "${​BUSCA}​"

    Click Element                 accessibility_id=Pesquisar
    Input Text                    id=search_edit_text               ${​BUSCA}​
    Press Keycode                 66

E acessar o canal da Prime

    Wait Until Element Is Visible            accessibility_id=Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 203 visualizações - há 1 ano - assistir o vídeo
    Click Element                            xpath=//android.view.ViewGroup[@content-desc="Prime Experts - Parceria entre Prime Control e UniBrasil - 3 minutos e 38 segundos - Ir ao canal - Prime Control - 203 visualizações - há 1 ano - assistir o vídeo"]/child::*[@content-desc='Ir ao canal']

Quando clicar em Inscrever-se

    Wait Until Element Is Visible            accessibility_id=Inscreva-se em Prime Control.
    Click Element                            accessibility_id=Inscreva-se em Prime Control.

Então será apresentado como Inscrito

    Wait Until Element Is Visible            accessibility_id=Cancelar inscrição de Prime Control.

Logar no aplicativo com a conta x
    click Element                           accessibility_id=Conta
    wait Until Element is Visible           id=com.google.android.youtube:id/list
    click Element                           accessibility_id=Trocar de conta
    click Element                           accessibility_id=Diogo Bollineli,Nenhum canal       #deve variar entre dispositivos
Entrar no menu “Explorar”
    swipe by percent                        50  50   50   55
    wait Until Element is visible           accessibility_id=filtros
    click Element                           id=com.google.android.youtube:id/icon
Usar swipe de tela até o 10 item da tela
    wait until Element is Visible           accessibility_id=Ir ao canal
    Swipe                                    550  2248   550  526            
    swipe                                    550  2248   550  500                       
    swipe                                    550  2248   550  500                       
    #Swipe By Percent                        50  90   50  10            #}
    #Swipe By Percent                        50  90   50  10             #}pode variar entre dispositivos e também conforme a performance do teste, portanto para meu dispositivo irei utilizar coordenadas 
    #Swipe By Percent                        50  90   50  15            #}
Clicar no vídeo
    click a point                           510     1886                    #pode variar entre dispositivos
***Test Cases***
Caso de teste 01: se incriver no canal prime Experts
    [tags]              PRIME
    Dado que o cliente esteja na tela de Home
    E pesquise um vídeo sobre "Prime Experts​"
    E acessar o canal da Prime
    Quando clicar em Inscrever-se
    Então será apresentado como Inscrito
Caso de Teste 02: Logar no YouTube              
    [tags]              LOGIN
    Dado que o cliente esteja na tela de Home
    Logar no aplicativo com a conta x
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    Clicar no vídeo 

Caso de Teste 03: Usar método Swipe na tela
    [tags]              SWIPE
    Dado que o cliente esteja na tela de Home
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    Clicar no vídeo
