# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Czy.uwa¿a.Pan.i..¿e.Ÿród³em.zaka¿enia.mo¿e.mog¹.byæ...", replacement = "", x = names(sur_1))

###Function
edu_6 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(Osoby.uznane.za.wyleczone.z.COVID.19..)
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(Osoba.3.dni.przed.wyst¹pieniem.objawów.choroby..   )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(Osoba.14.dni.przed.wyst¹pieniem.objawów.choroby..)
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count( Osoba.18.dni.przed.wyst¹pieniem.objawów.choroby.. )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(Osoba..u.której.wystêpuj¹.aktualnie.objawy.choroby..   )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,Osoby.uznane.za.wyleczone.z.COVID.19..:Osoba..u.której.wystêpuj¹.aktualnie.objawy.choroby..)

sur_4_2 <- sur_4_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_6(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Infection_source/education/inf_source.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,Osoby.uznane.za.wyleczone.z.COVID.19..:Osoba..u.której.wystêpuj¹.aktualnie.objawy.choroby..)

edu_6(sur_4_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/infection_source/gender/inf_source.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,Osoby.uznane.za.wyleczone.z.COVID.19..:Osoba..u.której.wystêpuj¹.aktualnie.objawy.choroby..)

sur_4_2 <-  med_1()
sur_4_2

edu_6(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Infection_source/medical/inf_source.xlsx")

