%% Moteur CPM 130
% Moteur
Unom = 24 ;         % V     %OK CPM
Rm   = 2.14;        % Ohm   %OK CPM
Lm   = 0.278e-3;    % H     %OK CPM
Jm   = 14.9/1000/10000; % kg.m²    %OK CPM
Jr   = 1.319/1000/10000; % kg.m²    %OK CPM

%Jm = 2e-6; %%% TO VERIF
Jm = Jm+Jr; %%% TO VERIF


Kcm  = 25.6e-3;     % Nm/A    %OK CPM
Kem  = 1/(373 *2*pi/60); % V/(rad/s)    %OK CPM
fv = 0;


Cfs = 0.0256*0; %% Nm 180/1000*Kcm
%fv = 2.78e-6; %%% TO VERIF

% Réducteur
%r = 1/16; %OK CPM
r = 361/5625; % Rapport de réduction absolu


% Vis à billles
pas = 5 /2/pi; % pas en mm/rad

% Capteur
Kcapt = 512*4/2/pi;    % pt/rad   rad >>> QC
Kadapt = Kcapt/r/pas;  % mm >> qc

%Correcteur position
KPos_P = 130;
KPos_I = 500;
KPos_D = 180;

KPSI = KPos_P*10/1000; 
KISI = KPos_I*78/1000;
KDSI = KPos_D*80/1000000;

%Correcteur Courant
KCou_P = 1000;
KCou_I = 1000;

ISAT = 1.2;     % Courant de saturation (4A ou 2A).
USAT = 21.1;     %    

%addpath("fonctions_matlab\")