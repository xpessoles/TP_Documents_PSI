function  F = modele_direct(x,var)
L_HD = var(1);
L_HG = var(2);
L_BD = var(3);


X_M = x(1);
Y_M = x(2);
theta = x(3);
phi_hd = x(4);
phi_hg = x(5);
phi_bd = x(6);

R_P = 25;
X_HD = 675;
Y_HD = 775; 
X_HG = -175;
Y_HG = 775;
X_BD = 675;
Y_BD = -175;
L_M = 100;
H_M = 50;

F(1) = X_HD - R_P * sin(phi_hd)-L_HD*cos(phi_hd) - L_M/2 * cos(theta)+H_M/2*sin(theta) - X_M;
F(2) = Y_HD + R_P * cos(phi_hd)-L_HD*sin(phi_hd) - L_M/2 * sin(theta)-H_M/2*cos(theta) - Y_M;

F(3) = X_HG + R_P * sin(phi_hg)-L_HG*cos(phi_hg) + L_M/2 * cos(theta)+H_M/2*sin(theta) - X_M;
F(4) = Y_HG - R_P * cos(phi_hg)-L_HG*sin(phi_hg) + L_M/2 * sin(theta)-H_M/2*cos(theta) - Y_M;

F(5) = X_BD - R_P * sin(phi_bd)-L_BD*cos(phi_bd) - L_M/2 * cos(theta)+H_M/2*sin(theta) - X_M;
F(6) = Y_BD - R_P * cos(phi_bd)-L_BD*sin(phi_bd) - L_M/2 * sin(theta)+H_M/2*cos(theta) - Y_M;

end

