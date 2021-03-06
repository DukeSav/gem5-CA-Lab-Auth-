dir.create("~/my_gem5/spec_results/Results/TotalEffect")
setwd("~/my_gem5/spec_results/Results/TotalEffect")

bm=libm_tot
name="libm"
tmp=quantile(bm[,9])
pass=bm[bm$CPI<=tmp[2],]
mediocre=bm[bm$CPI>tmp[2]&bm$CPI<=tmp[3],]
fail=bm[bm$CPI>tmp[3],]
x_ax=c(1,2,3)
y_ax=c(4,5,6)
title=c("I","D","L2")
dir.create(name)
setwd(name)
for (j in seq(3)){
  
  png(sprintf("TEST_%s.png",title[j]), width=3.5, height=3.25, 
      units="in", res=1200)
  xticks=sort(unique(bm[,x_ax[j]]))
  yticks=sort(unique(bm[,y_ax[j]]))
ylim<- c(min(0.8*min(pass[,y_ax[j]]),0.8*min(mediocre[,y_ax[j]]), 0.8*min(fail[,y_ax[j]])),
         max(1.2*max(pass[,y_ax[j]]),1.2*max(mediocre[,y_ax[j]]), 1.2*max(fail[,y_ax[j]])))
xlim<- c(min(0.8*min(pass[,x_ax[j]]),0.8*min(mediocre[,x_ax[j]]), 0.8*min(fail[,x_ax[j]])),
        max(1.2*max(pass[,x_ax[j]]),1.2*max(mediocre[,x_ax[j]]), 1.2*min(fail[,x_ax[j]])))
plot(mediocre[,x_ax[j]], mediocre[,y_ax[j]], xlab=sprintf("%s_size (kB)",title[j]),xlim=xlim,
     ylab=sprintf("%s_assoc",title[j]), ylim=ylim,pch=15,col="blue", cex=1.6,
     log="x", main=sprintf("%s Effect on %s",title[j],name),xaxt="n",yaxt="n")
par(new=TRUE)
plot(fail[,x_ax[j]], fail[,y_ax[j]], xlim=xlim, xlab="",ylab="",
     ylim=ylim, pch=4, cex=2.2, log="x",xaxt="n",yaxt="n")
par(new=TRUE)
plot(pass[,x_ax[j]], pass[,y_ax[j]],xlim=xlim, xlab="",ylab="",
      ylim=ylim, pch=20, col="red", cex=1.2,
     log="x",xaxt="n", yaxt="n")

axis(2,at=yticks,cex.axis=0.9, las=1)
axis(1,at=xticks,cex.axis=0.75, las=1)

dev.off()
}

# We define three levels of performance based on Speed (CPI)
# The pass performance: 1st Quartile
# The mediocre performance: 2nd Quartile
# The fail performance: 3rd Quartile

# plot(mediocre[,x_ax[j]], mediocre[,y_ax[j]], xlab="I_size",xlim=xlim,
#      ylab="I_assoc",las=1, ylim=ylim,pch=15,col="blue", cex=1.6)
# par(new=TRUE)
# plot(fail[,x_ax[j]], fail[,y_ax[j]], xlab="I_size",xlim=xlim,
#      ylab="I_assoc",las=1, ylim=ylim, pch=4, cex=2.2 )
# par(new=TRUE)
# plot(pass[,x_ax[j]], pass[,y_ax[j]], xlab="I_size",xlim=xlim,
#      ylab="I_assoc",las=1, ylim=ylim, pch=20, col="red", cex=1.2)
