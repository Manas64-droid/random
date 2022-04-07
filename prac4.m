clc;
clear all;
close all;
%Study of Satellite Uplink Design

f=input('Enter the frequency=');
R=input('Enter the radius of antenna=');
n=input('Enter the efficiency=');
r=input('Enter distance between satellite and earth station=');
NF=input('Enter noise figure=');
t=input('Enter the ambient temprature=');
Bw=input('Enter bandwidth+');
Pt=input('Enter power output of earth station=');
Gt=input('Enter gain of earth station=');
AA=input('Enter the Atmospheric absorbtion loss in dB=');
AFL=input('Entyer the antenna feeder lodd in dB=');
AML=input ('Emter antenna misalignment loss in dB=');
c=3*(10^8);
k=1.38*10^-23;
Gr=(4*pi*n*pi*(R^2))/(c/f)^2;
GrdB=10*log10(Gr);

F=10^(NF*0.1);
To=T+273;
Ts=To*(F-1);
TsdB=10*log10(Ts);

G_T=GrdB-TsdB;
x=(4*pi*r/(c/f))^2;
FSL=10*log10(x);

C_N=Pt+Gt+G_T-FSL-10*log10(k)-10*log10(BW)

C_N1=Pt+Gt+g_t-(FSL+AA+AFL+AML)-10*LOIG10(K)-10*(K)-10*log10(BW)
