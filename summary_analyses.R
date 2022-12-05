library(tidyverse)
library(ggpubr)

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

ggarrange(nrow = 2, a06, a25)

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

ggarrange(nrow = 2, a06_logrps, a25_logrps)
