# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Czy.uwa¿a.Pan.i..¿e.mo¿na.zakaziæ.siê.koronawirusem.poprzez...", replacement = "", x = names(sur_1))

###Function
edu_4 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(drogê.kropelkow¹.)
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(drogê.powietrzna. )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(droga.fekalno.oralna..kontakt.z.odchodami.np..spo¿ycie.niemytej.¿ywnoœci..)
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakt.z.krwi¹.zaka¿onej.osoby. )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakty.seksualne. )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakt.ze.zwierzêtami.domowymi.gospodarskimi. )
  
  sur_4_9 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(ugryzienie.bezkrêgowca.np..komara..kleszcza..muchê. )
  
  sur_4_10 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(zaka¿enie.p³odu.w.czasie.ci¹¿y. )
  
  sur_4_11 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(karmienie.piersi¹.)
  
  sur_4_12 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(kontakt.bezpoœredni.np..dotykanie.owoców.w.sklepie. )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7,
                           "Datasheet" = sur_4_8,"Datasheet" = sur_4_9,"Datasheet" = sur_4_10,"Datasheet" = sur_4_11,"Datasheet" = sur_4_12)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,drogê.kropelkow¹.:kontakt.bezpoœredni.np..dotykanie.owoców.w.sklepie.)

sur_4_2 <- sur_4_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_4(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission/education/transmission.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,drogê.kropelkow¹.:kontakt.bezpoœredni.np..dotykanie.owoców.w.sklepie.)

edu_4(sur_4_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission/gender/transmission.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,drogê.kropelkow¹.:kontakt.bezpoœredni.np..dotykanie.owoców.w.sklepie.)

sur_4_2 <-  med_1()
sur_4_2

edu_4(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission/medical/transmission.xlsx")

