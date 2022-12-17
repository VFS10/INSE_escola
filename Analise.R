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

Dados_INSE$COD_ESC <-  gsub ("," , "",Dados_INSE$COD_ESC)
Dados_INSE$COD_ESC <- as.numeric (Dados_INSE$COD_ESC)
Dados_INSE$NOMESC <- as.character(Dados_INSE$NOMESC)
Dados_INSE$MUN <- as.character (Dados_INSE$MUN)
Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS <-  gsub ("," , "",Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)
Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS <- as.numeric(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)


#microdados_Historia = microdados_enade_filtrados %>% filter(CO_GRUPO == 2402)


#convertendo em linhas  PARA O BIBLIOTCA sqldfentender as consultassql
Dados_INSE$MUN <- row.names(Dados_INSE$MUN)                                           

head(Dados_INSE)                                  

sqldf("
  select MUN
    from Dados_INSE
      where  MUN  LIKE   `D%`
      ")


Dados_INSE$MUN = 

"

SELECT MUN FROM Dados_INSE WHERE MUN = `DIADEMA` 

"

Dados_INSE$MUN


head(Dados_INSE$MUN)

sqldf(Dados_INSE$MUN)

#` OR MUN = `SANTO ANDRE` OR MUN = `SAO BERNARDO DO CAMPO` OR MUN = `SAO CAETANO DO SUL` 


                                         


#Validando clase
View(Dados_INSE$COD_ESC)

sapply(Dados_INSE,class)

#confrmando se aconversão alterou os dados da coluna NIvelsocio econimico ....
head(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

#Sumarisão do Nivel Socio economico

class(Dados_INSE)

#descobrindo mediana
median(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

#descobrindo media
mean(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

plot(Dados_INSE$NIVEL.SOCIOECONOMICO.DOS.ALUNOS)

#esquisser(Dados_INSE)


ggplot(Dados_INSE) +
 aes(x = NIVEL.SOCIOECONOMICO.DOS.ALUNOS, y = COD_ESC) +
 geom_point(shape = "circle", 
 size = 0.75, colour = "#228B22") +
 labs(x = "Nível, Socio Economico ", y = "Cod Escola", title = "Grafico Usando a biblioteca esquisse", 
 subtitle = "Escola por Municipio ") +
 theme_gray() +
 theme(plot.title = element_text(hjust = 0.5), 
 plot.subtitle = element_text(face = "bold", hjust = 0.5), axis.title.y = element_text(face = "italic"), 
 axis.title.x = element_text(face = "italic"))

