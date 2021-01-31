# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Jak.czêsto.Pani.Pana.zdaniem.poni¿szy.objaw.wystêpuje.w.trakcie.zaka¿enia.COVID.19...", replacement = "", x = names(sur_1))


###Function
edu_1 <- function(x,y){
  
  sur_3_3 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(biegunka.)
  
  sur_3_4 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(kaszel.)
  
  sur_3_5 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(bóle.miêœni.)
  
  sur_3_6 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(dusznoœæ.)
  
  sur_3_7 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(zmêczenie.)
  
  sur_3_8 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(zaburzenia.smaku.i.wêchu. )
  
  sur_3_9 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(zapalenie.spojówek. )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_3_3, "Datasheet" = sur_3_4,"Datasheet" = sur_3_5,"Datasheet" = sur_3_6,"Datasheet" = sur_3_7,
                           "Datasheet" = sur_3_8,"Datasheet" = sur_3_9)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_1_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,biegunka.:zapalenie.spojówek.)

sur_3_2 <- sur_1_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_1(x =sur_3_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_education/symptomps.xlsx")

#### Gender

sur_3_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,biegunka.:zapalenie.spojówek.)

edu_1(x =sur_3_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_gender/symptomps.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,biegunka.:zapalenie.spojówek.)

med_1 <- function() {

sur_med_2 <- sur_med_1 %>%
  filter(!str_detect( Proszê.wskazaæ.swoje.wykszta³cenie, fixed("w trakcie studiów wy¿szych (medycznych)"))) %>%
  filter(!str_detect( Proszê.wskazaæ.swoje.wykszta³cenie, fixed("w trakcie studiów wy¿szych (niemedycznych)")))

sur_med_2 <- sur_med_2 %>%
  mutate(Proszê.wskazaæ.swoje.wykszta³cenie = str_replace_all(Proszê.wskazaæ.swoje.wykszta³cenie, fixed("œrednie (medyczne)"), replacement = "Wyksztacenie medyczne")) %>%
  mutate(Proszê.wskazaæ.swoje.wykszta³cenie = str_replace_all(Proszê.wskazaæ.swoje.wykszta³cenie, fixed("wy¿sze (medyczne)"), replacement = "Wyksztacenie medyczne")) %>%
  mutate(Proszê.wskazaæ.swoje.wykszta³cenie = str_replace_all(Proszê.wskazaæ.swoje.wykszta³cenie,fixed("wy¿sze (niemedyczne)") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Proszê.wskazaæ.swoje.wykszta³cenie = str_replace_all(Proszê.wskazaæ.swoje.wykszta³cenie,fixed("wy¿sze (niemedyczne)") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Proszê.wskazaæ.swoje.wykszta³cenie = str_replace_all(Proszê.wskazaæ.swoje.wykszta³cenie,fixed("œrednie (niemedyczne)") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Proszê.wskazaæ.swoje.wykszta³cenie = str_replace_all(Proszê.wskazaæ.swoje.wykszta³cenie,fixed("podstawowe") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Proszê.wskazaæ.swoje.wykszta³cenie = str_replace_all(Proszê.wskazaæ.swoje.wykszta³cenie,fixed("zawodowe") , replacement = "Wyksztacenie niemedyczne"))

  return(sur_med_2)
}

sur_3_2 <-  med_1()
sur_3_2

edu_1(x = sur_3_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_medical/symptomps.xlsx")


