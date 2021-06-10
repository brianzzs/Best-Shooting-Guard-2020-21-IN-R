library(dplyr)
library(ggplot2)


setwd(#addyours)


players_df <- read.csv(file = "Jogadores_advanced.csv",
                       header = TRUE,
                       sep = ",",
                       na.strings = "",
                       strip.white = TRUE)

SG_advanced <- subset(players_df, Pos == 'SG' & WS > 3.5 & USG. > 28.5, select = c(Player, PER, TS., WS, BPM, USG.))

SG_advanced$Player[SG_advanced$Player == "Bradley Beal\\bealbr01"] <- "Bradley Beal"
SG_advanced$Player[SG_advanced$Player == "Devin Booker\\bookede01"] <- "Devin Booker"
SG_advanced$Player[SG_advanced$Player == "Jaylen Brown\\brownja02"] <- "Jaylen Brown"
SG_advanced$Player[SG_advanced$Player == "Zach LaVine\\lavinza01"] <- "Zach LaVine"
SG_advanced$Player[SG_advanced$Player == "Jordan Clarkson\\clarkjo01"] <- "Jordan Clarkson"

ggplot(data = SG_advanced, aes(x= WS, y= BPM)) + geom_point() + geom_text(
  label = SG_advanced$Player,  nudge_x = 0.35, nudge_y = 0.35, 
  check_overlap = T
) + ggtitle ("+/- Baseado em Winshare", subtitle = "Quanto mais pra direita e pra cima  = melhor")