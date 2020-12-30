# Load libraries
library(tidyverse)

glimpse(sur_1)

names(sur_1) = gsub(pattern = "Jak.cz�sto.Pani.Pana.zdaniem.poni�szy.objaw.wyst�puje.w.trakcie.zaka�enia.COVID.19...", replacement = "", x = names(sur_1))

### Analyze data about symptoms regarding demographic data

#Gender
sur_4 <- sur_1 %>%
  group_by(Prosz�.wskaza�.swoj�.p�e� ) %>%
  summarise( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. ) %>%
  count( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. )

#Education
sur_5 <- sur_1 %>%
  group_by(Prosz�.wskaza�.swoje.wykszta�cenie  ) %>%
  summarise( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. ) %>%
  count( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. )

#Children
sur_6 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci..  ) %>%
  summarise( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. ) %>%
  count( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. )

#Place of living
sur_7 <- sur_1 %>%
  group_by(Prosz�.wskaza�.wielko��.miejscowo�ci..w.kt�rej.sp�dzi�.a.Pan.Pani.wi�kszo��.swojego.�ycia  ) %>%
  summarise( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. ) %>%
  count( biegunka.,kaszel.,b�le.mi�ni., duszno��.,zm�czenie.,zaburzenia.smaku.i.w�chu.,zapalenie.spoj�wek. )