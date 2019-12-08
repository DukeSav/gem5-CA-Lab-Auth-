# gem5-CA-Lab-Auth-

_Authors: Iason-Georgios Velentzas & Georgios Savvidis_

## Lab1

### [1.1]Basic_configs
This file consists of two basic ideas based on `starter_se.py`:
+ System's Basic Parameters are defined.
+ System's Basic Characteristics are reported and explained.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/%5B1.1%5DBasic_configs)

### [1.2]Config_Validation
This file reports all Basic Characteristics mentioned in [1.1] based on the `config.json` file created by gem5, thus validating them.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/%5B1.2%5DConfig_Validation)


###### References:7
[DDR3-1600-8x8 Reference 1](https://github.com/uart/gem5-mirror/blob/master/src/mem/DRAMCtrl.py?fbclid=IwAR2rouQPULwbeunSy-R05zFbjXAenb0x4-L29RGdlkFvCQezmn5dcK_49o)

[DDR3-1600-8x8 Reference 2](https://en.wikipedia.org/wiki/DDR3_SDRAM)

### [1.3.]gem5_CPU_Models
This file included all in-order CPU Models in gem5 and their bried explanation.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/Part3/%5B1.3.%5Dgem5_CPU_Models)

##### References:
[InOrder CPU Model](http://gem5.org/InOrder)

[MinorCPU](http://www.gem5.org/docs/html/minor.html)

[HPICPU](http://www.gem5.org/wiki/images/c/cf/Summit2017_starterkit.pdf)

#### [1.3.a]test_exec 
This file shows the timing of both CPU Models Simulations

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/Part3/%5B1.3.a%5Dtime_exec)

[link to C file](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/Part3/test.c)

#### [1.3.b]Results_Explained
This file explains the reasoning behind the two CPU Model differences.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/Part3/%5B1.3.b%5DResults_Explained)

#### [1.3.c]comparisons
This file explains the comparisons when changing the CPU clock and memory type on both our CPU Models respectively.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/Part3/%5B1.3.c%5DComparisons)

[link to cmd instructions](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab1/%5BL1%5Dcmd_instructions.sh)

## Lab2 
#### [2.1.1]caches
This file shows the simulation's requested parameters.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab2/%5B2.1.1%5D%20caches.md)

#### [2.1.2]benchmark info
This file shows every benchmark info using the specified CPU configuration.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab2/%5B2.1.2%5D%20benchmark%20info.md)

#### [2.1.3]benchmark cpu clock
This shows benchmark simulation time and clock parameters when changing CPU Clock.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab2/%5B2.1.3%5D%20benchmark%20cpu%20clock.md)

#### [2.2.1]Simulation_Analysis
This file shows the whole simulation logic and procedure that was used.
This file also includes step [2.2.2]Diagram_Figures for total configuration ratings.

[link](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab2/%5B2.2.1%5D%20Simulation_Analysis.md)

[CSV, Figure files & Scripts used for the first Simulation Iterations](https://github.com/DukeSav/gem5-CA-Lab-Auth-/tree/master/Lab2/CSV_round1)

[CSV, Figure files & Scripts used for the second Simulation Iterations](https://github.com/DukeSav/gem5-CA-Lab-Auth-/tree/master/Lab2/CSV_round2)

[All R scripts used](https://github.com/DukeSav/gem5-CA-Lab-Auth-/tree/master/Lab2/R_scripts)

#### [2.2.2]Simulation_Diagrams
These files show the final diagrams which undermine the behaviour of every benchmark based on every parameter.

[Figures for the Total Diagrams](https://github.com/DukeSav/gem5-CA-Lab-Auth-/tree/master/Lab2/%5B2.2%5D%20DiagramsOfEffect)

#### [2.3]Cost_Function
In this file you can see the procedure followed to model the Cost_Function and the rationale behind it
[Cost_Function_Procedure](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab2/%5B3%5D%20Cost%20Function)

Some plots that demonstrate the behavior of this function under certain parameters configured.
The plits are for 2 of the Benchmarks and for 2 different values of Block_Size.

[Plots_of_Cost](https://github.com/DukeSav/gem5-CA-Lab-Auth-/tree/master/Lab2/Cost_Plots)

#### [2.3]Cost_Function_2
In this file you can see the procedure followed to model the Cost_Function for the second time and the rationale behind it
[Cost_Function_2_Procedure](https://github.com/DukeSav/gem5-CA-Lab-Auth-/blob/master/Lab2/%5B2.3%5D%20Cost%20Function_2.md)

##### References
[gem5 Options](http://gem5.org/Running_gem5?fbclid=IwAR02b7hjfnl2kE4V0OERKJ3SkCIoYpphi0vaF_f5XjJYMPA6Qly9hMBojys)

[Published specCPU2006 Simulations on various CPUs](https://www.spec.org/cpu2006/results/cint2006.html?fbclid=IwAR1maHonZUh6oLhSujRqPHt11gIxMT-wpjjLAQeBolON8w3rn9juKU0kq0Q)

[Thorough Report on CPU architecture](https://akkadia.org/drepper/cpumemory.pdf?fbclid=IwAR3-7uozhX6LCHK6u5rYGZcqurjTzKQ8OCe66hs7vnn-dyb4PCumUbQHFTk)

[specCPU2006 Simulations on a specific CPU and Conclusions](https://www.ece.lsu.edu/lpeng/papers/isast08.pdf?fbclid=IwAR02b7hjfnl2kE4V0OERKJ3SkCIoYpphi0vaF_f5XjJYMPA6Qly9hMBojys)
