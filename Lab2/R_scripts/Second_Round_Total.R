#Select the Becnchmark by loading its values
benchmark=hmmer_2
name="hmmer"


#Calculate the 0% and 25% quartiles which are of interest,
#based on CPI.
tmp=quantile(benchmark[,9])
zero_quartile=tmp[1]
first_quartile=tmp[2] 
aux1 = which(benchmark[,9] < first_quartile)
aux2 = which(benchmark[,9] == zero_quartile)
#best is the configurations with th e minimum CPI
best=benchmark[aux2,c(1:7)]
#passed is the configurations with CPI in the 1st quartile
pass=benchmark[aux1,c(1:7)]

# We will print the absolute frequencies per Parameter
#for the pass ones and select manually afterwards.
#Set the labels for each plot line
parameters=c("Instruction Cache Size", "Data Cache Size", 
             "L2 Cache Size", "Instruction Cache Associativity", 
             "Data Cache Associativity", "L2 Cache Associativity",
             "Block Size")
titles=c("I_size", "D_size", "L2_size", "I_assoc", "D_assoc", "L2_assoc",
         "Block_Size")
x_label=c("Cache Size", "Cache Associativity", "Block Size")


dir.create(name)
setwd(name)
for (i in seq(7)){
  absfreq=data.frame(table(pass[,i]))
  
  png(sprintf("Total_Round2_%s.png",titles[i]), width=3.5, height=3.25, 
      units="in", res=1200)
  ylim <- c(0, 1.3*max(absfreq$Freq))
  xx <- barplot(absfreq$Freq, xaxt = 'n', xlab = x_label[(i-1)%/%3 +1], width = 0.85,
                ylim = ylim, main =parameters[i],
                ylab = "Frequency", las=1, border='black')
  text(x = xx, y =absfreq$Freq, label = absfreq$Freq, pos = 3, cex = 0.8,
       col = "red")
  axis(1, at=xx, labels=absfreq$Var1, tick=FALSE, 
       las=1, line=-0.5, cex.axis=0.8)
  
  dev.off()
}

for (j in seq(7)){
  absfreq=data.frame(table(best[,j]))
  
  png(sprintf("Best_Round2_%s.png",titles[j]), width=3.5, height=3.25, 
      units="in", res=1200)
  ylim <- c(0, 1.3*max(absfreq$Freq))
  xx <- barplot(absfreq$Freq, xaxt = 'n', xlab = x_label[(j-1)%/%3 +1], width = 0.85,
                ylim = ylim, main =parameters[j],
                ylab = "Frequency", las=1, border='black')
  text(x = xx, y =absfreq$Freq, label = absfreq$Freq, pos = 3, cex = 0.8,
       col = "red")
  axis(1, at=xx, labels=absfreq$Var1, tick=FALSE, 
       las=1, line=-0.5, cex.axis=0.8)
  dev.off()
  
}
setwd("..")