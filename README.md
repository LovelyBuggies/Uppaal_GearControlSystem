# Modeling Gear Control System using UPPAAL

## Abstract

In the control system of modern cars, the ubiquous nature of gear-shifting operation has driven us to explore a reasonable and effective method to check the correctness of the model. Inspired by Magnus Lindahl *et al.* , we consider using UPPAAL, a powerful tool kit providing reachability analysis to verify bounded response time properties, to describe the gear control system. Our experiments prove the correctness of the design without any additional implementation effort to extend the existing model-checker.

## Introduction

Aim to formally design and analyze the industrial gear control system, we conducted our experiment using UPPAAL reachablity analysis in combination with a certain syntactical manipulation.



### Gear Controller Design

The gear controller interface provides shared boundary for information exchange between gear controller and its users. The interface receives service requests and keeps information about the current status of the gear controller which is either changing gear or idling. Interface users include drivers who are using gear stick or dedicated components taking response for changing gear.

The gear-requests from the users are delivered over a communication network to gear controller. The controller performs a gear change in five steps beginning when a gear change request is received from the interface. First, accomplishing a zero torque transmission, preparing to release the currently set gear. Second, the gear is released. The controller then achieves synchronous speed over the transmission and sets the new gear. Once the gear is set, the engine torque is increased back to pevious level. In this way, the gear change is achieved. Clutch is used under some difficult driving circumstances, when the zero torque or synchronous speed not possible. Exceptional cases in gear controller are recoverable errors.

The gear controller changes gears by requesting services provided by the components in it's environment. Specifically, the gear-box is responsible for setting or releasing a gear in the given time limit; the clutch can open or close, providing same sort of basic services as gear-box; the engine offers three modes of torque control, which have different angular acceleration to deal with various conditions. All error states in gear controller environment are unrecoverable errors.



### Bounded Response Time Properties

The bounded response time property puts forward a requirement for the system to respond in a specific time to ensure the safe operation of the system. In the Bounded response time properties formula $f_1 \leadsto_{\le T} f_2$ , $ f_1, f_2$ are boolean combinations of atomic propositions representing request and response respectively, $f$ is an invariant property which limits the occurrence of deadlocks. Interestingly, $f_1 \leadsto_{\le T} f_2$ is just like a strong until operator in LTL ($f_1$ does not need to be true continously here) with an additional time bound, meaning that $f_2$ must be true within $T$ when $f_1$ is true. Shown in **Experiment**, bounded response time properties are satiesfied by our system design.



### Deadlock



## Methods

Fig. 1 is a simplified version of our system design. By adding some edges and variables, our design is surprisingly perfect for implementing the gear controller system while satisfying the bounded response time properties. 

### Project Experiment

A detailed illustration about bounded response time properties implementation is given using example of *$GearBox@ErrorNeu \leadsto _{200}GearControl@GNeuError$*. 

A state transition in Gear Box from $Opening$ to $ErrorNeu$ is reflected in upper layer by the state transition towards $GErrorNeu$ in Gear Controller. In order to verified such property, our extension work is to make sure that once the Gear Box state transition is complete, the Gear Controller state transition is going to be finished within 200 milliseconds. We introduce a boolean variable $v_6$ and a corresponding timer $c_6$. Using $v_6$ and $\lnot v_6$ as a guard of $ErrorNeu$, we copy the existing edge and assign operation $v_6:=true, c_6=0$ to the reset edge. After that, $v_6:=false$ reset is ready for all edges towards $GNeuError$ in Gear Controller. 

When the system works, this design will ensure time-limited state transitions. In the example above, when the model goes into $ErrorNeu$ location, $v_6=0,c_6=0$. Then, $v_6=true$ until the model goes into $GNeuError$ location. Once $v_6=true$, we can derive that $c_6\le 200$ during this peroid. By this way, $Inv(v_6\Rightarrow c_6 \le 200)$ is verified. Similarly, we use this method to ensure the Real-time transition of the Gear Controller system (low transition delay).

### Experience



### Lesson and Learn



## Conclusion



