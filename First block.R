# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Jak.czêsto.Pani.Pana.zdaniem.poni¿szy.objaw.wystêpuje.w.trakcie.zaka¿enia.COVID.19...", replacement = "", x = names(sur_1))

####Education (medical studies/non medical studies)

sur_1_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,biegunka.:zapalenie.spojówek.)

sur_1_2 <- sur_1_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (niemedycznych)" |Proszê.wskazaæ.swoje.wykszta³cenie == "w trakcie studiów wy¿szych (medycznych)")

glimpse(sur_1_2)

# Counting symptomps
sur_1_3 <- sur_1_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(biegunka.)

sur_1_4 <- sur_1_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(kaszel.)

sur_1_5 <- sur_1_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(bóle.miêœni.)

sur_1_6 <- sur_1_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(dusznoœæ.)

sur_1_7 <- sur_1_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(zmêczenie.)

sur_1_8 <- sur_1_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(zaburzenia.smaku.i.wêchu. )

sur_1_9 <- sur_1_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(zapalenie.spojówek. )


# Save data as one file

list_of_datasets <- list("DataSheet" = sur_1_3, "Datasheet" = sur_1_4,"Datasheet" = sur_1_5,"Datasheet" = sur_1_6,"Datasheet" = sur_1_7,
                         "Datasheet" = sur_1_8,"Datasheet" = sur_1_9)
write.xlsx(list_of_datasets, file = "C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_education/symptomps.xlsx")

#### Gender

sur_2_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoj¹.p³eæ ,biegunka.:zapalenie.spojówek.)

# Counting symptomps
sur_2_3 <- sur_2_1 %>% 
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  count(biegunka.)

sur_2_4 <- sur_2_1 %>% 
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  count(kaszel.)

sur_2_5 <- sur_2_1 %>% 
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  count(bóle.miêœni.)

sur_2_6 <- sur_2_1 %>% 
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  count(dusznoœæ.)

sur_2_7 <- sur_2_1 %>% 
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  count(zmêczenie.)

sur_2_8 <- sur_2_1 %>% 
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  count(zaburzenia.smaku.i.wêchu. )

sur_2_9 <- sur_2_1 %>% 
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  count(zapalenie.spojówek. )


# Save data as one file

list_of_datasets <- list("DataSheet" = sur_2_3, "Datasheet" = sur_2_4,"Datasheet" = sur_2_5,"Datasheet" = sur_2_6,"Datasheet" = sur_2_7,
                         "Datasheet" = sur_2_8,"Datasheet" = sur_2_9)
write.xlsx(list_of_datasets, file = "C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_gender/symptomps.xlsx")


### Medical vs non-medical

sur_3_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swoje.wykszta³cenie,biegunka.:zapalenie.spojówek.)

sur_3_2 <- sur_3_1 %>%
  filter(Proszê.wskazaæ.swoje.wykszta³cenie == "wy¿sze (medyczne)" |Proszê.wskazaæ.swoje.wykszta³cenie == "wy¿sze (niemedyczne)")

glimpse(sur_3_2)

# Counting symptomps
sur_3_3 <- sur_3_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(biegunka.)

sur_3_4 <- sur_3_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(kaszel.)

sur_3_5 <- sur_3_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(bóle.miêœni.)

sur_3_6 <- sur_3_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(dusznoœæ.)

sur_3_7 <- sur_3_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(zmêczenie.)

sur_3_8 <- sur_3_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(zaburzenia.smaku.i.wêchu. )

sur_3_9 <- sur_3_2 %>% 
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie) %>%
  count(zapalenie.spojówek. )


# Save data as one file

list_of_datasets <- list("DataSheet" = sur_3_3, "Datasheet" = sur_3_4,"Datasheet" = sur_3_5,"Datasheet" = sur_3_6,"Datasheet" = sur_3_7,
                         "Datasheet" = sur_3_8,"Datasheet" = sur_3_9)
write.xlsx(list_of_datasets, file = "C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/symptomps_medical/symptomps.xlsx")


### Correlation_age

sur_4_1 <- sur_1 %>%
  select( Proszê.wskazaæ.swój.wiek..liczba. ,biegunka.:zapalenie.spojówek.)

# Counting symptomps
sur_4_3 <- sur_4_1 %>% 
  group_by(Proszê.wskazaæ.swój.wiek..liczba.) %>%
  count(biegunka.)

cor_4_3 <- cor(sur_4_3$Proszê.wskazaæ.swój.wiek..liczba.,sur_4_3$n,
             method = "spearman")
cor_4_3

sur_4_4 <- sur_4_1 %>% 
  group_by(Proszê.wskazaæ.swój.wiek..liczba.) %>%
  count(kaszel.)

sur_4_5 <- sur_4_1 %>% 
  group_by(Proszê.wskazaæ.swój.wiek..liczba.) %>%
  count(bóle.miêœni.)

sur_4_6 <- sur_4_1 %>% 
  group_by(Proszê.wskazaæ.swój.wiek..liczba.) %>%
  count(dusznoœæ.)

sur_4_7 <- sur_4_1 %>% 
  group_by(Proszê.wskazaæ.swój.wiek..liczba.) %>%
  count(zmêczenie.)

sur_4_8 <- sur_4_1 %>% 
  group_by(Proszê.wskazaæ.swój.wiek..liczba.) %>%
  count(zaburzenia.smaku.i.wêchu. )

sur_4_9 <- sur_4_1 %>% 
  group_by(Proszê.wskazaæ.swój.wiek..liczba.) %>%
  count(zapalenie.spojówek. )

