# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Czy.Pani.Pana.zdaniem.poni�sze.rzeczy.s�.zwi�zane.z.wyst�pieniem.pandemii.COVID.19...", replacement = "", x = names(sur_1))

###Function
edu_11 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(spo�ywanie.surowego.mi�sa.dzikich.zwierz�t.    )
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(rozw�j.sieci.5G.  )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(dzia�anie.maj�ce.na.celu.os�abienie.gospodarki.Chin.     )
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(dzia�anie.rz�du.chi�skiego.wymierzone.przeciw.innym.pot�gom.gospodarczym.  )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(dzia�anie.firm.farmaceutycznych.w.celu.popularyzacji.szczepionki.  )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(nadmierny.rozw�j.mi�dzynarodowych.�rodk�w.transportu.   )
  
  sur_4_9 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(nieprzestrzeganie.zalece�.dot..izolacji.spo�ecznej. )
  
  sur_4_10 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(niedofinansowanie.systemu.ochrony.zdrowia.   )
  
  sur_4_11 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(skupowanie.�rodk�w.ochrony.osobistej.przez.du�e.podmioty.  )
  
  sur_4_12 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(niedob�r.personelu.medycznego. )
  

  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7,
                           "Datasheet" = sur_4_8,"Datasheet" = sur_4_9,"Datasheet" = sur_4_10,"Datasheet" = sur_4_11,"Datasheet" = sur_4_12)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,spo�ywanie.surowego.mi�sa.dzikich.zwierz�t.: niedob�r.personelu.medycznego.   )

sur_4_2 <- sur_4_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_11(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/covid_appearance/education/appear_covid.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,spo�ywanie.surowego.mi�sa.dzikich.zwierz�t.: niedob�r.personelu.medycznego. )

edu_11(sur_4_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/covid_appearance/gender/appear_covid.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,spo�ywanie.surowego.mi�sa.dzikich.zwierz�t.: niedob�r.personelu.medycznego. )

sur_4_2 <-  med_1()
sur_4_2

edu_11(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/covid_appearance/medical/appear_covid.xlsx")

