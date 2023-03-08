#consolidated figures

z25<-z_all%>%dplyr::select(distance,score=zscore,period=prepost)%>%mutate(area="Area 25",metric="Z-score")
logrps25<-logrps_all%>%dplyr::select(distance,score=logrpsscore,period=prepost)%>%mutate(area="Area 25",metric="log(RPS)")

z8<-z_all%>%dplyr::select(distance,score=zscore,period=prepost,preds)%>%mutate(area="Area 8",metric="Z-score")
logrps8<-logrps_all%>%dplyr::select(distance,score=logrpsscore,period=prepost,preds)%>%mutate(area="Area 8",metric="log(RPS)")

all<-rbind(z8,logrps8)


ggplot(all,aes(x=distance,y=score,color=period))+
  geom_point()+theme_bw()+
  facet_grid(metric~.)+
  geom_line(aes(y=preds),size=1)
  
