% Paramètres Moteur Boule
Rb = 1.53       ; % Ohm
Lb = 0.186e-3   ; % mH
Jb = 14.7/1000/10000 ; % kg.m²
fb = 3e-6; %  
Kb = 20.8/1000  ; % Nm/A 
rb = 1/92.7     ; % Réducteur
Jb = Jb + (31599185/1000/1000000)*rb*rb ; % On ajoute l'inertie déterminée avec Matlab

Cb = 2048       ; % Codeur Boule tops/tour
Jcb = 0.7/1000/10000 ; % kg.m² inertie codeur boule

% Corecteur Boucle courant
KiP = 570;  % Correcteur proportionnel de la boucle de courant
KiI = 205;  % Correcteur intégral de la boucle de courant


Ro = 19.2       ;
Lo = 0.581e-3   ;
Jo = 1.03/1000/10000 ; % kg.m²
fo = 0;
Ko = 18/1000    ; % Nm/A
ro = 1/26.05  ; % Réducteur axe optique

Jro = 0.108/1000/10000 ;

Co = 1024  ; % Codeur Axe optique tops/tour
Jco = 0.05/1000/10000 ;


KPEPOS_pos = 24.25;
KIEPOS_pos = 0;
KDEPOS_pos = 182;