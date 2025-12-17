# An Investigation into the Height Effects of Vortex Generators on Photovoltaic Module Temperature Reduction under Forced Convection Conditions

[![License](https://img.shields.io/badge/License-Academic-blue.svg)](LICENSE)
[![UNSW](https://img.shields.io/badge/Institution-UNSW%20Sydney-yellow.svg)](https://www.unsw.edu.au/)
[![Thesis](https://img.shields.io/badge/Degree-BEng%20Mechanical-red.svg)](https://www.engineering.unsw.edu.au/)

> **Author:** Nathan Sivalingam (z5359644)  
> **Supervisor:** Dr Charitha de Silva  
> **PhD Candidate:** Matthew Deng  
> **Institution:** School of Mechanical and Manufacturing Engineering, UNSW Sydney  
> **Submitted:** 21 November 2025

This repository contains the LaTeX source files, figures, and MATLAB processing scripts for my undergraduate thesis titled: **"An Investigation into the Height Effects of Vortex Generators on Photovoltaic Module Temperature Reduction under Forced Convection Conditions."**

---

## 📋 Abstract

Photovoltaic modules play a central role in meeting the growing global demand for renewable energy, yet their electrical efficiency declines as operating temperature rises. This thesis investigates the height-dependent effects of cylindrical vortex generators on photovoltaic module temperature reduction under forced convection conditions.

**Key Findings:**
- **15 mm vortex generators** were most effective at reducing module temperature
- Identified critical influence of **ambient temperature** on vortex generator performance
- Discovered **tripod positioning effects** that affected previous experimental results
- Module temperature changes ranged from **+1.12°C heating** (low ambient temp) to **-0.99°C cooling** (high ambient temp)

---

## 🎯 Research Objectives

1. Confirm existing results on cylindrical vortex generators' ability to reduce PV module temperature
2. Identify optimal vortex generator height for maximum temperature reduction
3. Refine experimental testing procedures for improved accuracy and repeatability

---

## 🔬 Methodology

### Experimental Setup
- **Location:** UNSW Large Aerodynamics Wind Tunnel
- **PV Module:** WINAICO Perc Series P6 WST-285P6 (285W, 60 cells)
- **Wind Speeds:** 1, 2, and 3 m/s
- **Vortex Generator Heights:** 15 mm, 75 mm, 150 mm
- **Array Configuration:** 51 mm span-wise × 79 mm stream-wise spacing
- **Module Inclination:** 45° (NOCT standard)

### Equipment
- FLIR E95 thermal imaging camera
- K-type thermocouples
- Hot-wire and vane anemometers
- DC power supply (QPX1200SP)
- 3D-printed PLA cylindrical vortex generators

### Data Processing
- **FLIR Tools:** IR image processing and CSV export
- **MATLAB:** Image de-warping and temperature analysis
- **CFD Analysis:** Flow visualization and validation

---

## 📊 Key Results

### 1. Tripod Positioning Effect
- Central tripod placement created **artificial cooling** via Kármán vortices
- Side positioning eliminated interference
- Previous studies may require result reconsideration

### 2. Ambient Temperature Influence
- **Lower ambient temps:** VG arrays increased module temperature
- **Higher ambient temps:** VG arrays decreased module temperature
- 15 mm array showed **reduced gradient** (0.9 vs 1.2-1.3 baseline)

### 3. Optimal Height Performance (15 mm)

| Wind Speed | Heating @ Low Temp | Cooling @ High Temp | Transition Point |
|------------|-------------------|---------------------|------------------|
| 1 m/s      | +1.12°C @ 19.9°C  | -0.36°C @ 25.5°C    | 24.4°C          |
| 2 m/s      | +1.08°C @ 20.6°C  | -0.79°C @ 25.8°C    | 23.5°C          |
| 3 m/s      | +0.88°C @ 21.6°C  | -0.99°C @ 26.7°C    | 24.2°C          |

---

## 📁 Repository Structure
