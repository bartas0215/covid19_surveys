# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

###Function
edu_3 <- function(x,y){
  
  sur_3_3 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Terapia.COVID.19.polega.na.leczeniu.objawów.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor¹czkowe...)
  
  sur_3_4 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Istnieje.skuteczny.lek.niszcz¹cy.koronawirusa.. )
  
  sur_3_5 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )
  
  sur_3_6 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Przyjmowanie.witaminy.C.w.du¿ych.dawkach.poprawia.przebieg.choroby..    )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_3_3, "Datasheet" = sur_3_4,"Datasheet" = sur_3_5,"Datasheet" = sur_3_6)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_1_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,Terapia.COVID.19.polega.na.leczeniu.objawów.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor¹czkowe...:Przyjmowanie.witaminy.C.w.du¿ych.dawkach.poprawia.przebieg.choroby..)

sur_3_2 <- sur_1_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_3(sur_3_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Statement/education/statement.xlsx")

#### Gender

sur_3_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,Terapia.COVID.19.polega.na.leczeniu.objawów.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor¹czkowe...:Przyjmowanie.witaminy.C.w.du¿ych.dawkach.poprawia.przebieg.choroby..)

edu_3(x =sur_3_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Statement/gender/statement.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,Terapia.COVID.19.polega.na.leczeniu.objawów.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor¹czkowe...:Przyjmowanie.witaminy.C.w.du¿ych.dawkach.poprawia.przebieg.choroby..)

sur_3_2 <-  med_1()
sur_3_2

edu_3(sur_3_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_medical/symptomps.xlsx")




