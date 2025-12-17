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

## Abstract

Photovoltaic modules play a central role in meeting the growing global demand for renewable energy, yet their electrical efficiency declines as operating temperature rises. This thesis investigates the height-dependent effects of cylindrical vortex generators on photovoltaic module temperature reduction under forced convection conditions.

**Key Findings:**
- **15 mm vortex generators** were most effective at reducing module temperature
- Identified critical influence of **ambient temperature** on vortex generator performance
- Discovered **tripod positioning effects** that affected previous experimental results
- Module temperature changes ranged from **+1.12°C heating** (low ambient temp) to **-0.99°C cooling** (high ambient temp)

---

## Research Objectives

1. Confirm existing results on cylindrical vortex generators' ability to reduce PV module temperature
2. Identify optimal vortex generator height for maximum temperature reduction
3. Refine experimental testing procedures for improved accuracy and repeatability

---

## Methodology

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

## Key Results

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

## Repository Structure
```
mechanical-engineering-thesis-c/
├── README.md                              # This file
├── References.bib                         # Bibliography references
├── main.tex                               # Main LaTeX compilation file
├── z5359644_thesis_c.pdf                  # Compiled thesis document
│
├── Figures/                               # All figures and images
│   ├── experimental_setup/                # Rig diagrams and photos
│   ├── results/                           # Result graphs and plots
│   └── literature/                        # Literature review figures
│
├── MATLAB/                                # MATLAB processing scripts
│   ├── average_ambient_temperature_function.m
│   ├── correlationmultipleprocessing.m
│   ├── dewarping.m
│   └── newdeltaTmultipleprocessingv23.m
│
└── Sections/                              # LaTeX chapter files
    ├── Abstract.tex
    ├── Acknowledgments.tex
    ├── Appendix.tex
    ├── Conclusion.tex
    ├── Introduction.tex
    ├── Literature Review.tex
    ├── Methodology.tex
    ├── Nomenclature.tex
    ├── Originality Statement.tex
    ├── Reference Examples.tex
    ├── Results and discussion.tex
    └── TitlePage.tex
```

---

## Installation & Usage

### Prerequisites
```bash
# MATLAB R2020a or later
# FLIR Tools software
# LaTeX distribution (TeXLive, MiKTeX, etc.)
```

### MATLAB Scripts

#### 1. De-warping IR Images
```matlab
% Load and run Dewarping.mlx
% Select VG logbook when prompted
% Select IR data CSV files from FLIR Tools
% Follow on-screen prompts for corner detection
```

**Usage:**
1. Export thermal images from FLIR E95 using FLIR Tools
2. Configure emissivity (0.89) and reflective temperature
3. Export as CSV files
4. Run `Dewarping.mlx` and select appropriate logbook
5. Manually correct corner detection if needed

#### 2. Calculate Temperature Difference
```matlab
% Run new_deltaT_multiple_processing_v2_3.m
% Select VG data logbook
% Input line numbers for analysis
% Define area of interest (default: rows 3-4, cols 5-7)
```

**Example Output:**
```
Negative value represents cooling
Line 1: ΔT = -1.12°C (heating)
Line 2: ΔT = +0.36°C (cooling)
```

#### 3. Average Ambient Temperature
```matlab
% Run average_ambient_temp.m with CoolTerm data
% Input target time (HH:MM format)
% Script outputs average temperature
```

**Example:**
```matlab
>> Enter target time (HH:MM): 12:34
>> Average of 5th column for 12:34 entries: 19.85°C
```

---

## Energy Balance Analysis

The research employed comprehensive energy balance equations:
```
Q_in = Q_conv,top + Q_conv,bottom + Q_rad,top + Q_rad,bottom + Q_cond,array
```

**Where:**
- **Q_conv**: Convective heat transfer (top/bottom surfaces)
- **Q_rad**: Radiative heat transfer (top/bottom surfaces)  
- **Q_cond,array**: Conductive heat transfer to VG array

**Key Finding:** The 75 mm array's reduced bottom-surface convection (104.05 W vs 127.36 W for 15 mm) was attributed to decreased inlet cross-sectional area, reducing mass flow rate and convective heat transfer coefficient.

---

## 🎓 Academic Context

### Building on Previous Work

- **S. Schiffmann (2023):** VG orientation effects
- **I.R. Chaudhury (2024):** VG geometry optimization
- **Z. Zhou (2024):** VG spacing configuration

### Novel Contributions

1. First systematic study of VG height effects on PV cooling
2. Discovery of ambient temperature's non-linear influence
3. Identification of experimental artifacts from tripod positioning
4. Refined testing methodology for future research

---

## Citation

If you use this research, please cite:
```bibtex
@thesis{sivalingam2025vortex,
  author    = {Sivalingam, Nathan},
  title     = {An Investigation into the Height Effects of Vortex Generators on 
               Photovoltaic Module Temperature Reduction under Forced Convection Conditions},
  school    = {University of New South Wales},
  year      = {2025},
  type      = {Bachelor of Engineering Thesis},
  month     = {November},
  address   = {Sydney, Australia}
}
```

---

## Future Work

### Recommended Extensions

1. **Rig Improvements:** Enable secure 150 mm VG testing with reinforced acrylic roofing
2. **Height Range:** Test intermediate heights (20-70 mm) for optimal configuration
3. **Baseline Validation:** Re-run baseline tests at high ambient temperatures with corrected setup
4. **Independent Verification:** Validate Zhou et al. and Chaudhury et al. results with side-positioned camera
5. **Placement Study:** Compare roof-mounted vs underside VG configurations

---

## Safety & Risk Assessment

All experimental work conducted under UNSW safety protocols:

- Aerodynamics Lab Induction completed
- MME HSE Orientation & Quiz
- Hazardous Chemicals Course
- Lab Health & Safety Course
- Safety@UNSW Course

**Risk Level:** Medium - See Appendix E for full risk assessment.

---

## Acknowledgments

- **Dr Charitha de Silva** - Exceptional guidance and mentorship
- **Matthew Deng** - Weekend testing, troubleshooting, and CFD analysis
- **Shubhneet Sodhi** - Collaborative problem-solving and support
- **UNSW Aerodynamics Lab** - Facility access and technical support

---

## Contact

**Nathan Sivalingam**  
- Email: z5359644@unsw.edu.au
- Institution: UNSW Sydney
- School: Mechanical and Manufacturing Engineering

---

## License

This thesis is submitted as a requirement for the degree of Bachelor of Engineering in Mechanical Engineering at UNSW Sydney. All rights reserved.

---

*"Challenge is inseparable from purpose."* - From the acknowledgments

**Note:** This research represents a significant advancement in passive cooling strategies for photovoltaic modules, with direct applications for rooftop solar installations and utility-scale solar farms contributing to global renewable energy transition.
