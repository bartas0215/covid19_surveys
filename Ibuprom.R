# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)

#Retrieve data structure 
glimpse(sur_1)

# Number of articles regarding ibuprofen and COVID-19
try({
  covid_querry_all <- get_pubmed_ids("COVID 19 OR novel coronavirus OR
coronavirus Wuhan OR SARS-CoV-2[TIAB] AND Ibuprofen[TIAB] AND (2019/12/31[PDAT]:2020/12/30[PDAT])")
  print(covid_querry_all$Count)
}, silent = TRUE)

#Cut useless text
names(sur_1) = gsub(pattern = "Czy.zgadza.si�.Pan.i.z.nast�puj�cymi.stwierdzeniami.odno�nie.leczenia.COVID.19...", replacement = "", x = names(sur_1))

### Analyze data about ibuprofen usage regarding demographic data

#Gender
sur_ib <- sur_1 %>%
  group_by(Prosz�.wskaza�.swoj�.p�e� ) %>%
  summarise(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby..  )
sur_ib <- as_tibble(sur_ib)

#Children
sur_ib_1 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci..  ) %>%
  summarise(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )
sur_ib_1 <- as_tibble(sur_ib_1)

#Children and gender
sur_ib_2 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.., Prosz�.wskaza�.swoj�.p�e�  ) %>%
  summarise( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )
sur_ib_2 <- as_tibble(sur_ib_2)

#Education
sur_ib_3 <- sur_1 %>%
  group_by(Prosz�.wskaza�.swoje.wykszta�cenie  ) %>%
  summarise( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count( Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )
sur_ib_3 <- as_tibble(sur_ib_3)

#City
sur_ib_4 <- sur_1 %>%
  group_by(Prosz�.wskaza�.wielko��.miejscowo�ci..w.kt�rej.sp�dzi�.a.Pan.Pani.wi�kszo��.swojego.�ycia  ) %>%
  summarise(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. ) %>%
  count(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby..  )
sur_ib_4 <- as_tibble(sur_ib_4)

#Save as excel file
write.xlsx(sur_ib,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Ibuprofen/gender.xlsx")
write.xlsx(sur_ib_1,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Ibuprofen/children.xlsx")
write.xlsx(sur_ib_2,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Ibuprofen/children_gender.xlsx")
write.xlsx(sur_ib_3,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Ibuprofen/education.xlsx")
write.xlsx(sur_ib_4,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Ibuprofen/city.xlsx")
