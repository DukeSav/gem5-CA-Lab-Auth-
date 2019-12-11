## [Step 1] Benchmark Installation
The benchmark installation, and all required features were well documented. The process was easily accesible and easily understood.

## [1.1] caches
Following the first lab assignment this was a nice addition. Now we had to understand and find cpu memory characteristics, which wasn't needed in the first lab.
Also it is quite a good introduction to what is to come.

## [1.2] benchmark info
This task was nice and rightfully asked to get acquainted with the benchmarks. You could see how each benchmark behaves and in which part it is more heavily reliant.
We arent sure if the diagrams are needed, our sample size is quite small and easily read without plotting it.
Also it is extra work that could be skipped.

## [1.3] benchmark cpu clock
This task was theoretically quite interesting since you observe how each benchmark behaves if you change one cpu parameter.
The results were quite easily understood and interpreted which is nice as well.
_Initially the task asked for cpu clock to be set to 2GHz, but this is the default for gem5, hence our initial results were false._
_We sent a mail, but the clarification mail, for it to be set to 1GHz instead, didnt come soon enough and we lost some time there._

## [2.1]Simulation Analysis
This task was the main for this lab, it is really helpful and interesting to run many simulations and see how the cpus behave on each benchmark.
We had many problems to set this up, the question asked is really simple and straight forward but we felt that this part needed more clarification.

Do we need to just run 20 simulations and each time change a different parameter?  
We felt like this is incorrect, as a parameter may affect others as well, also each benchmark behaviour can not be expressed just with one change, the sample size should be bigger.

Since we opted for a bigger sample size, the simulation time was unrealistic.  
To solve this issue with the optimal way it took us many hours of thinking and discussing, which could have been skipped if there were clarifications.
_We do understand that maybe this was done in purpose, but some, more precise and not general, guidelines could have been useful_

We did:
+ Treat each different benchmark separately
+ Create a scriopt that uses gem5 for many configurations.
+ Run simulations on each benchmark with steps.  
In the first step we notice the best and decently performing parameters as well as the irrelevant ones.
The second step is run based on the former conclusions, decreasing the number of choices, but while also adding parameters not used in the first.
This 2-step procedure was chosen to reduce the simulation time.
+ Cut specified configurations on each benchmark based on bibliography and the [1.3] step.
+ Use all of our CPU threads available (8 tests running simultaneously on 2 different PCs)
+ Reduce instruction size by 10 times  
We werent sure if we could do this, if this would affect our results. Maybe some clarification could have been made.

Some of the upper used practices were mentioned briefly on the lab2 report, others werent.
We werent fully aware of each decision's infuence.
Also it took us too much time trying to decide them.

## [2.2] Diagrams Of Effect
This task was really usefull, having such a big sample size you cannot make any conclusions just by looking at each simulation separately.  
The diagram plotting is a standard procedure to many big data sciences. Computer Architecture is no different.  

The theory of this task is part of the subject, but its implementation [the code] has nothing to do with it. It is more data analysis that Computer Architecture.  
Maybe there could have been already developed scripts that run these diagrams and we would just analyze them.
But maybe then it would have been too easy.

## [3.1] Cost Function
This last part was quite insteresting, implementing a cost function to describe all of your conclusions. If this could be done it is really useful.  
But, bibliography is really limited, there is no standard cost function, or rather basically no one has reasearched, or concluded to one.  
We had little to work with, and didnt know where to start.  
Identifying if a parameter affects positively or negatively let's say miss rate or hit rate was quite easy.  
But trying to quantify it was really demanding, and probably impossible.  
Our first idea was using the AMAT function, designing and building separately each parameter.  
Its implementation had some acceptable and some subpar results, we werent sure if this is enough for our task.  
So we decided on developing a second cost function.  
All of this research and brain-storming is really interesting, but too time consuming and in the end, possibly comes to nothing or something not optimal.  
We are aware that there is no correct sollution here, and quite possibly there is none. (To the perfect level)  
But it was really frustrating trying to build something that perhaps would not work while also having little to no bibliography and guidelines.  
We do not know how but help should have been provided to this task, in order to quantify correctly the cost function.

_Also a small observation, on the report you ask for a different repo for Lab2. While on the lab you asked for it to be in the same repo_
