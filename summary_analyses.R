library(tidyverse)
library(ggpubr)

a06cordist <- readRDS("RDS/A06cordist.rds")%>%
  mutate(area="Douglas-Gardner",metric="Z-score")

# Correlations by z-score by distance

a06cordist <- readRDS("RDS/A06cordist.rds")


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

# Correlations by log RPS by distance

a06cordist_logrps <- readRDS("RDS/A06cordist_logrps.rds")


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

# Boxplots of z-score pre- and post-1980

a25_z_dg <- readRDS("RDS/a25_z_dg.rds")

a25_z_box <- ggplot(a25_z_dg,aes(x=period,y=cc,fill=period))+
  geom_boxplot() +
  xlab("Period") +
  ylab("Correlation coefficient")

a08_z_dg <- readRDS("RDS/a08_z_dg.rds")

a08_z_box <- ggplot(a08_z_dg,aes(x=period,y=cc,fill=period))+
  geom_boxplot() +
  xlab("Period") +
  ylab("Correlation coefficient")

a06_z_dg <- readRDS("RDS/a06_z_dg.rds")

a06_z_box <- ggplot(a06_z_dg,aes(x=period,y=cc,fill=period))+
  geom_boxplot() +
  xlab("Period") +
  ylab("Correlation coefficient")

png(file = "figures/z_boxplots_summary.png")
ggarrange(ncol = 3, a25_z_box, a08_z_box, a06_z_box, labels = c("Area 25", "Area 8", "Area 6"))
dev.off()


# Boxplots of log RPS pre- and post-1980

a25_logrps_dg <- readRDS("RDS/a25_logrps_dg.rds")

a25_logrps_box <- ggplot(a25_logrps_dg,aes(x=period,y=cc,fill=period))+
  geom_boxplot() +
  xlab("Period") +
  ylab("Correlation coefficient")

a08_logrps_dg <- readRDS("RDS/a08_logrps_dg.rds")

a08_logrps_box <- ggplot(a08_logrps_dg,aes(x=period,y=cc,fill=period))+
  geom_boxplot() +
  xlab("Period") +
  ylab("Correlation coefficient")

a06_logrps_dg <- readRDS("RDS/a06_logrps_dg.rds")

a06_logrps_box <- ggplot(a06_logrps_dg,aes(x=period,y=cc,fill=period))+
  geom_boxplot() +
  xlab("Period") +
  ylab("Correlation coefficient")

png(file = "figures/logrps_boxplots_summary.png")
ggarrange(ncol = 3, a25_logrps_box, a08_logrps_box, a06_logrps_box, labels = c("Area 25", "Area 8", "Area 6"))
dev.off()

#one combined boxplot

a25.z<-a25_z_dg%>%mutate(metric="Z-score",area="Area 25")
a8.z<-a08_z_dg%>%mutate(metric="Z-score",area="Area 8")
dg.z<-a06_z_dg%>%mutate(metric="Z-score",area="Douglas-Gardner")

a25.rps<-a25_logrps_dg%>%mutate(metric="log(RPS)",area="Area 25")
a08.rps<-a08_logrps_dg%>%mutate(metric="log(RPS)",area="Area 8")
dg.rps<-a06_logrps_dg%>%mutate(metric="log(RPS)",area="Douglas-Gardner")

all.bp<-rbind(a25.z,a8.z,dg.z,a25.rps,a08.rps,dg.rps)

all.bp.plot <- ggplot(all.bp,aes(x=factor(period,levels=c("Pre","Post")),y=cc,fill=period))+
  geom_boxplot() +
  xlab("Period") + 
  ylab("Correlation coefficient")+labs(fill="Period")+
  facet_grid(factor(metric,levels=c("Z-score","log(RPS)"))~area,switch="y")+theme_bw()+
  scale_fill_brewer(palette="Set1",breaks=c("Pre","Post"))
  

png(file = "figures/z and logrps_summary boxplot corr coef.png",res=600,height=6,width=6,units='in')
all.bp.plot
dev.off()

