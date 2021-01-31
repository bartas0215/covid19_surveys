# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Jak.czêsto.w.trakcie.epidemii.wykonuje.Pan.Pani.wskazane.czynnoœci...", replacement = "", x = names(sur_1))

###Function
edu_8 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(wychodzenie.z.domu.do.pracy.  )
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(wychodzenie.na.zakupy.   )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(wychodzenie.do.lekarza..do.apteki. )
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(wyprowadzanie.psa.   )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(spacer.do.parku..lasu.itd...w.okresie.prawnego.zakazu.korzystania.z.tych.miejsc...   )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(noszenie.maseczki.w.miejscu.publicznym..np..na.ulicy....przed.wprowadzeniem.prawnego.obowi¹zku.zakrywania.twarzy.   )
  
  sur_4_9 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(noszenie.rêkawiczek.w.miejscu.publicznym..np..na.ulicy..  )
  
  sur_4_10 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(noszenie.maseczki.w.sklepie..aptece.itd....przed.wprowadzeniem.prawnego.obowi¹zku.zakrywania.twarzy..     )
  
  sur_4_11 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(noszenie.rêkawiczek.w.sklepie..aptece.itd...   )
  
  sur_4_12 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(spotkania.z.rodzin¹.  )
  
  sur_4_13 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(spotkania.ze.znajomymi.   )
  
  sur_4_14 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(uprawianie.sportu.poza.domem.  )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7,
                           "Datasheet" = sur_4_8,"Datasheet" = sur_4_9,"Datasheet" = sur_4_10,"Datasheet" = sur_4_11,"Datasheet" = sur_4_12,
                           "Datasheet" = sur_4_13,"Datasheet" = sur_4_14)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,wychodzenie.z.domu.do.pracy.:uprawianie.sportu.poza.domem. )

sur_4_2 <- sur_4_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

edu_8(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Action_during_covid/education/act_covid.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,wychodzenie.z.domu.do.pracy.:uprawianie.sportu.poza.domem.)

edu_8(sur_4_2$Proszê.wskazaæ.swoj¹.p³eæ,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Action_during_covid/gender/act_covid.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,wychodzenie.z.domu.do.pracy.:uprawianie.sportu.poza.domem.)

sur_4_2 <-  med_1()
sur_4_2

edu_8(sur_4_2$Proszê.wskazaæ.swoje.wykszta³cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Action_during_covid/medical/act_covid.xlsx")

