
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

dg<-rbind(pre,post)%>%mutate(posneg=ifelse(cc<0,"neg","pos"))

ggplot(dg,aes(x=period,y=cc,fill=period))+
  geom_boxplot()

hist(pre$cc)
hist(post$cc)

ggplot(dg,aes(x=cc,fill=posneg))+
  geom_histogram(color="black",bins=50)+
  facet_grid(period~.)


u.pre<-mean(pre$cc,na.rm=TRUE)
sd.pre<-sd(pre$cc,na.rm=TRUE)

u.post<-mean(post$cc,na.rm=TRUE)
sd.post<-sd(post$cc,na.rm=TRUE)

u.pre;sd.pre                         
u.post;sd.post                         


precc<-pre$cc
postcc<-post$cc

t.test(pre$cc,post$cc)


ggplot(escdata.filtered,aes(x=Year,y=z,size=Enhancement_Rank))+
  geom_point()+geom_line()+theme_bw()+
  facet_wrap(~SYS_NM,ncol=3,scale="free_y")+
  labs(y="Escapement",color="Enhancement Level",title="Area 6 Escapement (filtered streams)")+
  theme(legend.position="bottom")

inlets <- read_csv("data/douglas-gardner subinlets.csv")%>%select(SYS_NM,inlet)

f<-escdata.filtered%>%select(Year,SYS_NM,z)

g<-merge(f,inlets,by="SYS_NM")

ggplot(g,aes(x=Year,y=SYS_NM,size=z,color=z))+
  geom_point(alpha=1)+
  labs(y="Escapement",x="Year",size="Z-score")+
  theme_bw()+
  theme(legend.position="bottom")+
  scale_colour_gradient2(low = "red",mid = "white",high = "green",
    midpoint = 0,
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar")+
  #guides(colour = guide_legend(nrow = 4))+
  guides(size = guide_legend(nrow = 4))+ 
  theme(axis.text.y = element_text(size = 6))+
  facet_grid(inlet~.,switch="y",space="free_y",scale="free_y")

merge(f,inlets,by="SYS_NM")

