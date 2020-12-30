# Load libraries
library(tidyverse)

# Load csv data with covid surveys
sur <- read.csv("C:/Users/Bartek/Desktop/Ankieta COVID/COVID19_Odpowiedzi.csv", encoding = "UTF-8")

# Change df to tibble
sur_1 <- as_tibble(sur)

# Check structure 
glimpse(sur_1)

# Delete unnecessary data
sur_1 <- sur_1 %>%
  select(- Oœwiadczam..¿e.przeczyta³am..em.i.zrozumia³am..em.formularz.informacyjnych.dla.osób.bior¹cych.udzia³.w.badaniu.pt...Pandemia.koronawirusa.w.œwiadomoœci.spo³ecznej...Rozpoczynaj¹c.badanie.wyra¿am.dobrowolnie.zgodê.na.udzia³.w.badaniu.i.jestem.œwiadoma.y..i¿.w.ka¿dej.chwili.mogê.zrezygnowaæ.z.udzia³u.w.nim.bez.podania.przyczyny..Zgodnie.z.Rozporz¹dzeniem.Parlamentu.Europejskiego.i.Rady..UE..2016.679.z.dnia.27.kwietnia.2016.r...RODO..wyra¿am.zgodê.na.przetwarzanie.przez.dr.n..biol..Magdalenê.Frydrychowicz..Cezarego.Miedziarka..Bartosza.Nowaka..Szymona.Pe³czyñskiego..Uniwersytet.Medyczny.im..Karola.Marcinkowskiego.w.Poznaniu..moich.danych.osobowych.w.zakresie.i.celu.niezbêdnych.do.przeprowadzenia.powy¿szego.badania.oraz.w.celach.archiwalnych.i.statystycznych..Posiadam.wiedzê.o.dobrowolnoœci.podania.danych.i.przys³uguj¹cym.mi.prawie.dostêpu.do.treœci.danych.dotycz¹cych.mnie..ich.poprawiania..modyfikacji.oraz.skorzystania.z.innych.uprawnieñ.wynikaj¹cych.z.ww..Ustawy.)
sur_1 <- sur_1 %>%
  select(-Sygnatura.czasowa)

# Count number of females and males
count(sur_1,Proszê.wskazaæ.swoj¹.p³eæ )

# Count education 
count(sur_1,Proszê.wskazaæ.swoje.wykszta³cenie )

# Count age
age_1 <- count(sur_1,Proszê.wskazaæ.swój.wiek..liczba. )
print(age_1, n=60)

age_1 %>%
arrange(desc(n))

# Count size of city/village
count(sur_1,Proszê.wskazaæ.wielkoœæ.miejscowoœci..w.której.spêdzi³.a.Pan.Pani.wiêkszoœæ.swojego.¿ycia  )

# Count number of children
count(sur_1,Czy.posiada.Pan.i.dzieci..)

glimpse(sur_1)

sur_2 <- sur_1 %>%
  group_by(c(Jak.czêsto.Pani.Pana.zdaniem.poni¿szy.objaw.wystêpuje.w.trakcie.zaka¿enia.COVID.19...biegunka.,Jak.ocenia.Pan.Pani.zasadnoœæ.wprowadzonych.ograniczeñ...w.godz..10.12.zakupy.wy³¹cznie.dla.seniorów.)) %>%
  summarise(Proszê.wskazaæ.swoj¹.p³eæ ) %>%
  count(Proszê.wskazaæ.swoj¹.p³eæ )

sur_2
sur_3 <- sur_1 %>%
  count()

aggregate(Jak.czêsto.Pani.Pana.zdaniem.poni¿szy.objaw.wystêpuje.w.trakcie.zaka¿enia.COVID.19...biegunka.~Proszê.wskazaæ.swoj¹.p³eæ,FUN=length,data=sur_1)

glimpse(sur_1)

aggregate( Czy.w.zwi¹zku.z.epidemi¹.COVID.19.zmieni³y.siê.Pani.Pana.nawyki.higieniczne...unikanie.dotykania.twarzy.~Proszê.wskazaæ.swoj¹.p³eæ,FUN=length,data=sur_1)

  
