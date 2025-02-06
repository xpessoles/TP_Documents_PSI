

L_HD = 989.3068;
L_HG = 781.2821;
L_BD = 646.1061;
var = [L_HD,L_HG,L_BD]

fun = @(x)@modele_direct(x,var);
x0 = [0,0,0,0,0,0,0];
x = fsolve(fun,x0)