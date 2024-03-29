# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Czy.uwa�a.Pan.i..�e.mo�na.zakazi�.si�.koronawirusem.poprzez...", replacement = "", x = names(sur_1))

###Function
edu_4 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(drog�.kropelkow�.)
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(drog�.powietrzna. )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(droga.fekalno.oralna..kontakt.z.odchodami.np..spo�ycie.niemytej.�ywno�ci..)
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakt.z.krwi�.zaka�onej.osoby. )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakty.seksualne. )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakt.ze.zwierz�tami.domowymi.gospodarskimi. )
  
  sur_4_9 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(ugryzienie.bezkr�gowca.np..komara..kleszcza..much�. )
  
  sur_4_10 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(zaka�enie.p�odu.w.czasie.ci��y. )
  
  sur_4_11 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(karmienie.piersi�.)
  
  sur_4_12 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakt.bezpo�redni.np..dotykanie.owoc�w.w.sklepie. )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7,
                           "Datasheet" = sur_4_8,"Datasheet" = sur_4_9,"Datasheet" = sur_4_10,"Datasheet" = sur_4_11,"Datasheet" = sur_4_12)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,drog�.kropelkow�.:kontakt.bezpo�redni.np..dotykanie.owoc�w.w.sklepie.)

sur_4_2 <- sur_4_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_4(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission/education/transmission.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,drog�.kropelkow�.:kontakt.bezpo�redni.np..dotykanie.owoc�w.w.sklepie.)

edu_4(sur_4_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission/gender/transmission.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,drog�.kropelkow�.:kontakt.bezpo�redni.np..dotykanie.owoc�w.w.sklepie.)

sur_4_2 <-  med_1()
sur_4_2

edu_4(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission/medical/transmission.xlsx")

