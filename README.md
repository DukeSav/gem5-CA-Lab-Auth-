# gem5-CA-Lab-Auth-

## Lab1

### [1.1]Basic_configs
This file consists of two basic ideas based on `starter_se.py`:
+ System's Basic Parameters are defined.
+ System's Basic Characteristics are reported and explained.

### [1.2]Config_Validation
This file reports all Basic Characteristics mentioned in [1.1] based on the `config.json` file created by gem5, thus validating them.

###### References:
[DDR3-1600-8x8 Reference 1](https://github.com/uart/gem5-mirror/blob/master/src/mem/DRAMCtrl.py?fbclid=IwAR2rouQPULwbeunS7y-R05zFbjXAenb0x4-L29RGdlkFvCQezmn5dcK_49o)

[DDR3-1600-8x8 Reference 2](https://en.wikipedia.org/wiki/DDR3_SDRAM)

### [1.3.]gem5_CPU_Models
This file included all in-order CPU Models in gem5 and their bried explanation.

##### References:
[InOrder CPU Model](http://gem5.org/InOrder)

[MinorCPU](http://www.gem5.org/docs/html/minor.html)

[HPICPU](http://www.gem5.org/wiki/images/c/cf/Summit2017_starterkit.pdf)

#### [1.3.a]test_exec 
This file shows the timing of both CPU Models Simulations

#### [1.3.b]Results_Explained
This file explains the reasoning behind the two CPU Model differences.

#### [1.3.c]comparisons
This file explains the comparisons when changing the CPU clock and memory type on both our CPU Models respectively.
