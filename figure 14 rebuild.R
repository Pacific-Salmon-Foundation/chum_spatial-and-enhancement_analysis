library(tidyverse)
library(ggpubr)

# Area 25 -----------------------------------------------------------------

a25.z <- readRDS('data.fig14/a25.z_all.rds')

pw1<-ggplot(a25.z, aes(distance/1000, zscore, color = prepost)) +
  geom_point(alpha = .6) + theme_bw()+
  geom_line(aes(y = preds), size = 1) +
  labs(x = "", y = "Area 25", title = "Z-scores") +
  scale_color_brewer(palette="Dark2") + 
  geom_hline(yintercept = 0)+ theme(legend.position="none") +
  ylim(-0.75, 1)
pw1


a25.logrps <- readRDS('data.fig14/a25.logrps_all.rds')

pw2<-ggplot(a25.logrps, aes(distance/1000, logrpsscore, color = prepost)) +
  geom_point(alpha = .6) + theme_bw()+
  geom_line(aes(y = preds), size = 1) +
  labs(x = "", y = "", title = "log(RPS)") +
  scale_color_brewer(palette="Dark2") + 
  geom_hline(yintercept = 0)+ theme(legend.position="none") +
  ylim(-0.75, 1)
pw2

a25combined <- ggarrange(pw1,pw2,common.legend = TRUE,legend = "none",ncol=2)



# Area 6 ------------------------------------------------------------------


a6.z <- readRDS('data.fig14/a6.z_all.rds')
pw1<- ggplot(a6.z, aes(distance/1000, zscore, color = prepost)) +
  geom_point(alpha = .6) + theme_bw() +
  geom_line(aes(y = preds), size = 1) +
  labs(x = "", y = "Douglas-Gardner")+
  guides(color=guide_legend(title="Period")) +
  scale_color_brewer(palette="Dark2")+ 
  geom_hline(yintercept = 0) +
  ylim(-0.75, 1)

pw1


a6.logrps <- readRDS('data.fig14/a6.logrps_all.rds')
pw2 <- ggplot(a6.logrps, aes(distance/1000, logrpsscore, color = prepost)) +
  geom_point(alpha = .6) + theme_bw() +
  geom_line(aes(y = preds), size = 1) +
  labs(x = "", y = "")+
  guides(color=guide_legend(title="Period"))+
  scale_color_brewer(palette="Dark2") + 
  geom_hline(yintercept = 0)  +
  ylim(-0.75, 1)

pw2

a6combined <- ggarrange(pw1,pw2, common.legend = TRUE,legend = "bottom",ncol=2)



# Area 8 ------------------------------------------------------------------

a8.z <- readRDS('data.fig14/a8.z_all.rds')
pw1<-ggplot(a8.z, aes(distance/1000, zscore, color = prepost)) +
  geom_point(alpha = .6) + theme_bw()+
  geom_line(aes(y = preds), size = 1) +
  labs(x = "", y = "Area 8")  +
  scale_color_brewer(palette="Dark2") + 
  geom_hline(yintercept = 0)+ theme(legend.position="none")+
  ylim(-0.75, 1)
pw1

a8.logrps <- readRDS('data.fig14/a8.logrps_all.rds')
pw2<-ggplot(a8.logrps, aes(distance/1000, logrpsscore, color = prepost)) +
  geom_point(alpha = .6) +theme_bw()+
  geom_line(aes(y = preds), size = 1) +
  labs(x = "", y = "")+ theme(legend.position="none")+
  scale_color_brewer(palette="Dark2") + geom_hline(yintercept = 0) +
  ylim(-0.75, 1)
pw2

a8combined <- ggarrange(pw1,pw2,common.legend = TRUE,legend = "none",ncol=2)



# Combine plots -----------------------------------------------------------

a <- ggarrange(a25combined, a8combined, a6combined, nrow = 3, common.legend = TRUE, 
          heights = c(1.1, 1, 1.2))

annotate_figure(a, bottom = text_grob("Distance", vjust = -4))

a
