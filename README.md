# DC Motor Speed Control using P and PI Controllers

## Project Overview
This project demonstrates **speed control of a DC motor using P and PI controllers** in Simulink.  
The objective is to study how controller parameters affect system performance such as **overshoot, rise time, settling time, and steady-state error**.

MATLAB scripts were used to automatically run simulations, extract results, and compute performance metrics.

---

# DC Motor Mathematical Model

The DC motor is modeled using electrical and mechanical dynamics.

Electrical equation:

L di/dt = u − Ri − cmω

Mechanical equation:

J dω/dt = cm i − Dω

Where:

- L → armature inductance  
- R → armature resistance  
- cm → motor torque constant  
- J → inertia  
- D → friction coefficient  
- ω → angular speed  

The model was implemented in **Simulink using integrators and gain blocks**.

---

# Controllers Used

## P Controller

The proportional controller generates a control signal proportional to the error between the reference speed and the measured speed.

u = Kp e

Characteristics:

- improves response speed  
- reduces error  
- **cannot eliminate steady-state error**

---

## PI Controller

The PI controller adds an **integral term** that accumulates the error over time.

u = Kp e + Ki ∫e dt

Effects:

- eliminates steady-state error  
- improves reference tracking  
- may increase overshoot if Ki is too large

---

# Performance Metrics

To evaluate controller performance the following metrics were used.

### Rise Time
Time required for the response to increase from **10% to 90% of the reference value**.

### Overshoot
Maximum amount the output exceeds the reference value.

Overshoot = (ω_peak − ω_ref)/ω_ref × 100

### Settling Time
Time required for the output to remain within **±2% of the reference value**.

### Steady-State Error
Difference between the final value and the reference speed.

---

# P Controller Tuning

Different values of **Kp** were tested to observe their effect on system behavior.

![P tuning](results/P_controller_different_Kp_comparison.pdf)

Observations:

- increasing **Kp** improves response speed  
- large **Kp** introduces oscillations  
- steady-state error remains present

---

# PI Controller Tuning

After selecting a suitable **Kp**, the integral gain **Ki** was varied to eliminate steady-state error.

![PI tuning](results/PI_controller_different_Ki_comparison.pdf)

Observations:

- increasing **Ki** removes steady-state error  
- very large **Ki** causes oscillations  
- proper tuning gives smooth convergence to reference speed

---

# Controller Comparison

Final comparison between P and PI controllers.

![P vs PI](results/P_vs_PI_Comparison.pdf)

Key observations:

- **P controller settles below the reference speed**
- **PI controller reaches the reference speed**
- PI control improves accuracy and eliminates steady-state error

---

# Performance Comparison

| Controller | Kp | Ki | Overshoot | Rise Time | Settling Time | Steady-State Error |
|------------|----|----|-----------|-----------|---------------|--------------------|
| P | 0.5 | 0 | small | medium | medium | present |
| PI | 0.6 | 4 | low | fast | short | ~0 |

---

# Conclusion

This study demonstrates the effect of controller parameters on DC motor speed control.

Key findings:

- P control improves response speed but leaves steady-state error.
- PI control removes steady-state error and improves reference tracking.
- Proper tuning of **Kp** and **Ki** results in stable and accurate motor speed control.

---

# Tools Used

- MATLAB
- Simulink

---

# Repository Structure
