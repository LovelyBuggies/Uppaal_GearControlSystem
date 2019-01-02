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

### Project Experiment



### Experience



### Lesson and Learn



## Conclusion



