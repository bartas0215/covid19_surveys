# Load libraries
library(tidyverse)
library(easyPubMed)

#Retrieve data structure 
glimpse(sur_1)

# Number of articles regarding ibuprofen and COVID-19
try({
  covid_querry_all <- get_pubmed_ids("COVID 19 OR novel coronavirus OR
coronavirus Wuhan OR SARS-CoV-2[TIAB] AND Ibuprofen[TIAB] AND (2019/12/31[PDAT]:2020/12/30[PDAT])")
  print(covid_querry_all$Count)
}, silent = TRUE)

#Cut useless text
names(sur_1) = gsub(pattern = "Czy.zgadza.siê.Pan.i.z.nastêpuj¹cymi.stwierdzeniami.odnoœnie.leczenia.COVID.19...", replacement = "", x = names(sur_1))

### Analyze data about ibuprofen usage regarding demographic data

#Gender
sur_ib <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoj¹.p³eæ ) %>%
  summarise(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby..  )

#Children
sur_ib_1 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci..  ) %>%
  summarise(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )

#Children and gender
sur_ib_2 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.., Proszê.wskazaæ.swoj¹.p³eæ  ) %>%
  summarise( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )

#Education
sur_ib_3 <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie  ) %>%
  summarise( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )




