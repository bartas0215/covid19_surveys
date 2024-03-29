# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Czy.w.zwi�zku.z.epidemi�.COVID.19.zmieni�y.si�.Pani.Pana.nawyki.higieniczne...", replacement = "", x = names(sur_1))

###Function
edu_10 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(cz�stsze.mycie.r�k. )
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(unikanie.dotykania.twarzy. )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(unikanie.witania.si�.przez.podanie.r�ki. )
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count( wi�ksze.zwracanie.uwagi.na.zakrywanie.ust.podczas.kaszlu.chusteczk�.lub.�okciem. )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(korzystanie.ze.�rodk�w.do.dezynfekcji. )
  

  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,cz�stsze.mycie.r�k.:korzystanie.ze.�rodk�w.do.dezynfekcji. )

sur_4_2 <- sur_4_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_10(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Hygenic_habits/education/hyg_covid.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,cz�stsze.mycie.r�k.:korzystanie.ze.�rodk�w.do.dezynfekcji.)

edu_10(sur_4_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Hygenic_habits/gender/hyg_covid.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,cz�stsze.mycie.r�k.:korzystanie.ze.�rodk�w.do.dezynfekcji.)

sur_4_2 <-  med_1()
sur_4_2

edu_10(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Hygenic_habits/medical/hyg_covid.xlsx")

