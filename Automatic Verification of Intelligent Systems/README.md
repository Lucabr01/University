## Table of Contents

1. [Introduction](#1-introduction)
2. [Soft-Actor-Critic based model](#2-soft-actor-critic-based-model)
   1. [Environment description](#21-environment-description)
   2. [Custom Reward Function](#22-custom-reward-function)
   3. [Training](#23-training)
   4. [Results](#24-results)
3. [Evolutionary Strategies](#3-evolutionary-strategies)

      
# 1. Introduction

Data centers are among the most power-consuming infrastructures worldwide, and a substantial portion of their total energy usage is devoted to cooling. Server reliability depends on maintaining safe thermal conditions, yet traditional static or rule-based cooling strategies often lead to severe energy inefficiencies.   This project addresses the Data Center Cooling Optimization Problem through intelligent control techniques based on Reinforcement Learning.

The entire work is carried out in a Sinergym-based environment.  
Sinergym [ref] is a Python framework that integrates EnergyPlus [ref], a building-level simulation engine, with the Gymnasium API. This makes it possible to control realistic HVAC (**Heating, Ventilation & Air Conditioning**) systems using RL agents.

In simple terms, the agent learns how to reduce unnecessary energy consumption without letting temperatures exceed safe limits for IT equipment.

Formally, the two main goals of the agent are:

- **Maintaining thermal comfort:** keeping the internal air temperature of the datacenter within the optimal comfort range of **18°C–27°C** (ASHRAE recommended level [ref]).  
- **Reducing energy consumption:** minimizing the total **HVAC electricity demand** compared to a static baseline (e.g., fixed setpoint at 21.5°C), while still maintaining acceptable comfort.

To explore different learning paradigms, the project evaluates **two control approaches**:  
a model-free **Soft-Actor-Critic (SAC)** agent and a gradient-free **Evolutionary Strategies (ES)** agent.  
Both aim to find the optimal balance between comfort and energy efficiency, maximizing overall performance.

# 2. Soft-Actor-Critic based model

This section presents the architecture and training procedure of the SAC agent designed for datacenter cooling control. After defining the environment and the observation–action structure, we describe the custom reward function used to balance thermal comfort and energy efficiency. Finally, we detail the training configuration and report the performance metrics obtained during evaluation.

The choice of SAC is not arbitrary. Prior work, including the study by **Bienmann et al.** [ref], shows that SAC provides **faster and more stable convergence** than other continuous-control RL algorithms in datacenter cooling tasks. This makes it a strong baseline for comparison with alternative methods such as ES.


## 2.1 Environment description
## 2.2 Custom Reward Function
## 2.3 Training
## 2.4 Results

# 3. Evolutionary Strategies
