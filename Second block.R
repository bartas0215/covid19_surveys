# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

###Function
edu_2 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(myd�o.)
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(�rodek.do.dezynfekcji.na.bazie.alkoholu..)
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(�rodek.do.dezynfekcji.bez.dodatku.alkoholu.)
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(rozpylanie.alkoholu.lub.chloru.na.ca�e.cia�o.)
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(stosowanie.suszarki.do.r�k.  )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(stosowanie.lampy.dezynfekuj�cej.na.promienie.UV. )
  
  sur_4_9 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(szczepionki.przeciwko.zapaleniu.p�uc..przeciw.pneumokokom.i.H..influenzae.b..  )
 
   sur_4_10 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(regularne.p�ukanie.nosa.sol�.fizjologiczn�. )
 
   sur_4_11 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(jedzenie.czosnku.)
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7,
                           "Datasheet" = sur_4_8,"Datasheet" = sur_4_9,"Datasheet" = sur_4_10,"Datasheet" = sur_4_11)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,myd�o.:jedzenie.czosnku.)

sur_4_2 <- sur_4_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_2(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Precautions/education/precations.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,myd�o.:jedzenie.czosnku.)

edu_2(sur_4_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Precautions/gender/precautions.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,myd�o.:jedzenie.czosnku.)

sur_4_2 <-  med_1()
sur_4_2

edu_2(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Precautions/medical/precautions.xlsx")

