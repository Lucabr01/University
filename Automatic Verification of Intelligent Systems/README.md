## Table of Contents

1. [Introduction](#1-introduction)
2. [Soft-Actor-Critic based model](#2-soft-actor-critic-based-model)
   1. [Environment description](#21-environment-description)
   2. [Custom Reward Function](#22-custom-reward-function)
   3. [Training](#23-training)
   4. [Results](#24-results)
3. [Evolutionary Strategies](#3-evolutionary-strategies)

      
# 1. Introduction

Data centers are currently among the most power-consuming infrastructures around the world, where a substantial portion of total power consumption is devoted to cooling systems. The server reliability can only be assured under optimal thermal conditions to avoid overheating; however, traditional static or rule-based control policies result in profound energy inefficiencies. This project addresses the Data Center Cooling Optimization Problem by resorting to an intelligent control approach using Reinforcement Learning.

All the work is done in a Sinergym-based environment.
Sinergym [ref] is a Python framework that connects EnergyPlus [ref], a building simulation engine, with
Gymnasium interfaces. In practice, this allows us to use realistic building models and control their
**HVAC (Heating, Ventilation & Air Conditioning)** systems through RL algorithms. 

In simple terms, the agent will learn a control policy that reduces unnecessary energy use without letting
the temperature exceed safe limits for the IT equipment.

Formally, the two main goals of the agent are:

- **Maintaining thermal comfort:** keeping the internal air temperature of the datacenter within the optimal comfort range of **18°C–27°C** (ASHRAE recommended temperature level standard for data centers [ref]).
- **Reducing energy consumption:** minimizing the total **HVAC electricity demand** compared to a static baseline control (e.g., fixed setpoint at 21.5°C), while still maintaining acceptable thermal comfort.

So the agent aims to find the optimal balance between comfort and energy efficiency, maximizing the overall reward.

# 2. Soft-Actor-Critic based model



## 2.1 Environment description
## 2.2 Custom Reward Function
## 2.3 Training
## 2.4 Results

# 3. Evolutionary Strategies
