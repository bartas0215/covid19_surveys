# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern =  "Czy.uwa¿a.Pan.i..¿e.opisane.osoby.mo¿na.okreœliæ.jako.maj¹ce.kontakt.z.osob¹.zaka¿on¹.koronawirusem...", replacement = "", x = names(sur_1))

###Function
edu_5 <- function(x,y){
  
  sur_3_3 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count( Pozostaj¹ca.w.bezpoœrednim.kontakcie.z.osob¹.chor¹.lub.w.kontakcie.w.odleg³oœci.mniej.ni¿.2.metrów.przez.ponad.15.minut..)
  
  sur_3_4 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Prowadz¹ca.rozmowê.z.osob¹.z.objawami.choroby.twarz¹.w.twarz.przez.d³u¿szy.czas.. )
  
  sur_3_5 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Osoba.zaka¿ona.nale¿y.do.grupy.jej.najbli¿szych.przyjació³.lub.kolegów..  )
  
  sur_3_6 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Osoba.mieszkaj¹ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..   )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_3_3, "Datasheet" = sur_3_4,"Datasheet" = sur_3_5,"Datasheet" = sur_3_6)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_1_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,Pozostaj¹ca.w.bezpoœrednim.kontakcie.z.osob¹.chor¹.lub.w.kontakcie.w.odleg³oœci.mniej.ni¿.2.metrów.przez.ponad.15.minut..:
            Osoba.mieszkaj¹ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..)

sur_3_2 <- sur_1_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_5(sur_3_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission_detail/education/transmission_detail.xlsx")

#### Gender

sur_3_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,Pozostaj¹ca.w.bezpoœrednim.kontakcie.z.osob¹.chor¹.lub.w.kontakcie.w.odleg³oœci.mniej.ni¿.2.metrów.przez.ponad.15.minut..:
            Osoba.mieszkaj¹ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..)

edu_5(x =sur_3_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission_detail/gender/transmission_detail.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,Pozostaj¹ca.w.bezpoœrednim.kontakcie.z.osob¹.chor¹.lub.w.kontakcie.w.odleg³oœci.mniej.ni¿.2.metrów.przez.ponad.15.minut..:
            Osoba.mieszkaj¹ca.w.tym.samym.gospodarstwie.domowym..co.osoba.chora..lub.w.tym.samym.pokoju.hotelowym..)

sur_3_2 <-  med_1()
sur_3_2

edu_5(sur_3_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Transmission_detail/medical/transmission_detail.xlsx")




