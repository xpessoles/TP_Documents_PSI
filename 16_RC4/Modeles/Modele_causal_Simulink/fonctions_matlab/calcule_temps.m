function [t1,t2,t3] = calcule_temps(amax, vmax, distance)
    % Pour une loi en trapèze de vitesse, on calcule :
    %    - t1, temps à partir duquel on est à vitesse constante ;
    %    - t2, temps à partir duquel on décélère ;
    %    - t3, temps à partir duquel on est à vitesse nulle.
    % Entrées :
    %  * amax : accélération en m²/s
    %  * vmax : vitesse en m/s
    %  * distance : distance à parcourir en mm
    
    distance = distance/1000 ;
    
    % Détermination du temps pour atteindre la vitesse max
    % vmax = t1*amax
    t1 = vmax/amax ;
    
    % On détermine la distance minimale pour réaliser un trapèze de vitesse (non demandé)
    dmin = t1*vmax;
    
    if distance > dmin  % On a un trapèze de vitesse
        t1 = vmax/amax;
        % Distance totale (aire sous le trapèze) L = ta*v + T*v
        % T : Temps à vitesse constante
        T = (distance - t1*vmax)/vmax;
        t2 = T+t1;
        t3 = t2+t1;
    else  % On a un triangle
        T = 0;
        % calcul de la vitesse atteinte va : L = ta*va et va = ta*a
        % On a L = ta*ta*a
        ta = sqrt(distance/amax);
        v = amax*ta;
        t1 = ta;
        t2 = t1;
        t3 = t1+t1;
    end
end