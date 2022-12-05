library(tidyverse)
library(ggpubr)

# Correlations by z-score by distance

a06cordist <- readRDS("RDS/A06cordist.rds")

a06 <- ggplot(a06cordist, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Kitimat enhancement (km)")+
  geom_smooth()

a25cordist <- readRDS("RDS/A25cordist.rds")

a25 <- ggplot(a25cordist, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Conuma enhancement (km)")+
  geom_smooth()


png(file = "figures/zscore_summary.png")
ggarrange(nrow = 2, a06, a25)
dev.off()

# Correlations by log RPS by distance

a06cordist_logrps <- readRDS("RDS/A06cordist_logrps.rds")

a06_logrps <- ggplot(a06cordist_logrps, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Kitimat enhancement (km)")+
  geom_smooth()


a25cordist_logrps <- readRDS("RDS/A25cordist_rpslog.rds")

a25_logrps <- ggplot(a25cordist_logrps, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Conuma enhancement (km)")+
  geom_smooth()

png(file = "figures/logrps_summary.png")
ggarrange(nrow = 2, a06_logrps, a25_logrps)
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