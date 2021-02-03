# Load libraries
library(tidyverse)
library(easyPubMed)
library(xlsx)
library(openxlsx)
#Retrieve data structure 
glimpse(sur_1)

names(sur_1) = gsub(pattern = "Proszê.oceniæ.swoje.obawy.dotycz¹ce.poni¿szych.problemów.wynikaj¹cych.z.epidemii..", replacement = "", x = names(sur_1))

sur_4_1 <- sur_1 %>%
  select(Proszê.wskazaæ.swoj¹.p³eæ:Czy.posiada.Pan.i.dzieci.. ,utrata.pracy.:zwiêkszenie.kontroli.pañstwa.nad.obywatelami.)


### Correlation age vs fear

cor_fear <- function(x) {

cor_1 <- cor(sur_4_1$Proszê.wskazaæ.swój.wiek..liczba.,x,
             method = "spearman")
return(cor_1)

}

cor_fear(sur_4_1$utrata.pracy.)
cor_fear(sur_4_1$utrata.w³asnego.zdrowia.)
cor_fear(sur_4_1$utrata.zdrowia.bliskiej.osoby.)
cor_fear(sur_4_1$kryzys.gospodarczy.)
cor_fear(sur_4_1$kryzys.polityczny.)
cor_fear(sur_4_1$zwiêkszenie.kontroli.pañstwa.nad.obywatelami.)

### Gender vs fear 
sur_4_2 <- sur_1 %>%
  select(Proszê.wskazaæ.swoj¹.p³eæ, utrata.pracy.:zwiêkszenie.kontroli.pañstwa.nad.obywatelami.)

# Delete unnecessary data
sur_4_2 <- sur_4_2 %>%
  filter(!str_detect( Proszê.wskazaæ.swoj¹.p³eæ, fixed("inna")))

# Filter data
sur_4_3 <- sur_4_2 %>%
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  summarise(utrata.pracy.) %>%
  count(utrata.pracy.)

# Add additional column
sur_4_5 <- sur_4_3 %>% 
  mutate(Procent = ifelse(str_detect(Proszê.wskazaæ.swoj¹.p³eæ,fixed("mê¿czyzna")), (n/219)*100, (n/1161)*100))

# Perform plot
plot_fear <-ggplot(sur_4_2,aes(x =utrata.pracy.,y= Procent)) +
  geom_col() + facet_wrap(~Proszê.wskazaæ.swoj¹.p³eæ)

# Save plot
ggsave(plot =plot_fear,filename = "1.png", dpi = 600 , path = "C:/Users/Bartek/Desktop/Ankieta COVID/Plots/gender", device = "png")


