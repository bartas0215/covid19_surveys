# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Czy.w.zwi¹zku.z.epidemi¹.COVID.19.zmieni³y.siê.Pani.Pana.nawyki.higieniczne...", replacement = "", x = names(sur_1))

###Function
edu_10 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(czêstsze.mycie.r¹k. )
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(unikanie.dotykania.twarzy. )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(unikanie.witania.siê.przez.podanie.rêki. )
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count( wiêksze.zwracanie.uwagi.na.zakrywanie.ust.podczas.kaszlu.chusteczk¹.lub.³okciem. )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(korzystanie.ze.œrodków.do.dezynfekcji. )
  

  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,czêstsze.mycie.r¹k.:korzystanie.ze.œrodków.do.dezynfekcji. )

sur_4_2 <- sur_4_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_10(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Hygenic_habits/education/hyg_covid.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,czêstsze.mycie.r¹k.:korzystanie.ze.œrodków.do.dezynfekcji.)

edu_10(sur_4_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Hygenic_habits/gender/hyg_covid.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,czêstsze.mycie.r¹k.:korzystanie.ze.œrodków.do.dezynfekcji.)

sur_4_2 <-  med_1()
sur_4_2

edu_10(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Hygenic_habits/medical/hyg_covid.xlsx")

