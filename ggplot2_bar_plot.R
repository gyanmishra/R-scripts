library(ggplot2)
library(reshape)


test = matrix(c(222, 42, 23, 144),nrow=2, ncol=2) 
colnames(test) <- c("ctrl","treated")
rownames(test) <- c("Up","Down")

dfm <- melt(test)

ggplot(dfm,aes(x = X1,y = value,fill=X2)) +
  geom_bar(position="stack",width=0.8,stat="identity") +#,aes(fill=value))+
  scale_x_discrete(limits = positions) +
  #scale_y_continuous(expand = c(0,0),limits = c(0,200))+
  #scale_x_discrete(limit = c("Up", "Down"), labels = c("",""))+
  #geom_text(aes(label = value,group = value),colour="black", ,size = 5, hjust = 0.5, vjust = 1, position=position_stack(vjust = 0.5))+
  #scale_fill_discrete(name="Distance to TSS",breaks=c("Uns", "Promoter"),labels=c("< -1000\n>\t300", "-1000 to 300"))
  guides(fill=guide_legend(title="",label.theme = element_text(angle = 0,size = 10))) +
  #ylim(0,400)+
  theme_classic(base_size = 20) +
  theme(axis.title.x=element_text(size=7),
        axis.line.x = element_line(color="black", size = 1),
        axis.line.y = element_line(color="black", size = 1),
        axis.text.y=element_text(size=15,colour = "black"),
        axis.text.x=element_text(size=15,colour = "black"),
        legend.position = c(0.3,0.9),
        legend.title = element_text(colour="black", size=7),
        plot.title=element_text(size=10, face="bold", color="black")) +
 # scale_fill_hue(l=10) 
  scale_fill_manual(values=c("red","blue")) 
