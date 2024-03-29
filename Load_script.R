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
  select(- O�wiadczam..�e.przeczyta�am..em.i.zrozumia�am..em.formularz.informacyjnych.dla.os�b.bior�cych.udzia�.w.badaniu.pt...Pandemia.koronawirusa.w.�wiadomo�ci.spo�ecznej...Rozpoczynaj�c.badanie.wyra�am.dobrowolnie.zgod�.na.udzia�.w.badaniu.i.jestem.�wiadoma.y..i�.w.ka�dej.chwili.mog�.zrezygnowa�.z.udzia�u.w.nim.bez.podania.przyczyny..Zgodnie.z.Rozporz�dzeniem.Parlamentu.Europejskiego.i.Rady..UE..2016.679.z.dnia.27.kwietnia.2016.r...RODO..wyra�am.zgod�.na.przetwarzanie.przez.dr.n..biol..Magdalen�.Frydrychowicz..Cezarego.Miedziarka..Bartosza.Nowaka..Szymona.Pe�czy�skiego..Uniwersytet.Medyczny.im..Karola.Marcinkowskiego.w.Poznaniu..moich.danych.osobowych.w.zakresie.i.celu.niezb�dnych.do.przeprowadzenia.powy�szego.badania.oraz.w.celach.archiwalnych.i.statystycznych..Posiadam.wiedz�.o.dobrowolno�ci.podania.danych.i.przys�uguj�cym.mi.prawie.dost�pu.do.tre�ci.danych.dotycz�cych.mnie..ich.poprawiania..modyfikacji.oraz.skorzystania.z.innych.uprawnie�.wynikaj�cych.z.ww..Ustawy.)
sur_1 <- sur_1 %>%
  select(-Sygnatura.czasowa)

# Count number of females and males
count(sur_1,Prosz�.wskaza�.swoj�.p�e� )

# Count education 
count(sur_1,Prosz�.wskaza�.swoje.wykszta�cenie )

# Count age
age_1 <- count(sur_1,Prosz�.wskaza�.sw�j.wiek..liczba. )
print(age_1, n=60)

age_1 %>%
arrange(desc(n))

# Count size of city/village
count(sur_1,Prosz�.wskaza�.wielko��.miejscowo�ci..w.kt�rej.sp�dzi�.a.Pan.Pani.wi�kszo��.swojego.�ycia  )

# Count number of children
count(sur_1,Czy.posiada.Pan.i.dzieci..)

glimpse(sur_1)

sur_2 <- sur_1 %>%
  group_by(c(Jak.cz�sto.Pani.Pana.zdaniem.poni�szy.objaw.wyst�puje.w.trakcie.zaka�enia.COVID.19...biegunka.,Jak.ocenia.Pan.Pani.zasadno��.wprowadzonych.ogranicze�...w.godz..10.12.zakupy.wy��cznie.dla.senior�w.)) %>%
  summarise(Prosz�.wskaza�.swoj�.p�e� ) %>%
  count(Prosz�.wskaza�.swoj�.p�e� )

sur_2
sur_3 <- sur_1 %>%
  count()

aggregate(Jak.cz�sto.Pani.Pana.zdaniem.poni�szy.objaw.wyst�puje.w.trakcie.zaka�enia.COVID.19...biegunka.~Prosz�.wskaza�.swoj�.p�e�,FUN=length,data=sur_1)

glimpse(sur_1)

aggregate( Czy.w.zwi�zku.z.epidemi�.COVID.19.zmieni�y.si�.Pani.Pana.nawyki.higieniczne...unikanie.dotykania.twarzy.~Prosz�.wskaza�.swoj�.p�e�,FUN=length,data=sur_1)

  
