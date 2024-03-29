# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Jak.ocenia.Pan.Pani.zasadno��.wprowadzonych.ogranicze�...", replacement = "", x = names(sur_1))

###Function
edu_9 <- function(x,y){
  
  sur_4_3 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(limit.klient�w.przebywaj�cych.w.sklepie.w.danym.czasie...3.osoby.na.kas�.)
  
  sur_4_4 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(w.godz..10.12.zakupy.wy��cznie.dla.senior�w.    )
  
  sur_4_5 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(zakaz.wychodzenia.z.domu.przez.osoby..18.r..�..bez.osoby.doros�ej. )
  
  sur_4_6 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count( zachowanie.zalecanego.ost�pu.mi�dzy.osobami.w.miejscu.publicznym.  )
  
  sur_4_7 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(obowi�zek.odbycia.14.dniowej.kwarantanny.po.powrocie.z.zza.granicy.    )
  
  sur_4_8 <- sur_4_2 %>% 
    group_by({{x}}) %>%
    count(ograniczenie.liczby.os�b.przebywaj�cej.w.ko�ciele.   )
  
  # Save data as one file
  
  list_of_datasets <- list("DataSheet" = sur_4_3, "Datasheet" = sur_4_4,"Datasheet" = sur_4_5,"Datasheet" = sur_4_6,"Datasheet" = sur_4_7,"Datasheet" = sur_4_8)
  write.xlsx(list_of_datasets, file = y)
}

####Education (medical studies/non medical studies)

sur_4_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,limit.klient�w.przebywaj�cych.w.sklepie.w.danym.czasie...3.osoby.na.kas�.:ograniczenie.liczby.os�b.przebywaj�cej.w.ko�ciele.)

sur_4_2 <- sur_4_1 %>%
  filter(Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (niemedycznych)" |Prosz�.wskaza�.swoje.wykszta�cenie == "w trakcie studi�w wy�szych (medycznych)")

edu_9(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Restrictions/education/rest_covid.xlsx")

#### Gender

sur_4_2 <- sur_1 %>%
  select( Prosz�.wskaza�.swoj�.p�e� ,limit.klient�w.przebywaj�cych.w.sklepie.w.danym.czasie...3.osoby.na.kas�.:ograniczenie.liczby.os�b.przebywaj�cej.w.ko�ciele.)

edu_9(sur_4_2$Prosz�.wskaza�.swoj�.p�e�,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Restrictions/gender/rest_covid.xlsx")

### Medical vs non-medical

sur_med_1 <- sur_1 %>%
  select( Prosz�.wskaza�.swoje.wykszta�cenie,limit.klient�w.przebywaj�cych.w.sklepie.w.danym.czasie...3.osoby.na.kas�.:ograniczenie.liczby.os�b.przebywaj�cej.w.ko�ciele.)

sur_4_2 <-  med_1()
sur_4_2

edu_9(sur_4_2$Prosz�.wskaza�.swoje.wykszta�cenie,"C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Restrictions/medical/rest_covid.xlsx")

