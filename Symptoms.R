# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)

#Retrieve data structure 
glimpse(sur_1)

### Analyze data about ibuprofen usage regarding demographic data

#Gender
sur_sym <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoj¹.p³eæ ) %>%
  summarise(zaburzenia.smaku.i.wêchu.  ) %>%
  count(zaburzenia.smaku.i.wêchu.   )
sur_sym <- as_tibble(sur_sym)

#Children
sur_sym_1 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.. ) %>%
  summarise(zaburzenia.smaku.i.wêchu. ) %>%
  count(zaburzenia.smaku.i.wêchu. )
sur_sym_1 <- as_tibble(sur_sym_1)

#Children and gender
sur_sym_2 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.., Proszê.wskazaæ.swoj¹.p³eæ  ) %>%
  summarise( zaburzenia.smaku.i.wêchu.) %>%
  count( zaburzenia.smaku.i.wêchu.)
sur_sym_2 <- as_tibble(sur_sym_2)

#Education
sur_sym_3 <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie  ) %>%
  summarise( zaburzenia.smaku.i.wêchu.) %>%
  count(zaburzenia.smaku.i.wêchu. )
sur_sym_3 <- as_tibble(sur_sym_3)

#City
sur_sym_4 <- sur_1 %>%
  group_by(Proszê.wskazaæ.wielkoœæ.miejscowoœci..w.której.spêdzi³.a.Pan.Pani.wiêkszoœæ.swojego.¿ycia  ) %>%
  summarise(zaburzenia.smaku.i.wêchu. ) %>%
  count(zaburzenia.smaku.i.wêchu. )
sur_sym_4 <- as_tibble(sur_sym_4)

#Save as excel file
write.xlsx(sur_sym,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Symptoms/gender.xlsx")
write.xlsx(sur_sym_1,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Symptoms/children.xlsx")
write.xlsx(sur_sym_2,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Symptoms/children_gender.xlsx")
write.xlsx(sur_sym_3,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Symptoms/education.xlsx")
write.xlsx(sur_sym_4,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Symptoms/city.xlsx")
