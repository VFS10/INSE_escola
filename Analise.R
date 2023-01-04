# Análise Descritiva de Dados e Previsão para o Indice de Nível Socioeconômico (INSE) por escola

# Instalando Pacotes 

#install.packages("dplyr")
#install.packages("forcast")
#install.packages("readr")
#install.packages("tidyverse") 
#install.packages("ggplot2")
#install.packages("esquisse")
#install.packages("sqldf")
#library(ggplot2)


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

Dados_INSE <- rename(Dados_INSE,"NIVELSE" = "NIVEL.SOCIOECONOMICO.DOS.ALUNOS")


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

# Dados_INSE$COD_ESC <-  gsub ("," , "",Dados_INSE$COD_ESC)
# Dados_INSE$COD_ESC <- as.numeric (Dados_INSE$COD_ESC)
# Dados_INSE$NOMESC <- as.character(Dados_INSE$NOMESC)
# Dados_INSE$MUN <- as.character (Dados_INSE$MUN)

# Removendo a vircula do nivel socio economico das escolas para facilitar nosso tratamentodos dados 
Dados_INSE$NIVELSE <-  gsub ("," , "",Dados_INSE$NIVELSE)

#Convertendo variavel para númerica 
Dados_INSE$NIVELSE  <- as.numeric(Dados_INSE$NIVELSE)


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

#esquisser(Dados_INSE)




print(" Grafico com a representação do Número de escolas do ABCD por Municipio")



ggplot(Dados_INSE) +
 aes(x = MUN) +
 geom_bar(fill = "#112446") +
 labs(x = "Municípios", y = "Número de Escolas", 
 title = "Número de Escola por Município ABCD") +
 theme_bw()
library(ggplot2)

summary(Dados_INSE$NIVELSE)


print("Nível Socio Ecônomico MINIMO das escolas do ABCD é 3,93")

print("Nível socio ecônomico MAXIMO das escolas do ABCD é 6,51")

print("MÉDIA do Nível socio ecônomico das escolas do ABCD é 5,22")







# row.names(Dados_INSE)
# 
# sqldf ( "
#        
#         SELECT SUM (NIVELSE) FROM Dados_INSE
#         WHERE MUN == DIADEMA
#        
#         
#         ")
# 
# view(Dados_INSE)
# 
# 
