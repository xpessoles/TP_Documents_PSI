%% Paramètres du MaxPID

% Paramètres de la loi de commande
theta_p = 2.5;          % [rad/s]   : vitesse angulaire du bras 
theta_pp = 9;           % [rad/s²]  : accélération angulaire du bras 

theta = 90;             % [deg]
theta = theta * pi/180 ;% [rad]
retard = 0;
t_acc = theta_p / theta_pp ;% (rad/s)*s*s/rad
t_vcc = theta/theta_p - t_acc;
t0 = retard;
t1 = t0+t_acc;
t2 = t1+t_vcc;
t3 = t2+t_acc;

% Masse mobile
nb_m = 0;
mm   = 0;           % [kg] : masse d'une masse 

% Paramètre du correcteur de courant
KP_i = 800 ;        % Proportionnel
KI_i = 200 ;        % Correcteur Intégral

% Paramètre du correcteur de position
KP_p = 5600 ;       % Proportionnel
KI_p = 4800 ;       % Correcteur Intégral
KD_p = 15000 ;      % Action dérivée

% Paramètres du moteur
Umax = 24   ;       % [V]       : Tension max
Imax = 4.3  ;        % [A]       : Courant max A VERIFIER
Kc   = 52.5e-3;     % [Nm/A]    : Constante de couple
Ke   = 1/(182*2*pi/60); % [rad/s/V] : Constante de vitesse
Jm   = 69.6e-3*1e-4;% [kg.m²]   : Inertie
Rm   = 2.07;        % [Ohm]     : Résistance moteur
Lm   = 0.62e-3;     % [H]       : Inductance moteur

% Paramètres de la vis
pv = 4e-3;          % [m] : pas de la vis
Lv = 0.3;           % [m] : longueur de la vis, à définir 
Jv = 10.8*Lv*1e-6;  % [kg.m²] : inertie de la vis

% Transmission
K_meca = 0.01;      % gain de la transmission (linéarisation)
f = 0;              % frottement fluide ramenés à l'arbre moteur 
K_codeur = 23;

% Couple de frottement sec
% 350mA : courant à partir duquel le MaxPID bouge (essai BO)
Cfs= 0.350*Kc;

