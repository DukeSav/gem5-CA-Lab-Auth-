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


## Lab1 Review
#### [Step1] Gem5 Installation
The gem5 installation, package installation and all required features were well documented. The process was easily accesible and easily understood.

#### [Step2] Gem5 "greeting"
The "Hello World" program was really helpful to understand the basic way of running and using gem5. Also the report thoroughly explained all its outputs either on terminal or its stats.txt counterpart.

#### [1.1]Basic_configs
Python script reading is required for us to fully understand gem5, so this step was rightly asked. Most parameters were easily found, but as far as the harder ones are concerned, we were not sure whether they were needed or not. The parameters needed for the assignment could have been specified, rather than asking for "some of them".

#### [1.2]Config_Validation
This task was really helpful to understand how gem5 stores and categorizes its components. Finding the values and code parts was neither easy nor fast, which is how it should have been. Also, its connection to the first task was a nice addition and provided a continuity to the assignment.

### [1.3.]gem5_CPU_Models
This bibliography task was an interesting one. As an architect you need to understand some theoretical principles behind how your and each different CPU model you may use, operates. On the other hand gem5's documentation was not well structured, information was all over the place and some of them were not easily clarified. This may have been our problem due to our inexperience in this subject. Since this question was time consuming, it could have been clarified as [1.3.a].

#### [1.3.a]test_exec
This task was required for us to fully understand how to use gem5 and its different CPU models. It wasn't easy to run, and reasearch had to be done. On the contrary execution times were asked. We found in stats.txt two different "times", and we chose only one of them because the other was for host's system. Also there were data numbers and their rates, dividing them equals to time. This "time" was equal to the previously addressed, so we opted not to add them. All in all this task only needed 2 "time" values, which was rather confusing and we eventually had to make a choice on what to include. Due to our inexperience, it proved harder than it seemed.

#### [1.3.b]Results_Explained
This is a theoretical question to [1.3.a] task. Hence gem5's documentation was confusing and not clarifying, it took us some time to conclude the explanation of previous results. Adding to this, our explanation was rather short, thus it is confusing whether it is right or not. Having uncertainty about the result is expected in many cases, but again, in an introductory level, it might be problematic.

#### [1.3.c]comparisons
This task was a really smooth and nice ending to the basic principles of Computer Architecture. Changing your components to observe how your system operates. The process was rather fun, as you tried many options, more than asked, to see how your system behaves and choose which one fits your case. Seemed like a Computer Architecture component selection in a really small scale, excluding costs and high complexity programs.
