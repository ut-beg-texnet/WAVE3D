**static model- base conditions**
**the model has to run first in static mode to balance the stress forces where the fault cannot slip, then turn to dynamic mode  

*set timer on to get the model run time on the log file
set timer on 

*solve 4th order wave equation
set ord 4

*create a log file
set log on

*create a grid with x,y,z (width, heigth, length) in number of elements and element dimentions equivelently, 
*when run a 2D model use a single element in z direction in meters
gr 560 400 1 2.5 2.5 2.5

*material properties for the medium
*s=shear modulus (Pa), b=bulk modulus (Pa), dens=density (kg/m^3)
prop mat=1 s=9.27e9 b=14.74e9 dens=2700

*geometry of the fault creating 7 sections, i&j are width and height coordinates, 
*type 3 fault is enabling fault to slip when turn to dynamic model 
stope n=1 typ=3 i=280 j=350,390
stope n=2 typ=3 i=280 j=310,350
stope n=3 typ=3 i=280 j=270,310
stope n=4 typ=3 i=280 j=230,270
stope n=5 typ=3 i=280 j=190,230
stope n=6 typ=3 i=280 j=150,190
stope n=7 typ=3 i=280 j=110,150

*fault properties kn=normal stiffness (Pa), ks=shear stiffness (Pa), fric=friction angle (degrees), coh=cohesion (Pa)
stope n=1 kn=1e6 ks=1e6 fric=30 coh=10e6
stope n=2 kn=1e6 ks=1e6 fric=30 coh=10e6
stope n=3 kn=1e6 ks=1e6 fric=40 coh=10e6
stope n=4 kn=1e6 ks=1e6 fric=40 coh=10e6
stope n=5 kn=1e6 ks=1e6 fric=40 coh=16e6
stope n=6 kn=1e6 ks=1e6 fric=30 coh=18e6
stope n=7 kn=1e6 ks=1e6 fric=30 coh=20e6

*Stress applied to the fault surface 
*sign=normal stress (Pa/m) st10=shear stress (Pa/m)
stope n=1 sign=1.61e6 st10=-1.37e6
stope n=2 sign=4.82e6 st10=-4.16e6
stope n=3 sign=8.03e6 st10=-6.83e6
stope n=4 sign=11.24e6 st10=-9.55e6
stope n=5 sign=14.47e6 st10=-12.3e6
stope n=6 sign=17.68e6 st10=-15.03e6
stope n=7 sign=20.87e6 st10=-17.74e6

*fault set to  slip off for the static mode
stope n=1 slip=off
stope n=2 slip=off
stope n=3 slip=off
stope n=4 slip=off
stope n=5 slip=off
stope n=6 slip=off
stope n=7 slip=off

*boundary stress due to water load applied at the top of the model 
bou s22=-3.9e5 s12=0e6 i=140,180 j=401 
bou s22=-6.8e5 s12=0e6 i=180,230 j=401 
bou s22=-9.8e5 s12=0e6 i=230,330 j=401  
bou s22=-6.8e5 s12=0e6 i=330,380 j=401 
bou s22=-3.9e5 s12=0e6 i=380,420 j=401 

*boundary stress rebounding force to balance the forces applied to the model
bou s22=-3.525e5 s12=0e6 i=1,561 j=1

*Mass-proportional damping is provided to absorb energy from the mesh, and improve convergence toward a static solution.
damp auto 

*give a coarse indication of how the model printing the maximum grid velocity 
his mx_vel dt=100

*number of cycles the model will run
cy 40000

*plot all histories
pl his all

*set dampiing off to turn the model to dynamic mode
damp off 

*save model state
save

*plot dump (include stress & velocity vectors)
pl dump

*plot snapshot of normal stress
pl snap sg1

*plot snapshot of S22 stress
pl snap s22

*set friction angle to calculate the Excess Shear Stress
set uvar essfr=30

*Create a snapshot line with ESS in fault line
pl lsnap ess i=280 j=10,290 

set uvar essfr=25
pl lsnap ess i=280 j=10,290 

*closing the log file
set log off
name 
ret 