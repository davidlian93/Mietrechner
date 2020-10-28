# Rental calculator

**Rental calculator** is a [UG4 Plugin](https://github.com/UG4) that provides various algorithms
used in a constrained optimization setting.

This program calculates the parameters to be estimated based on the number of square meters and the rental price. The goal is to set up a function based on these parameters, which makes it possible to calculate the average rental price based on the number of square meters. 
The program takes the data from the file daten.txt and calculates the parameters to be estimated by means of particle swarm optimization or Newton-Gauss algorithm

# Contents
This document should give a broad overview on **Rental calculator** combined with some usage examples.

* [Description](#description)
* [Example](#description)

A sample problem will be added to the description.

# Description
The following algorithms are currently implemented:

|Name|Description|
|---|---|
|Newton-Gauss|The Gauss Newton procedure minimizes functions that can be represented as a sum of squares.|
|Particle Swarm Optimization|The Particle Swarm Optimization (PSO) algorithm minimizes any continuous function on a bounded domain.|

The main feature of **ConstrainedOptimization** is the compartmentalization of problem formulation, solution finding and underlying computation mechanism.
A problem is formulated via child instantiations of the `Evaluation` class type, which includes details such as the objective function to be optimized or problem specific parsing details. 
Solution finding algorithms are represented as classes such as `NewtonOptimizer`. Computational interaction with UG4 is abstracted away in instances
of `ComputationMode`. Combined, this setup gives a flexible and modular platform that can be adapted for many problems at hand.

# Example

## logistic_1
Download the logistic_1 problem and put it into the 

    ug4/apps

folder.
