###################################################################
## Curso - Introdução ao Software R aplicado à Vigilância em Saúde
## Módulo 2 - Importando arquivos no formato *.xls e xlsx


# Exemplo  ---------------------------------------------------------------

# Abaixo temos o código gerado pela janela de importação do RStudio
# Neste exemplo estamos lendo o arquivo de exemplo de hepatites virais do RJ

# Carregando os pacotes ---------------------------------------------------
### Para XLS
library(readxl)
heparj_bysexo <- read_excel("D:\\opas R\\sinannet_heparj_bysexo.xls")
View(heparj_bysexo)


### Para XLSX
sinannet_heparj_bysexo1 <- read_excel("D:\\opas R\\sinannet_heparj_bysexo1.xlsx")
View(sinannet_heparj_bysexo1) 


# Usando o caminho abreviado, após a definição do diretório de trabalho

setwd("D:\\opas R"") ### Fixando diretório de trabalho

## somente o nome do aqruivo pois o diretório de trabalho/pasta com 
### os arquivos já esta direcionado

heparj_bysexo <- read_excel("sinannet_heparj_bysexo.xls")
heparj_bysexo




### busacando os dados na pasta de trabalho
meu_dado <- read_excel(file.choose())


# Verificando os tipos de variáveis disponíveis na base de dados
dplyr::glimpse(sinannet_heparj_bysexo1)


head(sinannet_heparj_bysexo1)     # Exibe as primeiras linhas dos dados
summary(sinannet_heparj_bysexo1)  # Fornece um resumo estatístico dos dados
str(sinannet_heparj_bysexo1)      # Mostra a estrutura  e tipos de variaveis

