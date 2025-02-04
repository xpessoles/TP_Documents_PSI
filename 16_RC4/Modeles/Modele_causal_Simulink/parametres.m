%% Enrouleur Haut Droite
% Moteur
Unom = 24 ;         % V
Rm   = 7.36;        % Ohm
Lm   = 0.77e-3;     % H
Jm   = 13.1/1000/10000; % kg.m²
Kcm  = 25.5e-3;     % Nm/A
Kem  = 1/(374 *2*pi/60); % V/(rad/s)
fv = 0;

% Réducteur
r = 1/18;

% Rayon tambour
Rt = 25;         %mm
% 
% Capteur
Kcapt = 8192/2/pi;    % pt/rad
Kadapt = Kcapt/Rt;

%Correcteur position
KPos_P = 215;
KPos_I = 270;
KPos_D = 920;

KPSI = KPos_P*10/1000; 
KISI = KPos_I*78/1000;
KDSI = KPos_D*80/1000000;

%Correcteur Courant
KCou_P = 2000;
KCou_I = 900;

ISAT = 4;   % Courant de saturation (4A ou 2A).

%% Paremètres cinématiques
vmax = 0.5;   %m/s : vitesse du trapèze
amax = 5;   %m/s² : accélération du trapèze
