function [L,D,phi] = get_L_phi(Xm,Ym,theta,poulie)
    
    % Calcul de la distance AB et de l'orientation du câble phi.
    % Entrées : 
    %     * Xm,Ym : coordonnées de M (en mm)
    %     * Theta : orientation du mobile (en rad)
    %     * Poulie souhaitée : "HD", "HG", "BD", "BG"
    % Sorties :
    %     * D : longueur AB
    %     * phi
    %     * L : longueur d'enroulement.
    
    H = 50;
    L = 100;
    Rp = 15;
        
    if poulie == "HD"
        Xhd = 675;
        Yhd = 775;
        alpha = 0;
    elseif poulie == "BD"
        Xhd = 675;
        Yhd = -175;
        H = -H;
        alpha = 0;
    elseif poulie == "HG"
        Xhd = -175;
        Yhd = 775;
        L = -L;
        alpha = pi;
    elseif poulie == "BG"
        H = -H;
        L = -L;
        Xhd = -175;
        Yhd = -175;
        alpha = pi;
    end
    [D,phi] = Dphi(H,L,theta,Xm,Xhd,Ym,Yhd);
    L = sqrt((D*D - Rp*Rp))+Rp*abs(alpha-abs(phi));
end