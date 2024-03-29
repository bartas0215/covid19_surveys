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
    count(Terapia.COVID.19.polega.na.leczeniu.objaw�w.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor�czkowe...)
  
  sur_3_4 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Istnieje.skuteczny.lek.niszcz�cy.koronawirusa.. )
  
  sur_3_5 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Przyjmowanie.ibuprofenu.pogarsza.przebieg.choroby.. )
  
  sur_3_6 <- sur_3_2 %>% 
    group_by({{x}}) %>%
    count(Przyjmowanie.witaminy.C.w.du�ych.dawkach.poprawia.przebieg.choroby..    )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_3_3, "Datasheet" = sur_3_4,"Datasheet" = sur_3_5,"Datasheet" = sur_3_6)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_1_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,Terapia.COVID.19.polega.na.leczeniu.objaw�w.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor�czkowe...:Przyjmowanie.witaminy.C.w.du�ych.dawkach.poprawia.przebieg.choroby..)

sur_3_2 <- sur_1_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_3(sur_3_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Statement/education/statement.xlsx")

#### Gender

sur_3_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,Terapia.COVID.19.polega.na.leczeniu.objaw�w.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor�czkowe...:Przyjmowanie.witaminy.C.w.du�ych.dawkach.poprawia.przebieg.choroby..)

edu_3(x =sur_3_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Statement/gender/statement.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,Terapia.COVID.19.polega.na.leczeniu.objaw�w.tej.choroby..np..wspomaganie.oddychania..leczenie.przeciwgor�czkowe...:Przyjmowanie.witaminy.C.w.du�ych.dawkach.poprawia.przebieg.choroby..)

sur_3_2 <-  med_1()
sur_3_2

edu_3(sur_3_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_medical/symptomps.xlsx")




