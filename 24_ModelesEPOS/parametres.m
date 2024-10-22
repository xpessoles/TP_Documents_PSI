%% Paramètres du moteur
R = 1 ;                 % Résistance moteur Ohm
L = 1e-3;               % Inductance moteur Henry
K = 0.001;              % Constance de couple moteur Nm/A
J = 0.00001;            % Inertie moteur kg.m²


%% Parametres de l'EPOS


%Paramètres de la boucle de courant
KP_Courant = 0;         % Ohm
KI_Courant = 0;         % Ohm/s

%Paramètres de la boucle de vitesse;
KP_Vitesse = 0;
KI_Vitesse = 0;

%Paramètres de la boucle de position;
KP_Position = 0;
KI_Position = 0;
KD_Position = 0;

KP_SI = 10e-3 * KP_Position;
KI_SI = 78e-3 * KI_Position;
KD_SI = 80e-6 * KD_Position;

