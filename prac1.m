clc;
le=input('Enter the value of earth station latitude=');
dle=input('Enter the direction of earth station latitude=','s');
switch dle
  case 'N'
    le=le;
  case 'S'
    le=le;
endswitch
te=input('Enter the value of earth station longitude=');
dte=input('Enter the direction of earth statuion longitude=','s');
switch dte
  case 'E'
    te=te;
  case 'W'
    te=te;
endswitch
ts=input('Enter the value of satellite longitude=');
dts=input('Enter the direction of satellite longitude=','s');
switch dts 
  case 'E'
    ts=ts;
  case 'W'
    ts=ts;
endswitch
t=ts-te;
Ad=atan(tan((abs(t))*(pi/180))/sin(le*(pi/180)))*(180/pi);
Ad=abs(Ad)
tes=te-ts
if((le>0)&&(te>0))
A=180+Ad
elseif((le>0)&&(te<0))
A=180-Ad
elseif((le<0)&&(te>0))
A=360-Ad
elseif((le<0)&&(te<0))
A=Ad
end
r=42164
Rp=6378
E1=acos(cos(le*(pi/180))*cos(abs(t)*(pi/180)))*(180/pi)
E2=atan((r-(Rp*cos(le*(pi/180))*cos(abs(t)*(pi/180))))/(Rp*sin(E1*(pi/180))))*(180/pi)
E=E2=E1
