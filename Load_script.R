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
  select(- Oświadczam..że.przeczytałam..em.i.zrozumiałam..em.formularz.informacyjnych.dla.osób.biorących.udział.w.badaniu.pt...Pandemia.koronawirusa.w.świadomości.społecznej...Rozpoczynając.badanie.wyrażam.dobrowolnie.zgodę.na.udział.w.badaniu.i.jestem.świadoma.y..iż.w.każdej.chwili.mogę.zrezygnować.z.udziału.w.nim.bez.podania.przyczyny..Zgodnie.z.Rozporządzeniem.Parlamentu.Europejskiego.i.Rady..UE..2016.679.z.dnia.27.kwietnia.2016.r...RODO..wyrażam.zgodę.na.przetwarzanie.przez.dr.n..biol..Magdalenę.Frydrychowicz..Cezarego.Miedziarka..Bartosza.Nowaka..Szymona.Pełczyńskiego..Uniwersytet.Medyczny.im..Karola.Marcinkowskiego.w.Poznaniu..moich.danych.osobowych.w.zakresie.i.celu.niezbędnych.do.przeprowadzenia.powyższego.badania.oraz.w.celach.archiwalnych.i.statystycznych..Posiadam.wiedzę.o.dobrowolności.podania.danych.i.przysługującym.mi.prawie.dostępu.do.treści.danych.dotyczących.mnie..ich.poprawiania..modyfikacji.oraz.skorzystania.z.innych.uprawnień.wynikających.z.ww..Ustawy.)

sur_1 <- sur_1 %>%
  select(-Sygnatura.czasowa)

# Count number of females and males
count(sur_1,Proszę.wskazać.swoją.płeć)
