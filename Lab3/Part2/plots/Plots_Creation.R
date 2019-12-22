setwd("~/Desktop")
dir.create("plots")

u=read.csv("area.csv", header=FALSE)
setwd('./plots')

#After having set all empty cells to zeros, all text cells to zeros as well
#and the pat_res.txt cells into 64 (they correspond to initial simulations
#with low cache_size), we can use this summation to create our data.frame
area=data.frame(matrix(0, ncol = 9, nrow = 738))
for (i in seq(from=1, to=1476, by=2)){
  area[(i+1)/2,]=u[i,]+u[i+1,]
}
u=read.csv("subthreshold.csv", header=FALSE)
subthreshold=data.frame(matrix(0, ncol = 9, nrow = 738))
for (i in seq(from=1, to=1476, by=2)){
  subthreshold[(i+1)/2,]=u[i,]+u[i+1,]
}
u=read.csv("peaks.csv", header=FALSE)
peak=data.frame(matrix(0, ncol = 9, nrow = 738))
for (i in seq(from=1, to=1476, by=2)){
  peak[(i+1)/2,]=u[i,]+u[i+1,]
}  
u=read.csv("gate.csv", header=FALSE)
gate=data.frame(matrix(0, ncol = 9, nrow = 738))
for (i in seq(from=1, to=1476, by=2)){
  gate[(i+1)/2,]=u[i,]+u[i+1,]
}

u=read.csv("runtime.csv", header=FALSE)
runtime=data.frame(matrix(0, ncol = 9, nrow = 738))
for (i in seq(from=1, to=1476, by=2)){
  runtime[(i+1)/2,]=u[i,]+u[i+1,]
}

setwd("~/my_gem5/spec_results/Results/CSV_round1")
sjeng=read.csv("sjeng.csv", header=TRUE)
setwd("~/my_gem5/spec_results/Results/CSV_round2")
sjeng_2=read.csv("res_sjeng_2.csv", header=TRUE)
setwd("~/my_gem5/spec_results/Results/CSV_round1")
sjeng_1_new=read.csv("sjeng_1_new.csv", header=TRUE)
sjeng_tot=unique(rbind(sjeng_1_new,sjeng_2))

#Now, they all have 738 combinations and 2 columns of results
#We will combine them into one final data.frame

mcpat_data=data.frame(matrix(0, ncol = 15, nrow = 738))
names(mcpat_data)=c("I_s",'D_s','L2_s','I_a','D_a','L2_a','Block','Area_core',
                    'Area_L2','Mean_P_Core','Mean_P_L2','Peak_P_Core','Peak_P_L2',
                    'Delay','EDAP')
mcpat_data[,1:7]=area[,3:9]
mcpat_data[,8:9]=area[,1:2]
mcpat_data[,10:11]=runtime[,1:2]+subthreshold[,1:2]+runtime[,1:2]
mcpat_data[,12:13]=peak[,1:2]

delay=data.frame(matrix(0, ncol = 1, nrow = 738))
for (i in seq(738)){
  delay[i,1]=sjeng_tot[sjeng_tot$I_size==mcpat_data$I_s[i] &
                         sjeng_tot$D_size==mcpat_data$D_s[i] &
                         sjeng_tot$L2_size==mcpat_data$L2_s[i] &
                         sjeng_tot$I_assoc==mcpat_data$I_a[i] &
                         sjeng_tot$D_assoc==mcpat_data$D_a[i] &
                         sjeng_tot$L2_assoc==mcpat_data$L2_a[i] &
                         sjeng_tot$cache_line==mcpat_data$Block[i],8]
}  

mcpat_data[,14]=delay
mcpat_data[,15]=mcpat_data[,8]*mcpat_data[,10]*mcpat_data[,14]*mcpat_data[,14]+ mcpat_data[,9]*mcpat_data[,11]*mcpat_data[,14]*mcpat_data[,14]

#now we have all we need in the mcpat_data frame in order to plot.
  x=mcpat_data$D_s+mcpat_data$I_s;xlab='L1Size';xticks=unique(x);
  y=mcpat_data$Area_core;ylab='CoreArea';ytick=unique(y);yticks=c(min(ytick),max(ytick));
  png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
  plot(x, y, log='x',xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
        main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
  axis(2,at=yticks,cex.axis=0.9, las=1)
  axis(1,at=xticks,cex.axis=0.75, las=1)
  dev.off()
  
    
    x=(mcpat_data$D_a+mcpat_data$I_a)/2;xlab='L1Assoc';xticks=unique(x);
    y=mcpat_data$Area_core;ylab='CoreArea';ytick=unique(y);yticks=c(min(ytick),max(ytick));
    png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
    plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
         main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
    axis(2,at=yticks,cex.axis=0.9, las=1)
    axis(1,at=xticks,cex.axis=0.75, las=1)
    dev.off()
    
        x=mcpat_data$L2_s;xlab='L2Size';xticks=unique(x);
        y=mcpat_data$Area_L2;ylab='L2Area';ytick=unique(y);yticks=c(min(ytick),max(ytick));
        png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
        plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab, log='x',
             main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
        axis(2,at=yticks,cex.axis=0.9, las=1)
        axis(1,at=xticks,cex.axis=0.75, las=1)
        dev.off()
        
        x=mcpat_data$L2_a;xlab='L2Assoc';xticks=unique(x);
        y=mcpat_data$Area_L2;ylab='L2Area';ytick=unique(y);yticks=c(min(ytick),max(ytick));
        png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
        plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
             main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
        axis(2,at=yticks,cex.axis=0.9, las=1)
        axis(1,at=xticks,cex.axis=0.75, las=1)
        dev.off()
        
        
        x=mcpat_data$D_s+mcpat_data$I_s+mcpat_data$L2_s;xlab='TotalSize';xticks=unique(x);
        y=mcpat_data$Area_core+mcpat_data$Area_L2;ylab='TotalArea';ytick=unique(y);yticks=c(min(ytick),max(ytick));
        png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
        plot(x, y,log='x',xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
             main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
        axis(2,at=yticks,cex.axis=0.9, las=1)
        axis(1,at=xticks,cex.axis=0.75, las=1)
        dev.off()
        
        
        x=(mcpat_data$D_a+mcpat_data$I_a+mcpat_data$L2_a)/4;xlab='TotalAssoc';xticks=unique(x);
        y=mcpat_data$Area_core+mcpat_data$Area_L2;ylab='TotalArea';ytick=unique(y);yticks=c(min(ytick),max(ytick));
        png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
        plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
             main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
        axis(2,at=yticks,cex.axis=0.9, las=1)
        axis(1,at=xticks,cex.axis=0.75, las=1)
        dev.off()
      
        
          x=mcpat_data$Block;xlab='BlockSize';xticks=unique(x);
          y=mcpat_data$Area_L2;ylab='L2Area';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          x=mcpat_data$Block;xlab='BlockSize';xticks=unique(x);
          y=mcpat_data$Area_core;ylab='CoreArea';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          x=mcpat_data$Block;xlab='BlockSize';xticks=unique(x);
          y=mcpat_data$Area_core+mcpat_data$Area_L2;ylab='TotalArea';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
   
          #now we have all we need in the mcpat_data frame in order to plot.
          x=mcpat_data$D_s+mcpat_data$I_s;xlab='L1Size';xticks=unique(x);
          y=mcpat_data$Peak_P_Core;ylab='CorePower';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y, log='x',xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          
          x=(mcpat_data$D_a+mcpat_data$I_a)/2;xlab='L1Assoc';xticks=unique(x);
          y=mcpat_data$Peak_P_Core;ylab='CorePower';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          x=mcpat_data$L2_s;xlab='L2Size';xticks=unique(x);
          y=mcpat_data$Peak_P_L2;ylab='L2Power';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab, log='x',
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          x=mcpat_data$L2_a;xlab='L2Assoc';xticks=unique(x);
          y=mcpat_data$Peak_P_L2;ylab='L2Power';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          
          x=mcpat_data$D_s+mcpat_data$I_s+mcpat_data$L2_s;xlab='TotalSize';xticks=unique(x);
          y=mcpat_data$Peak_P_Core+mcpat_data$Peak_P_L2;ylab='TotalPower';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,log='x',xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          
          x=(mcpat_data$D_a+mcpat_data$I_a+mcpat_data$L2_a)/4;xlab='TotalAssoc';xticks=unique(x);
          y=mcpat_data$Peak_P_Core+mcpat_data$Peak_P_L2;ylab='TotalPower';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          
          x=mcpat_data$Block;xlab='BlockSize';xticks=unique(x);
          y=mcpat_data$Peak_P_L2;ylab='L2Power';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          x=mcpat_data$Block;xlab='BlockSize';xticks=unique(x);
          y=mcpat_data$Peak_P_Core;ylab='CorePower';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()
          
          x=mcpat_data$Block;xlab='BlockSize';xticks=unique(x);
          y=mcpat_data$Peak_P_Core+mcpat_data$Peak_P_L2;ylab='TotalPower';ytick=unique(y);yticks=c(min(ytick),max(ytick));
          png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
          plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
               main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
          axis(2,at=yticks,cex.axis=0.9, las=1)
          axis(1,at=xticks,cex.axis=0.75, las=1)
          dev.off()     
          
              #now we have all we need in the mcpat_data frame in order to plot.
              x=mcpat_data$D_s+mcpat_data$I_s;xlab='L1Size';xticks=unique(x);
              y=mcpat_data$EDAP;ylab='EDAP';ytick=unique(y);yticks=c(min(ytick),max(ytick));
              png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
              plot(x, y, log='x',xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
                   main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
              axis(2,at=yticks,cex.axis=0.6, las=1)
              axis(1,at=xticks,cex.axis=0.75, las=1)
              dev.off()
              
              x=(mcpat_data$D_a+mcpat_data$I_a)/2;xlab='L1Assoc';xticks=unique(x);
              y=mcpat_data$EDAP;ylab='EDAP';ytick=unique(y);yticks=c(min(ytick),max(ytick));
              png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
              plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
                   main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
              axis(2,at=yticks,cex.axis=0.6, las=1)
              axis(1,at=xticks,cex.axis=0.75, las=1)
              dev.off()
              
              x=mcpat_data$L2_s;xlab='L2Size';xticks=unique(x);
              y=mcpat_data$EDAP;ylab='EDAP';ytick=unique(y);yticks=c(min(ytick),max(ytick));
              png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
              plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab, log='x',
                   main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
              axis(2,at=yticks,cex.axis=0.6, las=1)
              axis(1,at=xticks,cex.axis=0.75, las=1)
              dev.off()
              
              x=mcpat_data$L2_a;xlab='L2Assoc';xticks=unique(x);
              y=mcpat_data$EDAP;ylab='EDAP';ytick=unique(y);yticks=c(min(ytick),max(ytick));
              png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
              plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
                   main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
              axis(2,at=yticks,cex.axis=0.6, las=1)
              axis(1,at=xticks,cex.axis=0.75, las=1)
              dev.off()
              
              
              x=mcpat_data$D_s+mcpat_data$I_s+mcpat_data$L2_s;xlab='TotalSize';xticks=unique(x);
              y=mcpat_data$EDAP;ylab='EDAP';ytick=unique(y);yticks=c(min(ytick),max(ytick));
              png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
              plot(x, y,log='x',xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
                   main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
              axis(2,at=yticks,cex.axis=0.6, las=1)
              axis(1,at=xticks,cex.axis=0.75, las=1)
              dev.off()
              
              
              x=(mcpat_data$D_a+mcpat_data$I_a+mcpat_data$L2_a)/4;xlab='TotalAssoc';xticks=unique(x);
              y=mcpat_data$EDAP;ylab='EDAP';ytick=unique(y);yticks=c(min(ytick),max(ytick));
              png(sprintf("%s_%s.png",ylab,xlab), width=3.5, height=3.25, units="in", res=1200)
              plot(x, y,xaxt='n',yaxt='n', xlab=xlab, ylab = ylab,
                   main=sprintf("%s Effect on %s",xlab,ylab), cex=0.8)
              axis(2,at=yticks,cex.axis=0.6, las=1)
              axis(1,at=xticks,cex.axis=0.75, las=1)
              dev.off()
          