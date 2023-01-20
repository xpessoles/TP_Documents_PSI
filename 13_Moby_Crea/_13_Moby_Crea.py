import numpy as np 

A_v = 40/2    # mm : Amplitude du mouvement vertical
A_h = 80/2    # mm : Amplitude du mouvement horizontal
omega_h = 4/2   # rad/s : vitesse de la 'manivelle' mouvement horizontal
omega_v = 8/2   # rad/s : vitesse de la 'manivelle' mouvement vertical

#omega_h = 2*np.pi/4
#omega_v = 2*np.pi/2

phi_h = 0     # s : déphasage du mouvement horizontal
phi_v = 0     # s : déphasage du mouvement vertical

les_t = np.linspace(0,10,1000)
les_x =  A_h*np.sin(omega_h*les_t+phi_h)
les_y =  A_v*np.sin(omega_v*les_t+phi_v)