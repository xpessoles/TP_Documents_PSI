# -*- coding: utf-8 -*-
"""
Created on Fri Jan 21 07:27:14 2022

@author: xpess
"""
import numpy as np
import matplotlib.pyplot as plt

def trapeze(les_t:list,t1:float,t2:float,amax:float,vmax:float)->list :
    """
    Détermination des loi horaires en trapèze

    Parameters
    ----------
    les_t : list
        DESCRIPTION.
    t1 : float
        temps d'accélération.
    t2 : float
        temps d'accélération + vitesse constante
    amax : float
        DESCRIPTION.
    vmax : float
        DESCRIPTION.

    Returns
    -------
    list 
        DESCRIPTION.

    """
    les_pos = []
    les_vit = []
    les_acc = []
    x1,v1 = 0,0
    x2,v2 = 0,0

    for t in les_t : 
        if t<t1 : 
            les_pos.append(0.5*amax*t*t)
            les_vit.append(amax*t)
            les_acc.append(amax)
            x1,v1,t11 = les_pos[-1], les_vit[-1],t
        elif t>=t1 and t<t2 :
            les_pos.append(v1*(t-t11)+x1)
            les_vit.append(v1)
            les_acc.append(0)
            x2,v2,t22 = les_pos[-1], les_vit[-1],t
        elif t>=t2 and t<=t1+t2 :
            les_pos.append(-0.5*amax*(t-t22)**2+v2*(t-t22)+x2)
            les_vit.append(v2-amax*(t-t22))
            les_acc.append(-amax)
        else :
            les_pos.append(les_pos[-1])
            les_vit.append(0)
            les_acc.append(0)
        
    return np.array(les_pos),np.array(les_vit),np.array(les_acc)

def plot_pva(les_t,les_pos,les_vit,les_acc):
    plt.plot(les_t,les_pos)
    plt.plot(les_t,les_vit)
    plt.plot(les_t,les_acc)
    plt.grid()
    plt.show()

    
def loi_ES(les_theta,R,H):
    les_phi = np.arctan2(H+R*np.sin(les_theta),R*np.cos(les_theta))    
    return les_phi


def deriv(les_t,les_x):
    les_v = []
    for i in range(len(les_t)-1):
        les_v.append((les_x[i+1]-les_x[i])/(les_t[i+1]-les_t[i]))
    les_v.append(les_v[-1])
    return np.array(les_v)
    
J1 =  188939e-9 # kgm2
J2 = 2233294973e-9 # kgm2
t1 = .1645 # 
t2 = t1+0.671 

theta_0 = -np.radians(30.61)
vmax = 4.93 # rad/s
amax = 30 # rad/s²
R,H = 0.081,0.112 # A modifier
 
les_t = np.linspace(0,t1+t2+t1,12000) # On rajoute +t1 pour avoir des points en plus...

les_pos,les_vit,les_acc = trapeze(les_t, t1, t2, amax, vmax)


# Calcul des positions
les_theta = les_pos + theta_0
les_phi = loi_ES(les_theta,R,H)
plt.plot(les_t,np.degrees(les_theta))
plt.plot(les_t,np.degrees(les_phi))

# Calcul des vitesses
les_thetap = deriv(les_t,les_theta)
les_phip = deriv(les_t,les_phi)
plt.figure()
plt.plot(les_t,les_thetap)
plt.plot(les_t,les_phip)

# Calcul des accélerations
les_thetapp = deriv(les_t,les_thetap)
les_phipp = deriv(les_t,les_phip)
plt.figure()
plt.plot(les_t,les_thetapp)
plt.plot(les_t,les_phipp)


# les_theta = les_pos
# les_phi = loi_ES(les_theta,R,H)

# les_thetap = deriv(les_t,les_theta)
# les_phip = deriv(les_t,les_phi)

# les_thetapp = deriv(les_t[:-1],les_thetap)
# les_phipp = deriv(les_t[:-1],les_phi)

# plt.plot(les_theta,label='Entrée')
# plt.plot(les_phi,label='Sortie')
# plt.legend()
Mu,M,g = 0.5,5,9.81
alpha =np.radians(45)
deb,fin = 1,1000

Cm = (J2*les_thetap*les_thetapp+J1*les_phip*les_phipp+Mu*M*g*np.cos(les_phi-alpha)*les_thetap)/les_thetap
plt.plot(les_t,Mu*M*g*np.cos(les_phi-alpha))
#Cm = (J2*les_thetap[deb:fin]*les_thetapp[deb:fin]+J1*les_phip[deb:fin]*les_phipp[deb:fin])/les_thetap[deb:fin]
plt.figure()
plt.plot(les_t,Cm)
# # ENTREE : THETA
# # SORTIE : PHI