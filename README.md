# Modeling Gear Control System using UPPAAL

## Abstract

In the control system of modern cars, the ubiquous nature of gear-shifting operation has driven us to explore a reasonable and effective method to check the correctness of the model. Inspired by Magnus Lindahl *et al.* , we consider using UPPAAL, a powerful tool kit providing reachability analysis to verify bounded response time properties, to describe the gear control system. Our experiments prove the correctness of the design without any additional implementation effort to extend the existing model-checker.

## Introduction

Aim to formally design and analyze the industrial gear control system, we conducted our experiment using UPPAAL reachablity analysis in combination with a certain syntactical manipulation.



### Design

The gear controller interface provides shared boundary for information exchange between gear controller and its users, receiving service requests and keeping information about the current status. 

The gear-requests from the users are delivered over a communication network to gear controller. The controller accomplishes a zero torque transmission, preparing to release the currently set gear. After the gear released, the controller achieves synchronous speed over the transmission and sets the new gear. Once the gear is set, the engine torque is increased back to pevious level. In this way, the gear change is achieved. 

The gear controller changes gears by requesting services provided by the components in it's environment. Specifically, the gear-box is responsible for setting or releasing a gear in the given time limit; the clutch can open or close, used when the zero torque or synchronous speed not possible; the engine offers three modes of torque control, which have different angular acceleration to deal with various conditions. 

### Lock

A dead-lock is a state in which each member of a group of actions, is waiting for some other member to release a lock. Generally, dead-lock is generated when such specific conditions *i.e. mutex exclusion, hold and wait, no preemption, circular wait* are met. 

A live-lock is similar to a dead-lock, except that the states of the processes involved in the live-lock is constantly changing but without progressing. live-lock is a special case of resource starvation; live-lock emphasis on a specific process is not progressing. 

The dead-lock and live-lock are described as the unrecoverable error and recoverable error respectively in this system. Shown in **Experiment**, our design ensure that dead-lock and live-lock are free in our design, and the functionality and predictability requirements are successfully satisfied.

### Real-time

The bounded response time property puts forward a requirement for the system to respond in a specific time to ensure the safe operation of the system. In the Bounded response time properties formula $f_1 \leadsto_{\le T} f_2$ , $ f_1, f_2$ are boolean combinations of atomic propositions representing request and response respectively, $f$ is an invariant property which limits the occurrence of dead-locks. Interestingly, $f_1 \leadsto_{\le T} f_2$ is just like a strong until operator in LTL ($f_1$ does not need to be true continously here) with an additional time bound, meaning that $f_2$ must be true within $T$ when $f_1$ is true. Shown in **Experiment**, bounded response time properties are satiesfied by our system design.



## Methods

Fig. 1 is a simplified version of our system design. System implementation mainly faces three challenges: how to implement the whole system without semantic errors; how to ensure that the system is lock-free; how to verify bounded response time properties.

### Project Experiment

After the successful simulation, we start to focus on the lock-free puzzle.

We use two integer variables $ErrStat$and $UseCase$ to record the error type. $ErrStat$ is assigned values at unrecoverable errors in Clutch and Gear Box, $UseCase$ is assigned values whenever a recoverable error occurs in Engine. In this system, lock-free gurantee is neatly translated by bounded response time method. 

For example *i.e.* **Table. 2 (1)** in original paper. 

$GearControl@Initiate\leadsto\le1500 \big( (ErrStat=0) \Rightarrow GearControl@GearChange \big)$

The specification above make sure that the process progress within bounded time if no unrecoverable error caused the system to terminate.

Considering the lock-free puzzle is syntactically manipulated into bounded response time problem, we need to implement bounded response time properties. A detailed illustration about bounded response time properties implementation is given using example of *$GearBox@ErrorNeu \leadsto _{200}GearControl@GNeuError$*. 

A state transition in Gear Box from $Opening$ to $ErrorNeu$ is reflected in upper layer by the state transition towards $GErrorNeu$ in Gear Controller. In order to verified such property, our extension work is to make sure that once the Gear Box state transition is complete, the Gear Controller state transition is going to be finished within 200 milliseconds. We introduce a boolean variable $v_6$ and a corresponding timer $c_6$. Using $v_6$ and $\lnot v_6$ as a guard of $ErrorNeu$, we copy the existing edge and assign operation $v_6:=true, c_6=0$ to the reset edge. After that, $v_6:=false$ reset is ready for all edges towards $GNeuError$ in Gear Controller. 

When the system works, this design will ensure time-limited state transitions. In the example above, when the model goes into $ErrorNeu$ location, $v_6=0,c_6=0$. Then, $v_6=true$ until the model goes into $GNeuError$ location. Once $v_6=true$, we can derive that $c_6\le 200$ during this peroid. By this way, $Inv(v_6\Rightarrow c_6 \le 200)$ is verified. Similarly, we use this method to ensure the Real-time transition of the Gear Controller system (low transition delay).

### Experience

This experiment brings us many ideas and inspirations. **Defination 4.5** symbolizes the definition of states and their transitions of a real-time systems. This provides us new ideas to build automata from atomic propositions and data variables. **Section 6.1** uses bounded response time properties to describe security requirements in Gear Control systems, which leads us to explore how to solve other seemingly unrelated problems with real-time software thinking. **Fig.3.** creates a decorated version of automata, opening up a new road for us to consider how to verify the synchronization of various components of the system. To sum up, this practical training on implementing software system not only enables us to have a deeper understanding of how to apply the knowledge we have learned in our course, but also enables us to understand how each part works, how to formulate practical problems, and how to design verification and so on.

### Lesson and Learn

This practical training also made me have a new understanding of teamwork: use my actions to inspire rather than complaints; accept works of very different styles; establish common goals although everyone has different focus.

## Conclusion

We have implemented an industrial case of Gear Control system design. The reachability analysis function of UPPAAL tool kit is utilized to ensure that our system meets the performance, predictability, functionality and error detection requirements. Through this experiment, we put the knowledge of real-time software system into practice and strengthened our cognition of it.

