function dydt = systemODEs(t, g, I_j, C_LC, T_RJ, C_HJ, C_LF, C_DJ, C_MJ, C_SJ, C_SC, B_SP, C_IF)
    x = g(1);
    y = g(2);
    z = g(3);
    
    dxdt = x*(1-x)*(y*(-I_j-C_LC-T_RJ-C_HJ)-z*C_LF-C_DJ-C_MJ+C_SJ);
    dydt = y*(1-y)*(x*(C_HJ-C_SC+B_SP+C_LC)-C_HJ);
    dzdt = z*(1-z)*(x*C_LF+C_IF);
    
    dydt = [dxdt; dydt; dzdt];
end
