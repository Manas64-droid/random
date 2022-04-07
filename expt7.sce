clear;
Susage = 150; // in minutes
DpM = 24; //days per month
Bhpd = 6;//busy hours per day
B = 4.8*10^6; //allocated spectrum in Hz
Cells = 4;
clusters = 12;
Rfwidth = 200*10^3 ;//RF channel width Full rate

sub = 50000; //present no. of subscribers
SubGrowth = 0.05;//5% subscriber growth
A = 500;//area of the zone in sq km
p = 4;// initial installation based on 4 years
Cbts = 30; //capacity of BTS in Erlang
//Erlangs per subscriber
Esub = Susage/(DpM*Bhpd*60);
disp(Esub,'Erlangs per subscriber')
NoRfcarriers = B/Rfwidth;
disp(NoRfcarriers,'no. of RF carriers')
RFperSector = NoRfcarriers/clusters;
disp(RFperSector,'RF carriers per sector')
TrafficCh = RFperSector*8 - 2;//2 control channes per sector
TrChperCell = 3*TrafficCh; //no. of traffic channels per cell(per BTS)
disp(TrChperCell,"traffic channels per cell")
//Traffic capacity of GSM at 2%GoS is 8.2Erlang
TrPerBTS = 8.2*3;
disp(TrPerBTS,'traffic capacity per BTS in Erlang')
MaxSub = ceil(TrPerBTS/Esub); //Maximum no. of subscribers per BTS
disp(MaxSub,'Maximum no. of subscribers per BTS')
TSubs = sub*(1 + SubGrowth)^p;//total no. of subscribers
NoBTS = ceil(TSubs/MaxSub);
disp(NoBTS,'no. of BTS required in the zone')
AperBTS = A/NoBTS;
disp(AperBTS,'Area per BTS in sqkm')
RCell = sqrt(2*AperBTS/3/sqrt(3))
disp(RCell,'Cell Radius in km')
