# Load libraries
library(tidyverse)

glimpse(sur_1)

names(sur_1) = gsub(pattern = "Jak.czêsto.Pani.Pana.zdaniem.poni¿szy.objaw.wystêpuje.w.trakcie.zaka¿enia.COVID.19...", replacement = "", x = names(sur_1))

### Analyze data about symptoms regarding demographic data

#Gender
sur_4 <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoj¹.p³eæ ) %>%
  summarise( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. ) %>%
  count( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. )

#Education
sur_5 <- sur_1 %>%
  group_by(Proszê.wskazaæ.swoje.wykszta³cenie  ) %>%
  summarise( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. ) %>%
  count( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. )

#Children
sur_6 <- sur_1 %>%
  group_by(Czy.posiada.Pan.i.dzieci..  ) %>%
  summarise( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. ) %>%
  count( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. )

#Place of living
sur_7 <- sur_1 %>%
  group_by(Proszê.wskazaæ.wielkoœæ.miejscowoœci..w.której.spêdzi³.a.Pan.Pani.wiêkszoœæ.swojego.¿ycia  ) %>%
  summarise( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. ) %>%
  count( biegunka.,kaszel.,bóle.miêœni., dusznoœæ.,zmêczenie.,zaburzenia.smaku.i.wêchu.,zapalenie.spojówek. )