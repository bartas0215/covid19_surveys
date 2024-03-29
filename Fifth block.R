# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern =  "Czy.uwa�a.Pan.i..�e.opisane.osoby.mo�na.okre�li�.jako.maj�ce.kontakt.z.osob�.zaka�on�.koronawirusem...", replacement = "", x = names(sur_1))

###Function
edu_5 <- function(x,y){
  
  sur_3_3 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count( Pozostaj�ca.w.bezpo�rednim.kontakcie.z.osob�.chor�.lub.w.kontakcie.w.odleg�o�ci.mniej.ni�.2.metr�w.przez.ponad.15.minut..)
  
  sur_3_4 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Prowadz�ca.rozmow�.z.osob�.z.objawami.choroby.twarz�.w.twarz.przez.d�u�szy.czas.. )
  
  sur_3_5 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Osoba.zaka�ona.nale�y.do.grupy.jej.najbli�szych.przyjaci�.lub.koleg�w..  )
  
  sur_3_6 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Osoba.mieszkaj�ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..   )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_3_3, "Datasheet" = sur_3_4,"Datasheet" = sur_3_5,"Datasheet" = sur_3_6)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_1_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,Pozostaj�ca.w.bezpo�rednim.kontakcie.z.osob�.chor�.lub.w.kontakcie.w.odleg�o�ci.mniej.ni�.2.metr�w.przez.ponad.15.minut..:
            Osoba.mieszkaj�ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..)

sur_3_2 <- sur_1_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_5(sur_3_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission_detail/education/transmission_detail.xlsx")

#### Gender

sur_3_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,Pozostaj�ca.w.bezpo�rednim.kontakcie.z.osob�.chor�.lub.w.kontakcie.w.odleg�o�ci.mniej.ni�.2.metr�w.przez.ponad.15.minut..:
            Osoba.mieszkaj�ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..)

edu_5(x =sur_3_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission_detail/gender/transmission_detail.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,Pozostaj�ca.w.bezpo�rednim.kontakcie.z.osob�.chor�.lub.w.kontakcie.w.odleg�o�ci.mniej.ni�.2.metr�w.przez.ponad.15.minut..:
            Osoba.mieszkaj�ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..)

sur_3_2 <-  med_1()
sur_3_2

edu_5(sur_3_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission_detail/medical/transmission_detail.xlsx")




