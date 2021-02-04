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

# Function
filter_fear <- function(x,y,z,q) {

# Filter data
sur_4_3 <- sur_4_2 %>%
  group_by(Proszê.wskazaæ.swoj¹.p³eæ) %>%
  summarise({{x}}) %>%
  count({{x}})
        
# Add additional column
sur_4_6 <- sur_4_3 %>% 
  mutate(Procent = ifelse(str_detect(Proszê.wskazaæ.swoj¹.p³eæ,fixed("mê¿czyzna")), (n/219)*100, (n/1161)*100))

write.xlsx(sur_4_6, file = q)

# Perform plot
plot_fear <-ggplot(sur_4_6,aes(x ={{x}},y= {{y}})) +
  geom_col() + facet_wrap(~Proszê.wskazaæ.swoj¹.p³eæ)

# Save plot
ggsave(plot =plot_fear,filename = z, dpi = 600 , path = "C:/Users/Bartek/Desktop/Ankieta COVID/Plots/gender", device = "png")

}

filter_fear(x =utrata.pracy., y = Procent, z = "1_gender.png", q="C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Fear_covid/gender/1")
filter_fear(x =utrata.w³asnego.zdrowia., y = Procent, z = "2_gender.png",q="C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Fear_covid/gender/2")
filter_fear(x =utrata.zdrowia.bliskiej.osoby., y = Procent, z = "3_gender.png",q="C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Fear_covid/gender/3")
filter_fear(x =kryzys.gospodarczy., y = Procent, z = "4_gender.png",q="C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Fear_covid/gender/4")
filter_fear(x =kryzys.polityczny., y = Procent, z = "5_gender.png",q="C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Fear_covid/gender/5")
filter_fear(x =zwiêkszenie.kontroli.pañstwa.nad.obywatelami., y = Procent, z = "6_gender.png",q="C:/Users/Bartek/Desktop/Ankieta COVID/new_dem/Fear_covid/gender/6")
