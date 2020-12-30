%% function
function AIFGdconc_corrected = T2star_correction(R10,R20,gamma1,gamma2,TD,TE,delta_B0,CRange_wnc)
for i =1:length(CRange_wnc)
    C_wnc = CRange_wnc(i);
    % calculating T2* based on estimated [Gd] and assumed delta_B0
    R2 = R20 + gamma2*C_wnc;
    R2star = R2+ delta_B0;
    T2star = 1000/R2star;
    % calculating T1
    R1_wnc(i) = C_wnc*gamma1 +R10;
    T1_wnc(i) = 1000./R1_wnc(i);
    % calculating corrected [Gd]
    Mz_wc(i) = (1-exp(-TD./T1_wnc(i)))./(exp(-TE/T2star));
    T1_wc(i) = (abs(-TD./log(1-Mz_wc(i))));
    R1_wc(i) = 1000./T1_wc(i);
    C_twc(i) = (R1_wc(i) - R10)./gamma1;   
end  

AIFGdconc_corrected = C_twc';
end