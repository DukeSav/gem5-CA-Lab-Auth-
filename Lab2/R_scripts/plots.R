#PLOT 1 for all I_sizes and Cache_Line=64
setwd("~/Desktop")
dir.create("plots")
setwd("./Cost_Plots/Sjeng_BlockSize=256")
png(sprintf("I_Sizes_Tot.png"), width=3.5, height=3.25,
    units="in", res=1200)
x=Cost[Cost$temp.I_size==64 & Cost$temp.cache_line==256,]
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
plot(x$V11,x$V10, pch=3, col="black",xlab="CPI", ylab="Total Cost", main="L1_I Sizes,BS=256", cex=0.8)
par(new=TRUE)
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
x=Cost[Cost$temp.I_size==32 & Cost$temp.cache_line==256 ,]
plot(x$V11,x$V10, pch=3, col='red' ,xaxt = 'n',yaxt = 'n',xlab="",ylab="", cex=0.8)
par(new=TRUE)
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
x=Cost[Cost$temp.I_size==16 & Cost$temp.cache_line==256,]
plot(x$V11,x$V10, pch=3, col="black",xlab="CPI", ylab="Total Cost", cex=0.8)
par(new=TRUE)
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
x=Cost[Cost$temp.I_size==8 & Cost$temp.cache_line==256,]
plot(x$V11,x$V10, pch=3, col='blue',xaxt = 'n',yaxt = 'n',xlab="",ylab="", cex=0.8)
dev.off()
png(sprintf("I_size=64.png"), width=3.5, height=3.25,
    units="in", res=1200)
x=Cost[Cost$temp.I_size==64 & Cost$temp.cache_line==256,]
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
plot(x$V11,x$V10, pch=3,xlab="CPI", ylab="Total Cost", main="I_Size=64,BS=256",cex=0.8, col='black')

dev.off()
png(sprintf("I_Size=32.png"), width=3.5, height=3.25,
    units="in", res=1200)
x=Cost[Cost$temp.I_size==32 & Cost$temp.cache_line==256,]
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
plot(x$V11,x$V10, pch=3,xlab="CPI", ylab="Total Cost", main="I_Size=32,BS=256",cex=0.8, col='black')

dev.off()
png(sprintf("I_size=16.png"), width=3.5, height=3.25,
    units="in", res=1200)
x=Cost[Cost$temp.I_size==16 & Cost$temp.cache_line==256,]
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
plot(x$V11,x$V10, pch=3,xlab="CPI", ylab="Total Cost", main="I_Size=16,BS=256",cex=0.8, col='black')

dev.off()
png(sprintf("I_size=8.png"), width=3.5, height=3.25,
             units="in", res=1200)
x=Cost[Cost$temp.I_size==8 & Cost$temp.cache_line==256,]
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
plot(x$V11,x$V10, pch=3,xlab="CPI", ylab="Total Cost", main="I_Size=8,BS=256",cex=0.8, col='black')

dev.off()
png(sprintf("I_size=128.png"), width=3.5, height=3.25,
             units="in", res=1200)
x=Cost[Cost$temp.I_size==128 & Cost$temp.cache_line==256,]
ylim <- c(0.8*min(x$V11), 1.2*max(x$V11))
xlim <- c(0.8*min(x$V10), 1.2*max(x$V10))
plot(x$V11,x$V10, pch=3,xlab="CPI", ylab="Total Cost", main="L2_Size=128,BS=256",cex=0.8, col='black')

dev.off()