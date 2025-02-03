function [les_t,les_x,les_v,les_a] = calcule_profil(amax,vmax,distance,dt)
    % Détemination des profils de position, vitesse et accélération pour un déplacement donné
    % Indépendant du RC4. 
     % Entrées :
     
    %  * amax : accélération en m²/s
    %  * vmax : vitesse en m/s
    %  * distance : distance à parcourir en mm

    [t1,t2,t3] = calcule_temps(amax,vmax,distance);
    
    % On ajoute t1 au temps de simulation
    les_t = [];
    t = 0;
    while t < t3+t1 
        les_t(end+1) = t ;
        t = t+dt;
    end

    les_a = [];
    les_v = [];
    les_x = [];
    
    % Génération des profils
    for i = 1:length(les_t) 
        t = les_t(i);
        if t<t1 
            les_a(end+1) = amax;
            les_v(end+1) = amax*t;
            les_x(end+1) = 0.5*amax*t*t;
        elseif t<t2  
            les_a(end+1) = 0;
            les_v(end+1) = vmax;
            les_x(end+1) = les_x(end)+vmax*dt;
            
        elseif t<t3  
            les_a(end+1) = -amax;
            les_v(end+1) = les_v(end)-amax*dt;
            les_x(end+1) = les_x(end)+les_v(end)*dt;
        else 
            les_a(end+1) = 0;
            les_v(end+1) = 0;
            les_x(end+1) = les_x(end);
        end
    end
end