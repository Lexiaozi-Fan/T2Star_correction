
%% setting parameters
load('Testdata.mat')
T10 = T1(1)*1000; %native T1 of blood at 1.5T
R10 = 1000/T10; %native R1
T20 =250; %native T2 of blood at 1.5T
R20 = 1000/T20;

gamma1 = 5.3; %relaxivity of whole blood of Gadavist
gamma2 = 5.4;

TD= 20; % Saturation recovery time of the pulse sequence
TE = 1.51; % echo spacing time of the pulse sequence
delta_B0= 32; %B0 variation 
CRange_wnc = AIFGdconc; %AIFGdconc is the original Gd concentration in blood pool

AIFGdconc_corrected = T2star_correction(R10,R20,gamma1,gamma2,TD,TE,delta_B0,CRange_wnc,T1);

% plot the curve
figure
plot(AIFGdconc,'b','Linewidth',3);
hold on
plot(AIFGdconc_corrected,'r','Linewidth',3);
legend('Uncorrected','Corrected')
xlabel('Time in seconds(s)')
ylabel('[Gd](mM)')

