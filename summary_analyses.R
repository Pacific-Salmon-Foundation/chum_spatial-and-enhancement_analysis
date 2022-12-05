library(tidyverse)
library(ggpubr)

a06cordist <- readRDS("RDS/A06cordist.rds")%>%
  mutate(area="Douglas-Gardner",metric="Z-score")

a06 <- ggplot(a06cordist, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Kitimat enhancement (km)")+
  geom_smooth()

a25cordist <- readRDS("RDS/A25cordist.rds")%>%filter(SYS_NM!="CONUMA RIVER")%>%
  mutate(area="Area 25",metric="Z-score")

a25 <- ggplot(a25cordist, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Conuma enhancement (km)")+
  geom_smooth()+theme_bw()


png(file = "figures/zscore_summary.png")
ggarrange(nrow = 2, a06, a25)
dev.off()

a06cordist_logrps <- readRDS("RDS/A06cordist_logrps.rds")%>%
  mutate(area="Douglas-Gardner",metric="log(RPS)")

a06_logrps <- ggplot(a06cordist_logrps, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Kitimat enhancement (km)")+
  geom_smooth()



a25cordist_logrps <- readRDS("RDS/A25cordist_rpslog.rds")%>%filter(SYS_NM!="CONUMA RIVER")%>%
  mutate(area="Area 25",metric="log(RPS)")

a25_logrps <- ggplot(a25cordist_logrps, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Conuma enhancement (km)")+
  geom_smooth()+
  theme_bw()

png(file = "figures/logrps_summary.png")
ggarrange(nrow = 2, a06_logrps, a25_logrps)
dev.off()

rbind(a06,a25,a06_logrps, a25_logrps)

all<-rbind(a06cordist,a25cordist,a06cordist_logrps,a25cordist_logrps)

all.plot<-ggplot(all,aes(x=dist,y=corcoef))+
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from enhancement (km)")+
  geom_smooth()+
  facet_grid(metric~area,switch="y",scales="free_x")+
  theme_bw()

png(file = "figures/z and logrps_summary.png",res=600,height=6,width=6,units='in')
all.plot
dev.off()
