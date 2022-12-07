# Plots for standalone figures - Run Area 25 prep and appendix for correct variables

```{r, compute boxplot zscores, message = FALSE, error = FALSE, echo = FALSE, include = FALSE}

pre<-data.frame(cor.z.pre)
pre$stream1<-rownames(pre)
post<-data.frame(cor.z.post)
post$stream1<-rownames(post)
pre<-pre%>%pivot_longer(1:ncol(pre)-1,names_to="stream2",values_to="cc")%>%
  mutate(cc=replace(cc,cc==1,NA),
         area="DG",period="Pre")
post<-post%>%pivot_longer(1:ncol(post)-1,names_to="stream2",values_to="cc")%>%
  mutate(cc=replace(cc,cc==1,NA),
         area="DG",period="Post")
dg.z<-rbind(pre,post)%>%mutate(metric="Z-score")

u.pre<-mean(pre$cc,na.rm=TRUE)
sd.pre<-sd(pre$cc,na.rm=TRUE)
u.post<-mean(post$cc,na.rm=TRUE)
sd.post<-sd(post$cc,na.rm=TRUE)
#u.pre;sd.pre
#u.post;sd.post
precc<-pre$cc
postcc<-post$cc
t.test(pre$cc,post$cc)

```

```{r, compute boxplot logrps, message = FALSE, error = FALSE, echo = FALSE, include = FALSE}

pre <- data.frame(cor.logrps.pre)
pre$stream1<-rownames(pre)
post<-data.frame(cor.logrps.post)
post$stream1<-rownames(post)
pre<-pre%>%pivot_longer(1:ncol(pre)-1,names_to="stream2",values_to="cc")%>%
  mutate(cc=replace(cc,cc==1,NA),
         area="DG",period="Pre")
post<-post%>%pivot_longer(1:ncol(post)-1,names_to="stream2",values_to="cc")%>%
  mutate(cc=replace(cc,cc==1,NA),
         area="DG",period="Post")
dg.rps<-rbind(pre,post)%>%mutate(metric="log(RPS)")

u.pre<-mean(pre$cc,na.rm=TRUE)
sd.pre<-sd(pre$cc,na.rm=TRUE)
u.post<-mean(post$cc,na.rm=TRUE)
sd.post<-sd(post$cc,na.rm=TRUE)
#u.pre;sd.pre
#u.post;sd.post
precc<-pre$cc
postcc<-post$cc
t.test(pre$cc,post$cc)

```

```{r, Correlation plot by z-score distance, echo = FALSE, warning = FALSE, message = FALSE, include = FALSE}

cordist <- as.data.frame(cor.z) %>%
  select(`CONUMA RIVER`)
cordist$SYS_NM <- rownames(cordist)

streamdist <- streaminlet %>%
  select(SYS_NM, distancefromconuma)
colnames(streamdist) <- c("SYS_NM", "dist")
streamdist$dist <- streamdist$dist/1000
cordist <- merge(streamdist, cordist, by = "SYS_NM")
colnames(cordist) <- c("SYS_NM", "dist", "corcoef")

saveRDS(cordist, "RDS/A25cordist.rds")

ggplot(cordist, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Conuma enhancement (km)")+
  geom_smooth()
```

```{r, Correlation plot by logrps distance, echo = FALSE, warning = FALSE, message = FALSE, include = FALSE}

cordist <- as.data.frame(cor.rpslog) %>%
  select(`CONUMA RIVER`)
cordist$SYS_NM <- rownames(cordist)

streamdist <- streaminlet %>%
  select(SYS_NM, distancefromconuma)
colnames(streamdist) <- c("SYS_NM", "dist")
streamdist$dist <- streamdist$dist/1000
cordist <- merge(streamdist, cordist, by = "SYS_NM")
colnames(cordist) <- c("SYS_NM", "dist", "corcoef")

saveRDS(cordist, "RDS/A25cordist_rpslog.rds")

ggplot(cordist, aes(x = dist, y = corcoef)) +
  geom_point() +
  ylab("Correlation coefficient") +
  xlab("Distance from Conuma enhancement (km)")+
  geom_smooth()
```