setwd("~/my_gem5/spec_results/Results/CSV_round2")
bzip_2=read.csv("res_bzip_2.csv", header=TRUE)
sjeng_2=read.csv("res_hmmer_2.csv", header=TRUE)

setwd("~/my_gem5/spec_results/Results/CSV_round1")
bzip_1_new=read.csv("bzip_1_new.csv", header=TRUE)
hmmer_1_new=read.csv("hmmer_1_new.csv", header=TRUE)


bzip_tot=unique(rbind(bzip_1_new, bzip_2))
sjeng_tot=unique(rbind(sjeng_1_new,sjeng_2))
rm(bzip_2, bzip_1_new, sjeng_2,sjeng_1_new)

temp=sjeng_tot;

L1_values=levels(factor(temp$I_size))
L2_values=levels(factor(temp$L2_size))
BS_values=levels(factor(temp$cache_line))
L1_domain=seq(length(L1_values))
L2_domain=seq(length(L2_values))
BS_domain=seq(length(BS_values))
Cost_L1=numeric();
for (x in L1_domain){
  Cost_L1[x]=50*2.25^(x-1)
}
low_assoc=1
high_assoc_1=numeric();
for ( x in L1_domain){
  if(x!=5){
    high_assoc_1[x+1]=12*exp(-0.5*x)-0.4
  }
}
#There is no high associativity for 8 kb Cache
high_assoc_1[1]=0
high_assoc_1
Cost_L1_high=high_assoc_1*Cost_L1
plot(L1_domain,Cost_L1_high)


Cost_L2=numeric()
for (x in L2_domain){
  Cost_L2[x]=250*(x-0.6)
  #z2[x]=-10*exp(-x-1)
}
Cost_L2
#For associativity in L2 we want to remain the complexity
high_assoc_2=numeric();
for ( x in L2_domain){
  high_assoc_2[length(L2_domain)-x+1]=(x-1)^1.5/4.2+1.2
  if (x==length(L2_domain)){
    high_assoc_2[length(L2_domain)-x+1]=2*high_assoc_2[length(L2_domain)-x+1]
  }
}

Cost_L2_high=high_assoc_2*Cost_L2
Cache1=data.frame(L1_values,Cost_L1,Cost_L1_high)
Cache2=data.frame(L2_values,Cost_L2, Cost_L2_high)
Cache1;Cache2;
C_bs=numeric()
for (x in BS_domain){
  if (x==1){
    C_bs[x]=x^2
  } else{
    C_bs[x]=(x+3)^2
  }
}
C_bs
Cost=data.frame(temp$I_size,temp$I_assoc,temp$D_size, temp$D_assoc,temp$L2_size,temp$L2_assoc,temp$cache_line)
L1_Cost=numeric();L2_Cost=numeric();Total_Cost=numeric()
for (j in seq(nrow(Cost))){

  if (temp$I_assoc[j]==2){
    assoc_I=1
  }  else {
    assoc_I=high_assoc_1[log2(temp$I_size[j])-2]
  }
  if (temp$D_assoc[j]==2){
    assoc_D=1
  }  else {
    assoc_D=high_assoc_1[log2(temp$D_size[j])-2]
  }
  if (temp$L2_assoc[j]==4){
    assoc_L2=1
  }  else {
    assoc_L2=high_assoc_2[log2(temp$L2_size[j])-7]
  }
  L1_Cost[j]=Cost_L1[log2(temp$I_size[j])-2]*assoc_I+Cost_L1[log2(temp$D_size[j])-2]*assoc_D
  L2_Cost[j]=Cost_L2[log2(temp$L2_size[j])-7]*assoc_L2
  Total_Cost[j]=(L1_Cost[j]+L2_Cost[j])*C_bs[log2(temp$cache_line[j])-5]
}
                
Cost[,8]=L1_Cost
Cost[,9]= L2_Cost
Cost[,10]=Total_Cost
Cost[,11]=temp[,9]



#PLOT 2 for all I_sizes and Cache_Line=256
x=Cost[Cost$temp.I_size==64 & Cost$temp.cache_line==256,]
plot(x$V11,x$V10, pch=3, col="blue")
par(new=TRUE)
x=Cost[Cost$temp.I_size==32 & Cost$temp.cache_line==256,]
plot(x$V11,x$V10, pch=3, col='red')
par(new=TRUE)
x=Cost[Cost$temp.I_size==16 & Cost$temp.cache_line==256,]
plot(x$V11,x$V10, pch=3, col='green')
par(new=TRUE)
x=Cost[Cost$temp.I_size==8 & Cost$temp.cache_line==256,]
plot(x$V11,x$V10, pch=3, col='black')

png(sprintf("Cost1.png"), width=3.5, height=3.25, 
    units="in", res=1200)
plot(L1_domain,Cost_L1, pch=1, col='red', cex=1.4)
dev.off()
png(sprintf("Cost2.png"), width=3.5, height=3.25, 
    units="in", res=1200)

plot(L2_domain,Cost_L2, pch=3, col='blue', cex=1.4)
dev.off()

