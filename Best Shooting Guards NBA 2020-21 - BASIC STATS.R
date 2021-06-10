library(ggplot2)


setwd(#addyours)


players_df <- read.csv(file = "Jogadores_basic.csv",
                    header = TRUE,
                    sep = ",",
                    na.strings = "",
                    strip.white = TRUE)

SG_basic <- subset(players_df, Pos == 'SG' & eFG. > 500 & PTS > 1400, select = c(Player, eFG., PTS, AST, STL, BLK, FG.))

SG_basic$Player[SG_basic$Player == "Bradley Beal\\bealbr01"] <- "Bradley Beal"
SG_basic$Player[SG_basic$Player == "Devin Booker\\bookede01"] <- "Devin Booker"
SG_basic$Player[SG_basic$Player == "Jaylen Brown\\brownja02"] <- "Jaylen Brown"
SG_basic$Player[SG_basic$Player == "Zach LaVine\\lavinza01"] <- "Zach LaVine"
SG_basic$Player[SG_basic$Player == "Terry Rozier\\roziete01"] <- "Terry Rozier"
SG_basic$Player[SG_basic$Player == "Collin Sexton\\sextoco01"] <- "Collin Sexton"

factor(SG_basic$Player) #tratamento básico ao nome dos jogadores

print(SG_basic) #conferindo o subset

#grafico 1 (EFG x PTS) 

ggplot(data = SG_basic, aes(x= eFG., y= PTS)) + geom_point() + geom_text(
  label = SG_basic$Player,  nudge_x = 0.35, nudge_y = 0.35, 
  check_overlap = T
) + ggtitle("PURE SCORING (eFG% x PTS)")

#grafico 2  (STL + BLK)

ggplot(data = SG_basic, aes(x= STL, y= BLK)) + geom_point() + geom_text(
  label = SG_basic$Player,  nudge_x = 0.35, nudge_y = 0.35, 
  check_overlap = T
) + ggtitle("BASIC DEFENSE (STL X BLK)")


