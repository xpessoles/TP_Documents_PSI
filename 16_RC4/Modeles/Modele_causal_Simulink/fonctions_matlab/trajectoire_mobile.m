function [les_t,les_xm,les_ym] = trajectoire_mobile(xi,yi,xf,yf,amax,vmax,dt)
    % Détermination de la trajectoire du mobile dans R0
    %    (xi,yi) : position initiale

    % Distance à parcouir
    dx = xf-xi;
    dy = yf-yi;
    D = sqrt((dx)^2+(dy)^2);
    phi = atan2(dy,dx);

    % On calcule les lois de trapèze pour le mobile.
    [les_t,les_x,les_v,les_a] = calcule_profil(amax,vmax,D,dt);
    
    % On se remet dans la base R0 et en mm
    %les_xm = [xi + 1000*x*m.cos(phi) for x in les_x]
    %les_ym = [yi + 1000*x*m.sin(phi) for x in les_x]

    les_xm = [];
    les_ym = [];

    for i = 1:length(les_t) 
        x = les_x(i);
        les_xm(end+1) = xi + 1000*x*cos(phi);
        les_ym(end+1) = yi + 1000*x*sin(phi);
    end
end  