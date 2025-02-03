function [D,phi] = Dphi(H,L,theta,Xm,Xhd,Ym,Yhd) 
        % Détermination de la distance entre le point d'ancrage et le centre de la poulie.
        % 
        % Données du mobile : 
        %     H : hauteur du mobile (entre deux points d'ancrages de câble)
        %     L : largeur du mobile (entre deux points d'ancrages de câble)
        % Coordonnées du mobile
        %     Xm,Ym : coordonnées acutelles du centre du mobile
        % Coordonnées de la poulie (en haut à droite)
        %     Xhd,Yhd

        D =   (-(L/2)*cos(theta)+(H/2)*sin(theta)-Xm+Xhd)^2;
        D = D+(-(L/2)*sin(theta)-(H/2)*cos(theta)-Ym+Yhd)^2;
        D = sqrt(D);
        num = (-(L/2)*sin(theta)-(H/2)*cos(theta)-Ym+Yhd);
        den = (-(L/2)*cos(theta)+(H/2)*sin(theta)-Xm+Xhd);
        phi = atan2(num,den);
end