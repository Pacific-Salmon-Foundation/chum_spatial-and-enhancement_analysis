
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

range(g$z,na.rm=TRUE)

`Z-score` <- c(-3, -2, -1, 0, 1, 2, 3)
shape <- c(21, 21, 21, 20, 19, 19, 19)
cols <- c("red", "red", "red", "black", "blue", "blue", "blue")
shapelkp <- tibble(`Z-score`, shape, cols)
g$`Z-score` <- as.numeric(substr(g$z, 1, 2))
g$size <- abs(g$z)
g <- merge(shapelkp, g, by = "Z-score")
g$`Z-score` <- as.factor(g$`Z-score`)

ggplot(g,aes(x=Year, y=SYS_NM, shape = `Z-score`, size = as.numeric(`Z-score`),color = as.numeric(`Z-score`)))+
  geom_point(alpha=1)+
  scale_shape_manual(values = c("-3" = 1, "-2" = 1, "-1" = 1, "0" = 20, "1" = 21, "2" = 21, "3" = 21)) +
  scale_color_manual(values = c("-3" = "darkred", "-2" = "red4", "-1" = "red1", "0" = "black", "1" = "lightskyblue1", "2" = "royalblue1", "3" = "royalblue4")) +
  labs(y="Escapement",x="Year")+
  theme_bw()+
  theme(legend.position="bottom")+
  scale_colour_gradient2(low = "red",mid = "white",high = "blue",midpoint = 0,space = "Lab",
    na.value = "white",guide = "colourbar")+
  #scale_colour_gradient(low = "firebrick",high = "darkgreen",na.value = "grey50",guide = "colourbar")+
    #guides(colour = guide_legend(nrow = 4))+
  #guides(size = guide_legend(nrow = 4))+ 
  guides(size=FALSE)+
  theme(axis.text.y = element_text(size = 6))+
  guides(shape = guide_legend(ncol = 7))+ 
  facet_grid(inlet~.,switch="y",space="free_y",scale="free_y")

ggplot(g, aes(x = Year, y = SYS_NM, shape = `Z-score`, size = `Z-score`, color = `Z-score`, fill = `Z-score`)) +
  geom_point() +
  scale_size_manual(values = c("-3" = 5, "-2" = 3, "-1" = 2, 
                               "0" = 2, 
                               "1" = 2, "2" = 3, "3" = 5))+
  scale_shape_manual(values = c("-3" = 1, "-2" = 1, "-1" = 1, 
                                "0" = 20, 
                                "1" = 21, "2" = 21, "3" = 21)) +
  scale_color_manual(values = c("-3" = "darkred", "-2" = "red4", "-1" = "red1", 
                                "0" = "black", 
                                "1" = "royalblue1", "2" = "royalblue4", "3" = "royalblue4"))+
  scale_fill_manual(values = c("-3" = "darkred", "-2" = "red4", "-1" = "red1", 
                                "0" = "black", 
                                "1" = "royalblue1", "2" = "royalblue4", "3" = "royalblue4"))+
  labs(y="Escapement",x="Year", legend = "Z-score")+
  theme_bw()+
  theme(legend.position="bottom")+
  guides(size=FALSE)+
  theme(axis.text.y = element_text(size = 6))+
  guides(shape = guide_legend(ncol = 7))+ 
  facet_grid(inlet~.,switch="y",space="free_y",scale="free_y")

ggsave("figures/douglas gardner z scores bubble by inlet.png",dpi=600,height=7,width=6)

merge(f,inlets,by="SYS_NM")

