**Dynamic model**
*restore the saved file from static model 
rest IMAGE.sav

*reset histories and snapshots
reset his 
reset snap 

*allow fault to slip
stope n=1 slip=mc
stope n=2 slip=mc
stope n=3 slip=mc
stope n=4 slip=mc
stope n=5 slip=mc
stope n=6 slip=mc
stope n=7 slip=mc


his mx_vel dt=1

*Create history points with the x and y velocity at x and y coordinates
his xvel(281,201,1) yvel(281,201,1)
his xvel(201,201,1) yvel(201,201,1) 
his xvel(101,201,1) yvel(101,201,1) 


his xvel(281,101,1) yvel(281,101,1) 
his xvel(201,101,1) yvel(201,101,1) 
his xvel(101,101,1) yvel(101,101,1) 

his xvel(401,101,1) yvel(401,101,1) 
his xvel(501,101,1) yvel(501,101,1) 


*plot snapshots of absolute Velocity every 10 cycles
pl snap vabs rep=10


cy 1000

pl his all
damp off
save

pl dump

pl snap sg1

pl snap s22

*snapshot line plotting fault displacement 
pl lsnap T1slip (st=1)
pl lsnap T1slip (st=2)
pl lsnap T1slip (st=3)
pl lsnap T1slip (st=4)
pl lsnap T1slip (st=5)
pl lsnap T1slip (st=6)
pl lsnap T1slip (st=7)


set uvar essfr=30
pl lsnap ess i=280 j=10,290 

set uvar essfr=25
pl lsnap ess i=280 j=10,290 



set log off
name 
ret 