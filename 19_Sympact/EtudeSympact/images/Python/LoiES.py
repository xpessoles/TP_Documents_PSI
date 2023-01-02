import numpy as np
import matplotlib.pyplot as plt
import math as m
H = 112
R = 81
r = 15
M = 3.5
g = 9.8
mu = 1
alpha = np.pi/4
theta_i = m.radians(-(180-149.39))
theta_f = m.radians(360-144.65)
    
les_theta = np.linspace(theta_i,theta_f,100)
les_phi =np.arctan2(H+R*np.sin(les_theta),R*np.cos(les_theta))


les_delta = 4*H*H*np.sin(les_phi)*np.sin(les_phi)-4*(H*H-R*R)

les_lambda_p = (2*H*np.sin(les_phi)+np.sqrt(les_delta))/4
les_lambda_m = (2*H*np.sin(les_phi)-np.sqrt(les_delta))/4

plt.plot(np.rad2deg(les_phi),les_lambda_m)
plt.plot(np.rad2deg(les_phi),les_lambda_p)

les_Cr = -23*les_phi+23*3*np.pi/4
les_Cr = 0*les_Cr
les_Cm = r*np.sin(les_phi-les_theta)*(les_Cr-M*g*mu*np.cos(les_phi-alpha))/(les_lambda_p)
#plt.plot(np.rad2deg(les_phi),les_Cr)
#plt.plot(np.rad2deg(les_phi),les_Cm)
plt.grid()
plt.show()
"""les_lambda_p = np.sin(les_phi)*H+np.sqrt(H*H*np.sin(les_phi)*np.sin(les_phi)*-H*H+R*R)   
les_lambda_m = np.sin(les_phi)*H-np.sqrt(H*H*np.sin(les_phi)*np.sin(les_phi)*-H*H+R*R)   

"""
"""
plt.xlabel('$\\varphi$ -- Barrière')
plt.ylabel('$\\theta$ -- Moteur')
print(les_phi[-1]-les_phi[0])
print(les_phi[0])
plt.axis("equal")
plt.plot(np.rad2deg(les_phi),np.rad2deg(les_theta))
plt.show()
"""


    


