# 3D Printing of Invariant Manifolds in Dynamical Systems
<p align="center">
  <img src="images/IMG_2078.jpeg" alt="Stable manifold of the Lorenz equation" width="400">
</p>

## Overview
This repository contains resources for creating tangible visualizations of invariant manifolds in ordinary differential equations. Our approach combines advanced computational techniques with modern 3D printing processes to transform mathematical abstractions into physical models, providing new perspectives on complex dynamical systems.

## Purpose
Given the highly nonlinear nature of specific dynamical systems, we employ a diverse array of computational tools and software packages to:
1. Generate accurate numerical approximations of invariant manifolds
2. Create 3D renderings suitable for physical printing
3. Perform the necessary structural thickening and reinforcement
4. Produce tangible models that preserve mathematical properties

## Key Features
- Enable physical inspection of abstract mathematical objects, potentially revealing insights that are difficult to discern from purely digital representations
- Implement accurate computational visualization techniques with broad applicability
- Develop novel methods for structural reinforcement of delicate mathematical surfaces
- Integrate multiple computational frameworks for enhanced accuracy and reliability

## Technical Stack
### Primary Software
- **Wolfram Mathematica®** for core computations and manifold generation
- **MATLAB** for specialized numerical analysis
### Supporting Tools
- **CAD Software**
  - Blender for mesh manipulation and preparation
  - MeshLab for mesh analysis and repair
- **3D Printing Software**
  - Cura for slicing and print preparation
- **Custom numerical algorithms** for manifold computation and structural optimization

## Examples
Our work addresses the challenges of translating complex manifolds into printable meshes, showcasing results for:
- The Lorenz attractor
- Arneodo-Coullet-Tresser equations 
- Langford system

## Repository Structure
```
3DPrintingInvariantManifolds/
├── Examples/
│   ├── Arneodo-Coullet-Tresser/
│   ├── LangfordSystem/
│   ├── Langford_Miscellaneous/
│   ├── LorenzManifoldPoints/
│   └── PrintableFiles/
├── images/
├── LICENSE
└── README.md
```

### Examples Directory
The `Examples` directory contains implementations and data files for various dynamical systems:

#### Arneodo-Coullet-Tresser
Implementation of the Arneodo-Coullet-Tresser system
- `ArneodoDifferential.m`: Jacobian for the Arneodo system
- `ArneodoF.m`: Arneodo system function implementation
- `Arneodo_main.m`: Main script for Arneodo system
- `getCoeffsArneodo.m`: Function for computing coefficients for the Arneodo system
- `itstartpoints_arn0863.csv`: CSV data file with starting points
- `makemanifoldArneodo2.nb`: Mathematica notebook for generating Arneodo manifolds

#### LangfordSystem
Code for the Langford system, including stable/unstable manifold calculations
- `TriFundDomES.m`: Triangulate fundamental domain for the Langford system
- `driver_writepoints.m`: Driver script for writing unstable manifold points for alpha = 1.1022
- `driver_writepoints_stable.m`: Driver script for stable manifold calculations for alpha = 1.1022
- `evaluate_complexCase.m`: Function to evaluate complex case calculations
- `getCoeffs.m`: Function for computing coefficients for the Langford system
- `horner.m`: Implementation of Horner's method
- `itstartpoints11022.csv`: CSV data file with starting points for unstable manifold
- `itstartpoints11022s.csv`: CSV data file with starting points for stable manifold
- `mfdsurf11022.nb`: Mathematica notebook for manifold surface generation
- `mfdsurf11022s.nb`: Mathematica notebook for stable manifold surface generation

#### Langford_Miscellaneous
Miscellaneous files related to the Langford system with various parameter values
- `itstartpoints700.csv`: CSV data file with starting points for alpha parameter value 0.700
- `itstartpoints806.csv`: CSV data file with starting points for alpha parameter value 0.806
- `itstartpoints9321.csv`: CSV data file with starting points for alpha parameter value 0.9321
- `itstartpoints950.csv`: CSV data file with starting points for alpha parameter value 0.950
- `makemanifoldTubeVaryParameter.nb`: Consolidated Mathematica notebook for creating tube-method manifolds with varying parameters
- `makemfldSurfaceVaryParameter.nb`: Consolidated Mathematica notebook for creating surface-method manifolds with varying parameters

#### LorenzManifoldPoints
Point data and code for Lorenz stable manifold visualizations and 3D printing
- `LorenzF.m`: Lorenz system function implementation
- `driver_Lorenz_Disc.m`: Driver script for Lorenz disc computation
- `getCoeffsLorenz.m`: Function to compute coefficients for the Lorenz system
- `lorenzDifferential.m`: Jacobian for the Lorenz system
- `lorenzdiscws.csv`: CSV data file with Lorenz disc points
- `makelorenzmfldScaled_LATEST.nb`: Mathematica notebook for generating scaled Lorenz manifolds

#### PrintableFiles
Ready-to-print files for 3D printing manifolds
- `Langford11022s.stl`: STL file for Langford system stable manifold for alpha = 1.1022
- `Langford11022u.stl`: STL file for Langford system unstable manifold for alpha = 1.1022
- `Langford806.stl`: STL file for Langford system with alpha parameter value 0.806
- `lorenzBIG.stl`: Large-scale STL file for Lorenz stable manifold
- `lorenzSM.obj`: OBJ format file for Lorenz stable manifold (small version)
- `lorenzSM.stl`: STL format file for Lorenz stable manifold (small version)

## Citing This Work
If you use this software or methodology in your research, please cite our paper:
```
3D Printing of Invariant Manifolds in Dynamical Systems.
Patrick R. Bishop, Summer Chenoweth, Emmanuel Fleurantin, 
Alonso G. Oguedo Oliva, Evelyn Sander, and Julia A. Seay, 2025.
arXiv:[identifier]
```

## Contact
For questions, bug reports, or collaboration inquiries, please use the GitHub issue tracker or contact the authors directly.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

---
Last updated: March 2025
