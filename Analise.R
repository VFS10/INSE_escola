# Análise Descritiva de Dados e Previsão para o Indice de Nível Socioeconômico (INSE) por escola

# Instalando Pacotes 

#install.packages("dplyr")
#install.packages("forcast")
#install.packages("readr")
#install.packages("tidyverse") 

# Carregando Pacotes

library(readr)
library (dplyr)
library(forcats)
library(tidyverse)

#setando pasta padrao do projeto 

setwd("~/Github/INSE_escola")

#Lendo base de dados

Dados_INSE <- read.csv("INSE_2019_ESCOLAS.csv",sep =";",encoding = "utf8")

#Visualizando dados 
View(Dados_INSE)

#Verificando class
class(Dados_INSE)


#Filtrando colunas 
Dados_INSE <- Dados_INSE %>% dplyr::select(2,4,5)

#Visualizando cabeçalho
head(Dados_INSE)


#Convertendo dados
Dados_INSE$NOMESC <- as.character(Dados_INSE$NOMESC)
Dados_INSE$MUN <- as.character(Dados_INSE$MUN)
Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS <-  gsub ("," , "",Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)
Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS <- as.numeric(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

#Validando clase
sapply(Dados_INSE,class)

#confrmando se aconversão alterou os dados da coluna NIvelsocio econimico ....
head(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

#Sumarisão do Nivel Socio economico

class(Dados_INSE)

#descobrindo mediana
median(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

#descobrindo media
mean(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

plot(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS,Dados_INSE$MUN)
plot(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)




