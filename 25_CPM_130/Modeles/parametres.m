%% Moteur CPM 130
% Moteur
Unom = 24 ;         % V     %OK CPM
Rm   = 2.15;        % Ohm   %OK CPM
Lm   = 0.278e-3;    % H     %OK CPM
Jm   = 14.9/1000/10000; % kg.m²    %OK CPM

Jm = 2e-6; %%% TO VERIF


Kcm  = 25.6e-3;     % Nm/A    %OK CPM
Kem  = 1/(373 *2*pi/60); % V/(rad/s)    %OK CPM
fv = 0;

fv = 2.78e-6; %%% TO VERIF

% Réducteur
r = 1/16; %OK CPM

% Vis à billles
pas = 5 /2/pi; % pas en mm/rad

% Capteur
Kcapt = 512*4/2/pi;    % pt/rad
Kadapt = Kcapt/r/pas;

%Correcteur position
KPos_P = 130;
KPos_I = 500;
KPos_D = 180;

KPSI = KPos_P*10/1000; 
KISI = KPos_I*78/1000;
KDSI = KPos_D*80/1000000;

%Correcteur Courant
KCou_P = 670;
KCou_I = 270;

ISAT = 2.2;     % Courant de saturation (4A ou 2A).
USAT = 24 ;     %    

%addpath("fonctions_matlab\")