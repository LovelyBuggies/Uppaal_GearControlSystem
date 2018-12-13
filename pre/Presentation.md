## 1

Ladies and gentlemen, thanks for your attending. We are group 14, and we are going to model a advanced gear controller using UPPAAL. As we have enter an era of industrialization, modern automobiles are no longer strange to us, and even every family has a car. However, have you ever thought about how the gears change, how does the underlying components interact, or how to use knowledge we obtain in real-time system course to implement it? Today, we will satisfy your curiosity by using UPPAAL, a powerful tool kit, to describe our gear controller design. Of course, to prove the correctness of the design, we will show our verification results in the last. Considering we are the first group of presentation, there will inevitably be some flaws in our work. We hope that you can listen patiently, point them out and provide us with valuable suggestions.

## 2

First, on behalf of my group, I'm going to introduce my group members. I am responsible for ...; MIke ; Rayman ; Ale ; Arim; respectively.

## 3

In this part, I'm going to briefly introduce gear control system to help you have a better understanding of our work.

## 4

The gear controller changes gears by requesting service provided by the components in its environment􏶘 the gear􏶧 box􏶦 the clutch􏶦 and the engine􏶙 The interaction with these components is over the vehicles communication network􏶙. Similarly􏶦 the gear controller provides services to its users through its interface􏶙. 

## 5

The system structure are demostrated on this slide and you are able to view it on paper, so I'm not going to show it in detail.

## 6

The controller provides services to its users through its interface. The interface receives service requests and keeps information about the current status of the gear controller􏶦 which is either changing gear or idling.

## 7

The gear-requests from the users are delivered over a communication network to gear controller. The controller performs a gear change in five steps beginning when a gear change request is received from the interface. First, accomplishing a zero torque transmission, making it possible to release the currently set gear. Second, the gear is released. The controller then achieves synchronous speed over the transmission and sets the new gear. Once the gear is set the engine torque is increased so that the same wheel torque level as before the gear change is achieved.

## 8

The gear controller changes gears by requesting services provided by the components in its environment. Specifically, the gear-box is responsible for setting or releasing a gear in the given time limit; the clutch can open or close, providing same sort of basic services as gear-box; the engine offers three modes of control, which have different torque operations. 

## 9

As UPPAAL only provides reachability analysis to verify bounded response time properties, it's not so obvious how to formalize 􏶤in the Uppaal logic􏶥 the pages of informal requirements delivered by the design engineers􏶙. In order to model-check by UPPAAL, we constructed automaton to verify the system.

## 10

The automaton Interface, shown in figure, request gears from controller. Requests and responses are sent through channel ReqNewGear and channel NewGear respectively.􏶙 When a request is sent􏶦, the shared variables FromGear and ToGear are assigned values corresponding to the current and the requested new gear respectively􏶙. Then let my partner to show the other automatons.