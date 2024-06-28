# SDP Lift-and-Project software
This software package includes Python libraries for formulating Lov&aacute;sz and Schrijver's [1] Lift-and-Project semidefinite relaxations, along with MATLAB functions implementing a Cutting Plane method for solving them relying on a state-of-the-art Semidefinite Programming (SDP) solver [3]. Although this software is designed to be as general as possible, allowing the application of the Lov&aacute;sz and Schrijver's operator to any Linear Programming (LP) formulation, a strong emphasis has been placed on LP relaxations of the Maximum Stable Set Problem (MSSP).


## Features
 * Formulation of Lov&aacute;sz and Schrijver's [1] Lift-and-Project SDP relaxations
 * Formulation of a variety of LP relaxations for the MSSP
 * Solution of SDP relaxations of the MSSP via a Cutting Plane method


# Installation Guide
To install and use the software, UNIX platforms (i.e. Linux and MacOS) are strongly recommended. The easiest way to get this package on Windows is using the Windows Subsystem for Linux ([WSL](https://learn.microsoft.com/en-us/windows/wsl/install)).


## Prerequisites
- [Anaconda](https://www.anaconda.com)
- [MATLAB](https://matlab.mathworks.com)


## Optional requirements
This repo comes with all LP formulations used in computations already available. However, tools to replicate them are provided and rely on C routines `cliquer` [2]. In order to use these functionalities, the following packages are required:
- [Make](https://www.gnu.org/software/make/)
- [GCC](https://gcc.gnu.org)


## Installation Steps
1. Create `conda` environment `sdplift` (by default)
```
conda env create -f environment.yml
```
2. Activate the `conda` environment
```
conda activate sdplift
```
3. Run `install.py` to download and build dependencies [2, 3]
```
python install.py
```


# Usage
In `parameters.py`, the user can select the Datasets (see below) to run the experiments with and tune a variety of parameters. Detailed instructions on how to configure the experiments and description of each parameter can be found in that file.

1. Create LP and/or SDP formulations in Python (current folder should be `src/`)
```
python model_building.py
```
2. Solve them in MATLAB: open a MATLAB terminal (current folder should be `src/`)
```
run_experiments
```
3. Collect and analyze results by creating `LaTeX` tables in Python (optional)
```
python analyze_results.py
```

## Datasets
A collection of 5 datasets are provided as follows:
  * `DIMACS`: a collection of graphs selected from the Second DIMACS Implementation Challenge, a standard benchmark for Max Clique/Stable Set algorithms (total of 38 instances); 
  * `smallDIMACS`: a compact version of `DIMACS` containing graphs with up to 250 nodes only (total of 11 instances);
  * `Random`: a collection of Erdös–Rényi random graphs (total of 315 instances);
  * `smallRandom`: a compact version of `Random` containing graphs with 150 nodes only (total of 45 instances);
  * `testGraphs`: a collection of toy (but interesting) graphs.


## References
 1. L&aacute;szl&oacute; Lov&aacute;sz and Alexander Schrijver. *Cones of matrices and set-functions and 0–1 optimization*. SIAM journal on optimization, 1(2):166–190, 1991.
 2. Sampo Niskanen and Patric R. J. Östergård, *Cliquer User's Guide, Version 1.0*, Communications Laboratory, Helsinki University of Technology, Espoo, Finland, Tech. Rep. T48, 2003.
 3. Defeng Sun, Kim-Chuan Toh, Yancheng Yuan, and Xin-Yuan Zhao. *SDPNAL+: A Matlab software for semidefinite programming with bound constraints*. Optimization Methods and Software, 35(1):87–115, 2020.
