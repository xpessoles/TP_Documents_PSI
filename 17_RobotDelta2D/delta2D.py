from scipy.optimize import fsolve
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve
import math as m

# Trajectoire : Montée suivant y0.


les_xF = np.concatenate((np.linspace(-150,-150,200),np.linspace(-150,150,300),np.linspace(150,150,200)))
les_yF = np.concatenate((np.linspace(400,200,200),np.linspace(200,200,300),np.linspace(200,400,200)))
les_xF1 = np.linspace(-150,-150,200)
les_yF1 = np.linspace(400,200,200)
les_xF2 = np.linspace(-150,150,300)
les_yF2 = np.linspace(200,200,300)
les_xF3 = np.linspace(150,150,200)
les_yF3 = np.linspace(200,400,200)

L = 330
l = 170
a = 60


def syst(var):
    a1 = var[0]
    a2 = var[1]
    eq1 = L*L - (xf-l*np.cos(a1)-a)**2-(yf-l*np.sin(a1))**2
    eq2 = L*L - (xf-l*np.cos(a2)+a)**2-(yf-l*np.sin(a2))**2
    return [eq1,eq2]
    
    

def solve_pb():
    # Initialisation de la résolution
    sol_ini = [m.radians(30),m.radians(120)]
    global xf
    global yf
    xf = les_xF[0]
    yf = les_yF[0]
    res = fsolve(syst,sol_ini)
    les_alpha1 = [m.degrees(res[0])]
    les_alpha2 = [m.degrees(res[1])]
    for i in range(1,len(les_xF)):
        sol_ini = [m.radians(les_alpha1[-1]),m.radians(les_alpha1[-1])]
        xf = les_xF[i]
        yf = les_yF[i]
        res = fsolve(syst,sol_ini)
        les_alpha1.append(m.degrees(res[0]))
        les_alpha2.append(m.degrees(res[1]))
    return les_alpha1,les_alpha2
    


les_alpha1,les_alpha2 = solve_pb()

LT_1 = np.arcsin((-L*L+l*l+les_yF**2+(les_xF-a)**2)/(2*l*np.sqrt((les_xF-a)**2+les_yF**2)))-np.arctan2(les_xF-a,les_yF)

YS_alpha1 = np.arccos((2*a*l-2*l*les_xF)/np.sqrt((2*a*l-2*l*les_xF)**2+(-2*l*les_yF)**2))+np.arccos((L*L-a*a+2*a*les_xF-les_xF**2-les_yF**2-l*l)/(np.sqrt((2*a*l-2*l*les_xF)**2+(-2*l*les_yF)**2)))

GP_alpha2 = np.arccos((l*l+a*a+les_xF**2-L**2 + 2*les_xF*a+les_yF**2)/np.sqrt((-2*a*l-2*les_xF*l)**2+ (2*l*les_yF)**2 )) + np.arccos(((-2*a*l-2*les_xF*l)/ (np.sqrt((-2*a*l-2*les_xF*l)**2+ (2*l*les_yF)**2 ))))

CM_alpha1 = np.arccos(-L*L+l*l+les_xF**2-2*les_xF*a+a*a+les_yF**2)/(np.sqrt((-2*a*l+2*l*les_xF)**2+(2*les_yF*l)**2)) + np.arctan2(2*les_yF*l,-2*a*l+2*l*les_xF)

#LT_1_2 = np.arcsin((-L*L+l*l+les_yF2**2+(les_xF2-a)**2)/(2*l*np.sqrt((les_xF2-a)**2+les_yF2**2)))-np.arctan2(les_xF2-a,les_yF2)
#LT_1_3 = np.arcsin((-L*L+l*l+les_yF3**2+(les_xF3-a)**2)/(2*l*np.sqrt((les_xF3-a)**2+les_yF3**2)))-np.arctan2(les_xF3-a,les_yF3)
plt.clf()
#plt.plot(les_alpha1[1:],"m")
plt.plot(les_alpha2[1:],"m")
plt.plot(-np.rad2deg(GP_alpha2)+180,"b,")
#plt.plot(np.rad2deg(LT_1),"b.")
#plt.plot(np.rad2deg(CM_alpha1),"b,")
#plt.plot(np.rad2deg(LT_1_3),"r.")
#plt.plot(np.rad2deg(LT_1_1),"g.")

#plt.plot(les_alpha2[1:])
# plt.plot(les_xF,les_yF)
# plt.plot(les_xF1,les_yF1,".")
# plt.plot(les_xF2,les_yF2,".")
# plt.plot(les_xF3,les_yF3,".")
plt.show()
    
        

