#consolidated figures

library(RColorBrewer)

z25<-z_all%>%dplyr::select(distance,score=zscore,period=prepost)%>%mutate(area="Area 25",metric="Z-score")
logrps25<-logrps_all%>%dplyr::select(distance,score=logrpsscore,period=prepost)%>%mutate(area="Area 25",metric="log(RPS)")

z8<-z_all%>%dplyr::select(distance,score=zscore,period=prepost,preds)%>%mutate(area="Area 8",metric="Z-score")
logrps8<-logrps_all%>%dplyr::select(distance,score=logrpsscore,period=prepost,preds)%>%mutate(area="Area 8",metric="log(RPS)")

z6<-z_all%>%dplyr::select(distance,score=zscore,period=prepost,preds)%>%mutate(area="Area 6",metric="Z-score")
logrps6<-logrps_all%>%dplyr::select(distance,score=logrpsscore,period=prepost,preds)%>%mutate(area="Area 6",metric="log(RPS)")


all<-rbind(z8,logrps8)

a25 <- rbind(z25, logrps25)
a8 <- rbind(z8, logrps8)
a6 <- rbind(z6, logrps6)

a25c <- readRDS("RDS/a25combined.rds")
a8c <- readRDS("RDS/a8combined.rds")
a6c <- readRDS("RDS/a6combined.rds")

a<- ggarrange(a25c, a8c, a6c, nrow = 3, common.legend = TRUE, 
          heights = c(1.1, 1, 1.2))

annotate_figure(a, bottom = text_grob("Distance", vjust = -4))






a6c








a25plot <- ggplot(a25,aes(x=distance,y=score,color=period))+
  geom_point()+theme_bw()+
  facet_grid(metric~.)
a25plot

a8plot <- ggplot(a8,aes(x=distance,y=score,color=period))+
  geom_point()+theme_bw()+
  facet_grid(metric~.)

a6plot <- ggplot(a6,aes(x=distance,y=score,color=period))+
  geom_point()+theme_bw()+
  facet_grid(metric~.)

ggarrange(a25plot, a8plot, a6plot, nrow = 1, ncol = 3)  
