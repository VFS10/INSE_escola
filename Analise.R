# Análise Descritiva de Dados e Previsão para o Indice de Nível Socioeconômico (INSE) por escola

install.packages("dplyr")
install.packages("forcast")
install.packages("readr")


library(readr)
library (dplyr)
library(forcats)

setwd("~/Github/INSE_escola")


INSE <- read.csv(INSE_2019_ESCOLAS.csv)
