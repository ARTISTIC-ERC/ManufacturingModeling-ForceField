![artistic-erc](https://user-images.githubusercontent.com/50483699/107214721-9c558680-6a0a-11eb-9cab-19a2f3829127.png)

ManufacturingModeling-ForceField
========================================================

The performance, durability and cost of modern Li‐ion batteries (LIBs) strongly depend on their manufacturing process. In this regard, computational methods that attempt to model LIBs manufacturing have the potential to help experimentalists to reduce costs and improve performances of LIBs. To do so, the electrode slurry phase, consisting of a suspension of active material, carbon additive and binder in a solvent must be modeled at first at the mesoscopic scale. However, efforts in that sense are rare in literature due to the inherent complexity of slurries and the difficulty of setting up appropriate metrics for the validation of the modeling results. For the first time, we propose an approach relying on experimental data that allows to validate the properties of simulated Nickel‐Manganese‐Cobalt‐based slurries with different compositions and solid contents through force fields (FFs) parametrization. The latter was attained by Coarse‐Grained Molecular Dynamics (CGMD), which enables to model the slurry phase at the mesoscopic scale and to consider explicitly the carbon binder domain. Moreover, we demonstrate that the CGMD FFs parameterization can be accelerated thanks to different types of Particle Swarm Optimization‐based algorithms, which would allow faster screening of different simulated slurries fabrication conditions.

General Informations
========================================

The LPSO-HPSO code allows to optimize the FFs parameter of a CGMD simulation with respect of the slurry characteristics (in terms of both density and viscosity) of a NMC-based cathode slurry by using either a Learning-PSO approach, either a Human-Driven PSO, either a normal PSO. For any detail about the latter the interest readers are referred to the scientifc article titled "Accelerated Optimization Methods for Force-Field Parametrization in Battery Electrode Manufacturing Modeling" by Teo Lombardo, Jean-Baptiste Hoock, Emiliano N. Primo, Alain C. Ngandjong, Marc Duquesnoy and Alejandro A. Franco, published in April 2020 by Batteris & Supercaps (Wiley), DOI: 10.1002/batt.202000049.

This code has been developed to take into account the slurry density and the viscosity at two different shear-rates. 
The values of the latter can be modified by modifying the files "viscosityShearRate1.run.meta" and "viscosityShearRate2.run.meta" after the comment "Shear-rate". The input files provided here are setted for the shear-rates of 18 and 125 (s-1), whose are the values used for the afromentioned work.

The parameters optimize in this code refer to the use of an hybrid FF relying on both Lennard-Jones FF and Granular-Hertzian FF. The parameters to optimize can be modified, if needed, by moving the associate @Pi@ label in the input file ("inliqreal.run.meta", "viscosityShearRate1.run.meta" and "viscosityShearRate2.run.meta"). Their associated maximal and minimal values can be modulated as well by the text input "paramlrcs.txt". 
Consequently, this code can be easily adapted to other FFs or to approach using the same FFs but interested in optimizing different parameters.
On the other hand, if more than 8 parameters need to be optimized the C++ code (pso_ml.cpp) should be modified accordingly. 
 
The CGMD/NE-CGMD simulation uses LAMMPS computational software(https://lammps.sandia.gov/). Therefore, this opens source software should be installed as first before to used the PSO_ML code. 

This first version of the code (v0.0.0) will be improved as soon as possible with the final aim of improving the readibility and adaptability of the LPSO-HPSO code. Indeed, this code has been developed to be launched on a specific calculator (Matrics, Université de Picardie Jules Verne) and using the nodes specific to the ARTISTIC project (https://www.u-picardie.fr/erc-artistic/?L=0). Therefore, the code and the scripts to launch the CGMD/NE-CGMD simulations should be modified in order to correctly launch the code in different calculators/nodes. The next versions of this code will try to ease the needed modifications of the code in order to simplify the use of the latter for different nodes and calculator respect the ones used in the afromentioned work.

For any problem or question please contact the following: jean-baptiste.hoock@u-picardie.fr, teo.lombardo@u-picardie.fr, teo.lombardo3@gmail.com, alain.ngandjong@u-picardie.fr, alejandro.franco@u-picardie.fr


Launch the code
========================

1) Adapt the code and the script for the calculator and nodes that will be used for the CGMD/NE-CGMD simulations;
2) If needed, modify the parameters who need to be optimized by moving the associate @Pi@ label in the input files ("inliqreal.run.meta", "viscosityShearRate1.run.meta" and "viscosityShearRate2.run.meta"). Their associated maximal and minimal values can be modulated as well by the text input "paramlrcs.txt". If more than 8 parameters need to be optimized the C++ code (pso_ml.cpp) should be modified accordingly;
3) Select the shear-rates of interest by modifying the variable following the comment "Shear-rate" in the input files "viscosityShearRate1.run.meta" and "viscosityShearRate2.run.meta";
4) Select the experimental density and viscosity (at the shear-rate selected) at the beginning of the lpso.cpp file by definying "DENSITY_EXP", "VISCOSITY1_EXP" (for the shear-rate associated to the file viscosityShearRate1.run.meta) and "VISCOSITY2_EXP" (for the shera-rate associated to the file viscosityShearRate2.run.meta);
5) If a file named "results_0.csv" is found the code will work as Learning-PSO. The latter file should then contain the results obtained before through CGMD/NE-CGMD simulation in the same format then the file "results_0.csv.example".
6) If a file named "results_0.csv" is not found, the code will work as H-D PSO. The parameters value of one out of eight PSO particles for the first iteration of the HD-PSO can be controlled by reporting their values in the file "particle0_parameter.txt". In order to use the code as normal PSO please report in the latter files random values between their maximal and minimal limits previously defined in the file ""paramlrcs.txt".
7) Create a screen;
8) Compile and launch the code through the command "mypso.sh".


Outputs
=============================================

The code will outputs a file named "results.csv" which will report the FFs parameters values used for each particle for all the iterations performed. Associated to these values the final temperature obtained at the end of the slurry simulation (to check that the system reached the temperature desired) together with the slurry density (through CGMD simulation) and viscosity (and their standard deviation) at the shear-rates selected (through NE-CGMD) for each set of parameter tested is reported as well. Lastly the associated value of the cost function (indication how close or how far this set of parameters is respect the experimental condition chosen) for each set of parameter together to the global best (the minimal cost function) obtained up to the i-th iteration is reported.
The code also outputs a file to track the codes while running in order to ease the detection of errors named a_analyser.txt.

Please, do not hesitate to discover the team of researchers behind the library and also the ARTISTIC project involved : [ARTISTIC](https://www.u-picardie.fr/erc-artistic/?L=0)

 Authors
 ========================================================
  - **Teo Lombardo**, PhD
  - **Jean-Baptiste Hoock** , Researcher
  - **Emiliano N. Primo** , Post-Doc
  - **Alain Ngandjong** , Post-Doc
  - **Marc Duquesnoy** , ALISTORE PhD
  - **Alejandro A. Franco** , Principal Investigator
  
 Contributing 
========================================================


 Pull requests are not allowed. For more informations about the library, please contact the authors. Do not hesitate to ask them if inappropriate bugs occur.
 
 License
========================================================

This project is licensed under the [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) licence.


 Contributors
========================================================
  - **Teo Lombardo**, PhD
  - **Jean-Baptiste Hoock** , Researcher
  - **Emiliano N. Primo** , Post-Doc
  - **Alain Ngandjong** , Post-Doc
  - **Marc Duquesnoy** , ALISTORE PhD
  - **Alejandro A. Franco** , Principal Investigator




