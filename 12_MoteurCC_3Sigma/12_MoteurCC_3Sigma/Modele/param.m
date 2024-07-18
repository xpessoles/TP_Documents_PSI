%% Données constructeur
%% Platine moteur 3 SIGMA
R  = 3 ;        % Résistance [Ohm]
L  = 4e-3 ;     % Inductance [H] 
Jm = 3e-6 ;     % Inertie moteur [kg.m²]
K  = 0.009 ;    % [V/(rad/s)] et [Nm/A]

%fv = 0.0014;    % Frottement visqueux (doc) [Nms/rad]
%Cs = 0.027;      % Couple de frottement sec (doc) [Nms/rad]

fv = 0.7e-6;    % Frottement visqueux (3sigma moteur+géné exp) [Nms/rad]
Cs = 700e-6;      % Couple de frottement sec (3sigma moteur+géné exp) [Nms/rad]

% Codeur : 48 tops/tour
% Réducteur
r = 34;