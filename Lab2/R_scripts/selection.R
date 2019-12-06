setwd("~/my_gem5/spec_results/Results/CSV_round1")
bzip=read.csv("bzip.csv", header=TRUE)
mcf=read.csv("mcf.csv", header=TRUE)
hmmer=read.csv("hmmer.csv", header=TRUE)
sjeng=read.csv("sjeng.csv", header=TRUE)
libm=read.csv("libm.csv", header=TRUE)

#Select the Becnchmark by loading its values
benchmark=libm
name="libm"



#Calculate the 0% and 25% quartiles which are of interest,
#based on CPI.
tmp=quantile(benchmark[,7])
zero_quartile=tmp[1]
first_quartile=tmp[2] 
aux1 = which(benchmark[,7] < first_quartile)
aux2 = which(benchmark[,7] == zero_quartile)
#best is the configurations with the minimum CPI
best=benchmark[aux2,c(1:6)]
#passed is the configurations with CPI in the 1st quartile
pass=benchmark[aux1,c(1:6)]

# We will print the absolute frequencies per Parameter
#for the pass ones and select manually afterwards.
#Set the labels for each plot line
parameters=c("Instruction Cache Size", "Data Cache Size", 
         "L2 Cache Size", "Instruction Cache Associativity", 
         "Data Cache Associativity", "L2 Cache Associativity")
titles=c("I_size", "D_size", "L2_size", "I_assoc", "D_assoc", "L2_assoc")
x_label=c("Cache Size", "Cache Associativity")


dir.create(name)
setwd(name)
for (i in seq(6)){
absfreq=data.frame(table(passed[,i]))

png(sprintf("%s_Round1.png",titles[i]), width=3.5, height=3.25, 
    units="in", res=1200)
ylim <- c(0, 1.3*max(absfreq$Freq))
xx <- barplot(absfreq$Freq, xaxt = 'n', xlab = x_label[i%%4 +1], width = 0.85,
              ylim = ylim, main =parameters[i],
              ylab = "Frequency", las=1, border='black')
text(x = xx, y =absfreq$Freq, label = absfreq$Freq, pos = 3, cex = 0.8,
     col = "red")
if (i<3){
  axis(1, at=xx, labels=absfreq$Var1, tick=FALSE, 
       las=1, line=-0.5, cex.axis=0.8)
}else if (i <4){
         axis(1, at=xx, labels=absfreq$Var1, tick=FALSE, 
              las=1, line=-0.5, cex.axis=0.8)
}
else if (i<6){
  axis(1, at=xx, labels=absfreq$Var1, tick=FALSE, 
       las=1, line=-0.5, cex.axis=0.8)
}else{
  axis(1, at=xx, labels=absfreq$Var1, tick=FALSE, 
       las=1, line=-0.5, cex.axis=0.8)
}
dev.off()

}
setwd("..")