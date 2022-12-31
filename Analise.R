# Análise Descritiva de Dados e Previsão para o Indice de Nível Socioeconômico (INSE) por escola

# Instalando Pacotes 

#install.packages("dplyr")
#install.packages("forcast")
#install.packages("readr")
#install.packages("tidyverse") 
#install.packages("ggplot2")
#install.packages("esquisse")
#install.packages("sqldf")

# Carregando Pacotes

library(readr)
library (dplyr)
library(forcats)
library(tidyverse)
library(esquisse)
library(ggplot2)
library(sqldf)

#Removendo notação Ciêntifica dos graficos 

options(scipen = 999)

#setando pasta padrao do projeto 

setwd("~/Github/INSE_escola")

#Lendo base de dados

Dados_INSE <- read.csv("INSE_2019_ESCOLAS.csv",sep =";",encoding = "utf8")

names(Dados_INSE)

Dados_INSE <- rename(Dados_INSE,"NIVELSE" = "nivelse")


#Visualizando dados 
View(Dados_INSE)

#Verificando class
class(Dados_INSE)


#Filtrando colunas 
#Dados_INSE <- Dados_INSE %>% dplyr::select(2,4,5)

#Visualizando cabeçalho
head(Dados_INSE)


View(Dados_INSE$COD_ESC)

#Convertendo dados

#Dados_INSE$COD_ESC <-  gsub ("," , "",Dados_INSE$COD_ESC)
# Dados_INSE$COD_ESC <- as.numeric (Dados_INSE$COD_ESC)
# Dados_INSE$NOMESC <- as.character(Dados_INSE$NOMESC)
# Dados_INSE$MUN <- as.character (Dados_INSE$MUN)
#Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS <-  gsub ("," , "",Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)
# Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS <- as.numeric(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)


#convertendo em linhas  PARA O BIBLIOTCA sqldfentender as consultassql

#Dados_INSE$MUN <- rownames(Dados_INSE)                                           

#head(mtcars)

head(Dados_INSE)                                  

#Dadossql <- as.data.frame(Dados_INSE)
#str(Dadossql)
#view(Dadossql)

#sqldf("

#SELECT * FROM Dadossql WHERE MUN = `DIADEMA`
      
#      ")


#sqldf("

#SELECT * FROM Dados_INSE WHERE MUN = `DIADEMA`
      
#      ")







#Quero apenas as escolar do municipio de São bernaro do campo , Diadema , Santo andre , São Caetrano do sul de 

Dados_INSE <-  filter(Dados_INSE,MUN=="DIADEMA" | MUN=="SAO BERNARDO DO CAMPO" | MUN=="SANTO ANDRE" | MUN=="SAO CAETANO DO SUL" )

View(Dados_INSE)



#` OR MUN = `SANTO ANDRE` OR MUN = `SAO BERNARDO DO CAMPO` OR MUN = `SAO CAETANO DO SUL` 

sapply(Dados_INSE,class)

#confrmando se aconversão alterou os dados da coluna NIvelsocio econimico ....
head(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

#Sumarisão do Nivel Socio economico

class(Dados_INSE)

# #descobrindo mediana
# median(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)
# 
# #descobrindo media
# mean(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)
# 
# plot(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

esquisser(Dados_INSE)





library(ggplot2)

ggplot(Dados_INSE) +
 aes(x = MUN) +
 geom_bar(fill = "#112446") +
 labs(x = "Municípios", y = "Número de Escolas", 
 title = "Número de Escola por Município ABCD") +
 theme_bw()
library(ggplot2)

# Dados_INSE <- as.data.frame(Dados_INSE)
# 
# 
# agreg <- aggregate(. ~ Dados_INSE$MUN, fun = sum, Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)
# 
# s
# 
# class(Dados_INSE)
# 
# head(Dados_INSE)
# 
# Dados_INSE [,5]
# 
# sum(as.integer(Dados_INSE[,5]))
# 
# 
# 
# sqldf ("
#        
#        SELECT SUM (NIVELSE) FROM Dados_INSE
#        WHERE MUN == DIADEMA
#        
#        ")



