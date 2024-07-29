# Carregando o pacote {dplyr}

library(dplyr)

# Criando um data.frame

nome <- c("Joao", "Maria", "Jose", "Pedro", "Madalena")
sexo <- c("M", "F", "M", "M", "F")
idade <- c(25, 48, 52, 43, 36)
peso <- c(70, 58, 98, 103, 60)
altura <- c(1.59, 1.51, 1.72, 1.81, 1.63)
id_agravo <- c("A90", "A90", "A90", "A279", "A279")
bairro <- c("CAJURU", "ATUBA", "CAJURU", NA, "CAJURU")
viagem_estadual <- c("SIM", "NAO", "SIM", "NAO", "NAO")
viagem_internacional <- c("NAO", "NAO", "SIM", "NAO", "NAO")

aula_dplyr <- data.frame(nome, sexo, idade, peso, altura, id_agravo,
                         bairro, viagem_estadual, viagem_internacional)

# Inspecionando a base de dados
# Qual � o tipo de cada vari�vel

glimpse(aula_dplyr)

# Filtrar linhas com filter()
# Para filtrar linhas com efici�ncia, voc� precisa saber como usar
# os operadores de compara��o   (>, # Maior
#                               >=, # Maior ou igual
#                                <, # Menor
#                               <=, # Menor ou igual
#                               !=, # Diferente
#                               ==) # Igual
#
# � importante tamb�m conhecer os operadores l�gicos
#
#                               &  (E)  | (OU)
#
# E como lidar com valores faltantes (NA)

filter(aula_dplyr, idade >= 25)
filter(aula_dplyr, idade == 25 | sexo == "F")
filter(aula_dplyr, bairro %in% c("ATUBA", "CAJURU"))
filter(aula_dplyr, is.na(bairro))

# Ordenar linhas com arrange()

arrange(aula_dplyr, idade)        # crescente � o padr�o
arrange(aula_dplyr, desc(idade))  # descrescente precisa da fun��o desc()
arrange(aula_dplyr, bairro)       # faltantes ficam no final

# Selecionar colunas com select()

select(aula_dplyr, nome, idade, bairro)             # escolhendo as colunas pelo nome
select(aula_dplyr, -viagem_estadual)                # excluindo uma coluna
select(aula_dplyr, nome:id_agravo)                  # escolhendo um intervalo de colunas
select(aula_dplyr, nome, idade, sexo, everything()) # reordenando as colunas
select(aula_dplyr, nome, starts_with("viagem"))     # selecionando grupos de colunas
select(aula_dplyr, nome, ends_with("al"))           # selecionando grupos de colunas

# Adicionar novas vari�veis com mutate()

mutate(aula_dplyr, imc = peso/altura^2)


# Adicionar novas vari�veis com mutate(), usando a fun��o condicional case_when()

mutate(aula_dplyr,
       faixa_etaria = case_when(idade >= 20 & idade <= 39 ~ "20 a 39 anos",
                                idade > 39 ~ "40 anos ou mais")
)
# Criando resumos com summarise()

summarise(aula_dplyr, casos = n())
summarise(aula_dplyr, media_idade = mean(idade))

# Quando utilizado sozinho summarise tem pouca utilidade,
# mas em conjunto com group_by torna-se uma ferramenta poderosa.
# No entanto, antes de falar dos 2 juntos precisamos falar sobre pipe ( |>  ou %>%)

# Combinando opera��es com pipe, usando group_by() e summarise()

aula_dplyr |> group_by(bairro) |> summarise(casos = n()) # agrupando por 1 vari�vel

aula_dplyr |>
  group_by(bairro, id_agravo) |>                         # agrupando por mais vari�veis
  summarise(casos = n())

