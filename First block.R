# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Jak.cz�sto.Pani.Pana.zdaniem.poni�szy.objaw.wyst�puje.w.trakcie.zaka�enia.COVID.19...", replacement = "", x = names(sur_1))


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
    count(b�le.mi�ni.)
  
  sur_3_6 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(duszno��.)
  
  sur_3_7 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(zm�czenie.)
  
  sur_3_8 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(zaburzenia.smaku.i.w�chu. )
  
  sur_3_9 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(zapalenie.spoj�wek. )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_3_3, "Datasheet" = sur_3_4,"Datasheet" = sur_3_5,"Datasheet" = sur_3_6,"Datasheet" = sur_3_7,
                           "Datasheet" = sur_3_8,"Datasheet" = sur_3_9)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_1_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,biegunka.:zapalenie.spoj�wek.)

sur_3_2 <- sur_1_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_1(x =sur_3_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_education/symptomps.xlsx")

#### Gender

sur_3_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,biegunka.:zapalenie.spoj�wek.)

edu_1(x =sur_3_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_gender/symptomps.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,biegunka.:zapalenie.spoj�wek.)

med_1 <- function() {

sur_med_2 <- sur_med_1 %>%
  filter(!str_detect( Prosz�.wskaza�.swoje.wykszta�cenie, fixed("w trakcie studi�w wy�szych (medycznych)"))) %>%
  filter(!str_detect( Prosz�.wskaza�.swoje.wykszta�cenie, fixed("w trakcie studi�w wy�szych (niemedycznych)")))

sur_med_2 <- sur_med_2 %>%
  mutate(Prosz�.wskaza�.swoje.wykszta�cenie = str_replace_all(Prosz�.wskaza�.swoje.wykszta�cenie, fixed("�rednie (medyczne)"), replacement = "Wyksztacenie medyczne")) %>%
  mutate(Prosz�.wskaza�.swoje.wykszta�cenie = str_replace_all(Prosz�.wskaza�.swoje.wykszta�cenie, fixed("wy�sze (medyczne)"), replacement = "Wyksztacenie medyczne")) %>%
  mutate(Prosz�.wskaza�.swoje.wykszta�cenie = str_replace_all(Prosz�.wskaza�.swoje.wykszta�cenie,fixed("wy�sze (niemedyczne)") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Prosz�.wskaza�.swoje.wykszta�cenie = str_replace_all(Prosz�.wskaza�.swoje.wykszta�cenie,fixed("wy�sze (niemedyczne)") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Prosz�.wskaza�.swoje.wykszta�cenie = str_replace_all(Prosz�.wskaza�.swoje.wykszta�cenie,fixed("�rednie (niemedyczne)") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Prosz�.wskaza�.swoje.wykszta�cenie = str_replace_all(Prosz�.wskaza�.swoje.wykszta�cenie,fixed("podstawowe") , replacement = "Wyksztacenie niemedyczne")) %>%
  mutate(Prosz�.wskaza�.swoje.wykszta�cenie = str_replace_all(Prosz�.wskaza�.swoje.wykszta�cenie,fixed("zawodowe") , replacement = "Wyksztacenie niemedyczne"))

  return(sur_med_2)
}

sur_3_2 <-  med_1()
sur_3_2

edu_1(x = sur_3_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_medical/symptomps.xlsx")


