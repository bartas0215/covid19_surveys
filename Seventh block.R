# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

###Function
edu_7 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(wiek.powy�ej.65..  )
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(wiek.poni�ej.5.  )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(p�e�.m�ska. )
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(p�e�.�e�ska.  )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(palenie.papieros�w.  )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(cukrzyca.  )
  
  sur_4_9 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(choroby.uk�adu.kr��enia..nadci�nienie..niewydolnos�.serca.. )
  
  sur_4_10 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(choroby.uk�adu.oddechowego..Astma..POChP..  )
  
  sur_4_11 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(oty�o��.. )
  
  sur_4_12 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(reumatoidalne.zapalenie.staw�w.  )
  
  sur_4_13 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(zaka�enie.HIV.AIDS. )
  
  sur_4_14 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(choroby.psychiczne. )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7,
                           "Datasheet" = sur_4_8,"Datasheet" = sur_4_9,"Datasheet" = sur_4_10,"Datasheet" = sur_4_11,"Datasheet" = sur_4_12,
                           "Datasheet" = sur_4_13,"Datasheet" = sur_4_14)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,wiek.powy�ej.65..:choroby.psychiczne.)

sur_4_2 <- sur_4_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_7(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Worse_covid/education/wor_covid.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,wiek.powy�ej.65..:choroby.psychiczne.)

edu_7(sur_4_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Worse_covid/gender/wor_covid.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,wiek.powy�ej.65..:choroby.psychiczne.)

sur_4_2 <-  med_1()
sur_4_2

edu_7(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Worse_covid/medical/wor_covid.xlsx")

