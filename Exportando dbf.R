####################################################################
## Curso - Introdução ao Software R aplicado à Vigilância em Saúde
## Módulo 2 - Importando arquivos no formato *.dbf


# Carregando os pacotes ---------------------------------------------------

library(foreign)
library(dplyr)

# Importando a base de dados ----------------------------------------------

# Usando o caminho abreviado, após a definição do diretório de trabalho
#

setwd("D:\\opasR")

NINDINET <- read.dbf("DADOS/NINDINET_EXEMPLO.dbf", as.is = TRUE) 
# Este comando transforma todas as variáveis
# para o tipo caracter (texto)

# Inspecionando as variáveis ----------------------------------------------

glimpse(NINDINET)
