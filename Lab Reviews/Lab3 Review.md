## [Step 1] McPAT familiarization
Initially, McPAT installation was well documented and easily understood.
Then, we were asked to perform a simple simulation based on a pre-existing CPU model.
This task was necessary for us to understand how to run the simulator and its basic principles.

## [3.1.1]Dynamic Power - Leakage
After running this simple test, we had to interpret its results.
To fully understand its results we had to we had to search for documentation.
Also we were rightly asked to think how the system would behave when changing some conditions.
This task introduced us smoothly to McPAT.

## [3.1.2]Energy
A basic principle and purpose of using McPAT is its Power Consumption Calculations.
Power Consumption is closely related to Energy Efficiency, which is a widely used metric for every device.
The task given needs our thinking on what affects energy efficiency.
To fully understand this there is a comprehension question wether a system with more Power Consumption can be more energy efficient.

## [3.1.3]Different CPUs
This task smoothly follows the previous one, giving a practical example of its allegation.

All in all Part 1 has a smooth logical continuity, well defined and easily understood tasks.
Its is decently demanding which is a nice introduction to this Lab and enables smooth McPAT understanding.

## [Step 2]gem5 + McPAT optimization
McPAT simulator cannot work alone, its main purpose is providing power consumption metrics to other simulators such as gem5.
The introduction, as always, is easy to understand, straight-forward and simple.
This Step requires you to check the python files to find out how to run the simulations.
It is quite important for us to understand in-depth how these simulators are used, and python files are a big part of it.

## [3.2.1]EDAP Calculation
This task is related to Part 3 of the second Lab task.
In that task, we tried to model a cost function for our configurations, in this task a cost function is proposed, adding a nice continuity to the project.
The three asked parts to model are Area, Energy and Delay seperately for the CPU and the L2.
The first two parts are quite simple, Area is given as is by McPAT and Energy requires a simple multiplication by the simulated seconds of gem5.  
An observation is that, we are asked to model seperately CPU and L2 based on EDAP. But simulated seconds is a mutual parameter, being confusing.

The third part, Delay, is not well defined. As the task is given, it seems that, we need to model, CPU and L2 delay separately.
But this is deemed really hard, neither gem5 nor McPAT provides us with a separate metric for these two components.

We were thinking of using AMAT, or Lab2 Performance function, but it seemed overkill and not entirely correct.
For this reason we opted to using a total metric such as CPI or simulated seconds. This as well seemed like a subpar solution but it was the only choice.

It would be nice if the Delay part was explained, by giving us some metric ideas or defining it better.

## [3.2.2]McPAT configs
This part is integral to the logic of our work.
Combining our research on omptimal CPU configurations using gem5 and simulating their energy and area principles using McPAT.
This procedure allows us to further analyze and evaluate our configs using more principles, rendering our research much more realistic.

## [3.2.3]Cost Fucntion - EDAP
Qualification and quantification of our config evaluation is required for us to have a more spherical view of our configurations.
Lastly, we compare our newly created cost function based on EDAP to our previous one, putting a nice ending to the Lab.

In conclusion, this part and the whole lab, was really demanding and interesting.
Most parts were well documented and we didn't waste much time on installations.

The main problem was the little documentation on the simulators.
Some not fully defined tasks were hard to model and the required documentation was subpar.

Computer Architecture is and should really complex, we tried to model as many parameters as possible using many tools and analyzing our system's performance.
This lab required great work on both parts, the creators and us and was a nice journey to take.