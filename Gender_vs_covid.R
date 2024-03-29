# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)

#Retrieve data structure 
glimpse(sur_1)

#Cut useless text
names(sur_1) = gsub(pattern = "Czy.uwa�a.Pan.i..�e.nast�puj�ce.czynniki.pogarszaj�.przebieg.choroby.COVID.19..", replacement = "", x = names(sur_1))

### Analyze data about ibuprofen usage regarding demographic data

#Gender
sur_gen <- sur_1 %>%
  group_by(Prosz�.wskaza�.swoj�.p�e� ) %>%
  summarise(p�e�.m�ska.    ) %>%
  count(p�e�.m�ska.    )
sur_gen <- as_tibble(sur_gen)

#Children
sur_gen_1 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.. ) %>%
  summarise(p�e�.m�ska.   ) %>%
  count(p�e�.m�ska.   )
sur_gen_1 <- as_tibble(sur_gen_1)

#Children and gender
sur_gen_2 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci.., Prosz�.wskaza�.swoj�.p�e�  ) %>%
  summarise( p�e�.m�ska.   ) %>%
  count( p�e�.m�ska.  )
sur_gen_2 <- as_tibble(sur_gen_2)

#Education
sur_gen_3 <- sur_1 %>%
  group_by(Prosz�.wskaza�.swoje.wykszta�cenie  ) %>%
  summarise( p�e�.m�ska.   ) %>%
  count(p�e�.m�ska.  )
sur_gen_3 <- as_tibble(sur_gen_3)

#City
sur_gen_4 <- sur_1 %>%
  group_by(Prosz�.wskaza�.wielko��.miejscowo�ci..w.kt�rej.sp�dzi�.a.Pan.Pani.wi�kszo��.swojego.�ycia  ) %>%
  summarise(p�e�.m�ska.  ) %>%
  count(p�e�.m�ska.  )
sur_gen_4 <- as_tibble(sur_gen_4)

#Save as excel file
write.xlsx(sur_gen,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Gender_vs_covid/gender.xlsx")
write.xlsx(sur_gen_1,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Gender_vs_covid/children.xlsx")
write.xlsx(sur_gen_2,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Gender_vs_covid/children_gender.xlsx")
write.xlsx(sur_gen_3,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Gender_vs_covid/education.xlsx")
write.xlsx(sur_gen_4,"C:/Users/Bartek/Desktop/Ankieta COVID/Demografia_ankiety/Gender_vs_covid/city.xlsx")
