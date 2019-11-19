#Lab1/Question3
#Created the test.c file and converted it into executable test_arm.exe

#1.3.a: Ran our file with gem5 with cpu-type set to MinorCPU and TimingSimpleCPU, among with --caches.

#MinorCPU
./build/ARM/gem5.opt -d MinorCPU_orig configs/example/se.py --cpu-type=MinorCPU --caches -c ~/gem5-CA-Lab-Auth-/Lab1/Part3/test_arm

#TimingSimpleCPU
./build/ARM/gem5.opt -d TimingSimpleCPU_orig configs/example/se.py --cpu-type=TimingSimpleCPU 
--caches -c ~/gem5-CA-Lab-Auth-/Lab1/Part3/test_arm


#1.3.c Changed CPU_clock and Mem_type in both cases:

###CPU_clock

#MinorCPU
./build/ARM/gem5.opt -d MinorCPU_orig/CPUCL3GHz configs/example/se.py --cpu-type=MinorCPU --cpu-clock=3GHz 
--caches -c ~/gem5-CA-Lab-Auth-/Lab1/Part3/test_arm

#TimingSimpleCPU
./build/ARM/gem5.opt -d TimingSimpleCPU_orig/CPUCL3GHz configs/example/se.py --cpu-type=TimingSimpleCPU --cpu-clock=3GHz 
--caches -c ~/gem5-CA-Lab-Auth-/Lab1/Part3/test_arm

###Mem_type

#MinorCPU
./build/ARM/gem5.opt -d MinorCPU_orig/MEM_DDR4_2400_16x4 configs/example/se.py --cpu-type=MinorCPU --mem-type=DDR4_2400_16x4 
--caches -c ~/gem5-CA-Lab-Auth-/Lab1/Part3/test_arm

#TimingSimpleCPU
./build/ARM/gem5.opt -d TimingSimpleCPU_orig/MEM_DDR4_2400_16x4 configs/example/se.py --cpu-type=TimingSimpleCPU --mem-type=DDR4_2400_16x4
--caches -c ~/gem5-CA-Lab-Auth-/Lab1/Part3/test_arm
