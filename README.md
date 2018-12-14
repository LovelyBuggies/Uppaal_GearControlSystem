# Modeling Gear Control System using UPPAAL

## Abstract

In the control system of modern cars, the ubiquous nature of gear-shifting operation has driven us to explore a reasonable and effective method to check the correctness of the model. Inspired by Magnus Lindahl *et al.* , we consider using UPPAAL, a powerful tool kit providing reachability analysis to verify bounded response time properties, to describe the gear control system. Our experiments prove the correctness of the design without any additional implementation effort to extend the existing model-checker.

## Introduction

### System Overview


The controller provides services to it's users through it's interface. The interface receives service requests and keeps information about the current status of the gear controller􏶦 which is either changing gear or idling.

The gear-requests from the users are delivered over a communication network to gear controller. The controller performs a gear change in five steps beginning when a gear change request is received from the interface. First, accomplishing a zero torque transmission, making it possible to release the currently set gear. Second, the gear is released. The controller than achieves synchronous speed over the transmission and sets the new gear. Once the gear is set the engine torque is increased so that the same wheel torque level as before the gear change is achieved.

The gear controller changes gears by requesting services provided by the components in it's environment. Specifically, the gear-box is responsible for setting or releasing a gear in the given time limit; the clutch can open or close, providing same sort of basic services as gear-box; the engine offers three modes of control, which have different torque operations.

## Methods

### Project Experiment



### Experiment



### Lesson and Learn



## Conclusion



