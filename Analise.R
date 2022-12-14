# Análise Descritiva de Dados e Previsão para o Indice de Nível Socioeconômico (INSE) por escola

install.packages("dplyr")
install.packages("forcast")
install.packages("readr")
install.packages("tidyverse") 

library(readr)
library (dplyr)
library(forcats)
library(tidyverse)

setwd("~/Github/INSE_escola")

Dados_INSE <- read.csv("INSE_2019_ESCOLAS.csv",sep =";",encoding = "utf8")

View(Dados_INSE)

summary(Dados_INSE)

Dados_INSE <- Dados_INSE %>% dplyr::select(2,4,5)


head(Dados_INSE)



