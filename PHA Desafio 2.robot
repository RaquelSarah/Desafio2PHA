*** Settings ***
Library        SeleniumLibrary
Library        DebugLibrary
Library        BuiltIn

*** Variables ***
@{FRUTAS}        morango    laranja    abacaxi    kiwi    mirtilo    uva    
&{INFORMACOES_PESSOAIS}    
...                nome=Raquel Sarah
...                idade=26
...                rua=Rua Estados Unidos
...                numero=1500
...                cep=01427000
...                bairro=Jardins
...                cidade=São Paulo
...                estado=São Paulo
...                ano_de_nascimento=1997
${ano_de_nascimento}
${numeros_pares}

*** Test Cases ***

#1 - Exercício Dicionário
  #Exibir nome, idade, rua, numero, cep, bairro, cidade e estado no console a partir de um dicionário
Exibir Informações Pessoais
    [Tags]  Teste1
    Log To Console  ${INFORMACOES_PESSOAIS} 


#2 - Exercício Argumentos e Retornos + If Simples
  #Criar uma keyword que receba idade e retorne o ano de nascimento
  #Se o ano for menor que 2000, exibir mensagem dizendo que nasceu no século passado
Apresentar Ano de Nascimento
   [Tags]  Teste2
   Exibir o ano de nascimento
   

Apresentar Mensagem
   [Tags]  Teste3
   Retornar Mensagem
    

#3 - Exercício For Simples + Lista
  #Exiba cada uma das frutas de uma lista usando um For Simples
Exibir Lista de Frutas
    [Tags]  Teste4
    Lista de Frutas 

#4 - Exercício If Inline + For in Range
  #Crie um loop que conte quantos números pares existem entre 0 e 10, usando if inline
Apresentar números pares entre 0 e 10
    [Tags]  Teste5
    Números pares entre 0 e 10

*** Keywords ***
Exibir Informações Pessoais
    Log To Console  ${INFORMACOES_PESSOAIS} 

Exibir o ano de nascimento
    [Arguments]  ${ano_vigente}=2023  ${idade}=26 
    ${ano_de_nascimento}=  Evaluate  ${ano_vigente} - ${idade}
    [Return]  ${ano_de_nascimento}

Retornar Mensagem
    Log To Console  ${\n}
    ${ano_de_nascimento}=  Exibir o ano de nascimento
    Run Keyword If  ${ano_de_nascimento} < 2000
    ...  Log To Console  Nasceu no século passado
    ...  ELSE
    ...  Log To Console  ${ano_de_nascimento}

Lista de Frutas
    FOR  ${fruta}  IN  @{FRUTAS}
        Log To Console  ${fruta}
    END

Números pares entre 0 e 10
    FOR  ${i}  IN RANGE  11
        ${numeros_pares}=  Evaluate  ${i} % 2
        Run Keyword If  ${numeros_pares} == 0    Log To Console  ${i}
    END