#Domain_L1_size= c(16,32,64,128,256,512,1024,2048,4096)
l1s=4
#Domain_L1_assoc=c(2,4,8)
l1a=3
#Domain_L2_size= c(16,32,64,128,256,512,1024,2048,4096)
l2s=9
#Domain_L2_assoc=c(2,4,8)
l2a=3
#block_size_domain=c(64,128,256)
bs1=3
#Domain_L1_size= c(16,32,64,128,256,512,1024,2048,4096)
l1s=4
#Domain_L1_assoc=c(2,4,8)
l1a=3
#Domain_L2_size= c(16,32,64,128,256,512,1024,2048,4096)
l2s=9
#Domain_L2_assoc=c(2,4,8)
l2a=3
#block_size_domain=c(64,128,256)
bs2=3

cache1_size_speed=c(1,1.5,2,2.5,3,3.5,4,4.5,5)
cache1_assoc_speed=c(0.5,1,1.5,2)
cache2_size_speed=c(1,1.5,2,2.5,3,3.5,4,4.5,5)
cache2_assoc_speed=c(0.5,1,1.5,2)
block_size_price=c(2,8,56) 
cache1_size_price=c(0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5)
cache1_assoc_price=c(1,2,3)
cache2_size_price=c(0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5)
cache2_assoc_price=c(0.5,1,2,3)
block_size_speed=c(1,1.5,2)
Hit_time_L1=cache1_size_speed[l1s]*cache1_assoc_speed[l1a]*block_size_speed[bs1]*2*10^(-9)
Miss_rate_L1=exp((cache1_size_speed[l1s]+cache1_assoc_speed[l1a]+block_size_speed[bs1])/log(cache1_size_speed[l1s]+cache1_assoc_speed[l1a]+block_size_speed[bs1]))/cache1_size_speed[l1s]*cache1_assoc_speed[l1a]*block_size_speed[bs1]
Hit_time_L2=cache2_size_speed[l2s]*cache2_assoc_speed[l2a]*block_size_speed[bs1]*2*10^(-9)
Miss_rate_L2=exp((cache2_size_speed[l2s]+cache2_assoc_speed[l2a]+block_size_speed[bs1])/log(cache2_size_speed[l2s]+cache2_assoc_speed[l2a]+block_size_speed[bs1]))/cache2_size_speed[l2s]*cache2_assoc_speed[l2a]*block_size_speed[bs1]
Miss_penalty_L2=exp(block_size_speed[bs1]+1)*log(block_size_speed[bs1]*exp(1))*10^(-9)/40
AMAT=Hit_time_L1+Miss_rate_L1*(Hit_time_L2+Miss_rate_L2*Miss_penalty_L2)
Price=(cache1_size_price[l1s]*cache1_assoc_price[l1a]+cache2_size_price[l2s]*cache2_assoc_price[l2a])*block_size_price[bs2]
Cost=AMAT*10^(8)+Price