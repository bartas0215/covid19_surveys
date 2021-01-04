# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)

#Retrieve data structure 
glimpse(sur_1)

#Cut useless text
names(sur_1) = gsub(pattern = "Jak.ocenia.Pan.Pani.skutecznoœæ.podanych.œrodków.zapobiegawczych...", replacement = "", x = names(sur_1))

### Analyze data about ibuprofen usage regarding demographic data

#Gender
sur_alc <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoj¹.p³eæ ) %>%
  summarise(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.   ) %>%
  count(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.    )
sur_alc <- as_tibble(sur_alc)

#Children
sur_alc_1 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.. ) %>%
  summarise(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.  ) %>%
  count(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.   )
sur_alc_1 <- as_tibble(sur_alc_1)

#Children and gender
sur_alc_2 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.., Proszê.wskazaæ.swoj¹.p³eæ  ) %>%
  summarise( œrodek.do.dezynfekcji.bez.dodatku.alkoholu.  ) %>%
  count( œrodek.do.dezynfekcji.bez.dodatku.alkoholu.  )
sur_alc_2 <- as_tibble(sur_alc_2)

#Education
sur_alc_3 <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie  ) %>%
  summarise( œrodek.do.dezynfekcji.bez.dodatku.alkoholu.  ) %>%
  count(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.  )
sur_alc_3 <- as_tibble(sur_alc_3)

#City
sur_alc_4 <- sur_1 %>%
  group_by(Proszê.wskazaæ.wielkoœæ.miejscowoœci..w.której.spêdzi³.a.Pan.Pani.wiêkszoœæ.swojego.¿ycia  ) %>%
  summarise(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.  ) %>%
  count(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.  )
sur_alc_4 <- as_tibble(sur_alc_4)

#Save as excel file
write.xlsx(sur_alc,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Non_alcoholic_desinfection/gender.xlsx")
write.xlsx(sur_alc_1,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Non_alcoholic_desinfection/children.xlsx")
write.xlsx(sur_alc_2,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Non_alcoholic_desinfection/children_gender.xlsx")
write.xlsx(sur_alc_3,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Non_alcoholic_desinfection/education.xlsx")
write.xlsx(sur_alc_4,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Non_alcoholic_desinfection/city.xlsx")
