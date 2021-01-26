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
    count(myd³o.)
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(œrodek.do.dezynfekcji.na.bazie.alkoholu..)
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(œrodek.do.dezynfekcji.bez.dodatku.alkoholu.)
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(rozpylanie.alkoholu.lub.chloru.na.ca³e.cia³o.)
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(stosowanie.suszarki.do.r¹k.  )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(stosowanie.lampy.dezynfekuj¹cej.na.promienie.UV. )
  
  sur_4_9 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(szczepionki.przeciwko.zapaleniu.p³uc..przeciw.pneumokokom.i.H..influenzae.b..  )
 
   sur_4_10 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(regularne.p³ukanie.nosa.sol¹.fizjologiczn¹. )
 
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
  select( Proszê.wskazaæ.swoje.wykszta³cenie,myd³o.:jedzenie.czosnku.)

sur_4_2 <- sur_4_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_1(x =sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Precautions/education/precations.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,myd³o.:jedzenie.czosnku.)

edu_2(x =sur_4_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Precautions/gender/precations.xlsx")

### Medical vs non-medical

sur_4_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,myd³o.:jedzenie.czosnku.)

sur_4_2 <- sur_4_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "wy¿sze (medyczne)" |Proszê.wskazaæ.swoje.wykszta³cenie == "wy¿sze (niemedyczne)")

edu_2(x =sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Precautions/medical/precautions.xlsx")

