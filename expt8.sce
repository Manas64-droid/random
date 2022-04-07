clear;
BTt1 = 4; //Base station transmit power in Watt
MTt = 24; //MS transmit power in dBm

MTNf = 8;//MS noise figure in dB
BTNf = 5;//BS noise figure in dB
BTGa = 18;//BS antenna gain in dBi
MTGa = 0;//MS antenna gain in dBi
SNR = 12;//signal to noise ration in dB
BTtLoss = 5;//BS transmit antenna, cable connector loss
BRxLoss = 2;//BS receive antenna,cable, connectro loss
MSo = 3;//MS orientation loss in dB
SF = 10.2; //shadow fading in dB
Nth = -174;//thermal noise density in dBm/Hz
BSGd = 5;//BS antenna diversity gain in dB
B = 200*10^3;//RF carrier bandwidth
BTt = 10*log10(BTt1/10^-3);//BS transmit power in dBm
//Mobile station noise floor
N = Nth+10*log10(B)+MTNf
disp(N,'Mobile station noise floor')
Smin = N+SNR;//Minimum signal required at MS
//Mean signal required at MS
Smean = Smin+SF+MSo
disp(Smean,'Mean signal required at MS')
LpD = BTt-BTtLoss+BTGa-Smean;
disp(LpD,'Downlink path loss in dB')
//Base station noise floor
Nb = Nth+10*log10(B)+BTNf
disp(Nb,'Base station noise floor')
Sminb = Nb + SNR - BSGd
Smeanb = Sminb + SF + MSo
disp(Smeanb,'Mean signal required at the base station')
LpU = MTt - Smeanb + BTGa - BRxLoss
disp(LpU,'Uplink path loss in dB')
//choose least acceptable path loss
if LpU<LpD then
LP = LpU
disp('select uplink path loss')
else
LP = LpD
disp('select downlink path loss')
end
//using Hata model to find the radius
//Lp = 133.2+33.8logR
logR = (LP - 133.2)/33.8;
R = 10^(logR)
disp(R,'cell radius in km')
