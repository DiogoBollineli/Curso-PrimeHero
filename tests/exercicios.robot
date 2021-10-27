*** Settings ***
Documentation   Aqui estarão presentes todos os exercicios do curso Prime Heroes.
...             É de boa prática manter todas as informações do projeto.

*** Variables ***
${NOME}     Diogo Bollineli

#variaveis simples devem ser iniciadas com "$"

&{PESSOA} 
...         nome=Diogo
...         sobrenome=Bollineli
...         idade=18
...         cordepele=Branca
...         genêro=Masculino
...         email=diogobolineli@gmail.com

#variaveis de dicionario devem se inicar com "&"

@{FRUTAS}
...     limão  
...     maçã
...     laranja
...     morango
...     pera

#arrays devem se iniciar com "@"

*** Test Cases ***
Cenario: Imprimindo informações da pessoa
    Log To Console      \n ${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.cordepele}
    Log To Console      ${PESSOA.genêro}
    Log To Console      ${PESSOA.email}

Cenario: Imprimindo array de frutas
    [tags]              LISTA
    log to console  \n ${FRUTAS[0]}
    log to console  ${FRUTAS[1]}
    log to console  ${FRUTAS[2]}
    log to console  ${FRUTAS[3]}
    log to console  ${FRUTAS[4]}

Cenario: Somando dois valores
    [tags]          SOMA
    Somar dois numeros  1423411  10

Cenario: Concatenar duas strings
    [tags]          CONC
    Concatenar duas palavras "Olá mundo" e "Adeus mundo"

Cenario: Criar email
    [tags]          EMAIL
    Cria e-mail  diogo  bollineli   18

Cenario: Criar email separate
    [tags]          EMAIL2
    Cria e-mail  diogo  bollineli   18

Cenario: Contar de 0 a 10
    [tags]      CONTA
    Contar de 0 a 10

Cenario: Percorrer Lista de paises
    [tags]      PAISES
    Percorrer paises
*** Keywords ***
Somar dois numeros
    [Arguments]         ${NUM_A}     ${NUM_B}
    ${SOMA}          Evaluate         ${NUM_A}+${NUM_B}
    log to console      \n${SOMA}

Concatenar duas palavras "${WRD_A}" e "${WRD_B}"
    ${GLUE}          Catenate          ${WRD_A} ${WRD_B}
    log to console  \n${GLUE}

Cria e-mail
    [Arguments]     ${NAME}     ${SBR}  ${Age}
    ${E-MAIL}   Catenate   ${NAME}_${SBR}_${Age}@robot.com
    log to console  \n${E-MAIL} 

Cria e-mail separate
    [Arguments]     ${NAME}     ${SBR}  ${Age}
    ${E-MAIL}   Catenate    SEPARATOR=_   ${NAME} ${SBR} ${Age}@robot.com
    log to console  \n${E-MAIL} 

Contar de 0 a 10
    FOR     ${COUNT}    IN RANGE   0   11
        log to console  Estou no número: ${COUNT}
    END

Percorrer paises    
    @{PAISES}   Create List    Brasil  Japão    Canada  Chile   Argentina
    FOR  ${PAIS}    IN      @{PAISES}
        log to console   ${PAIS}
    END