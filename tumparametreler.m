% clear; clc;
T = readtable('Zeynep60framerate.xls');
xKoordinatlar=1:3:51;
yKoordinatlar=2:3:51;
zKoordinatlar=3:3:51;
YP=Zeynep60framerate;
%% Sað AYAK
RtoeXs=YP(:,xKoordinatlar(9));
RheeXs=YP(:,xKoordinatlar(8));
SacrXs=YP(:,xKoordinatlar(15));

HeelStrikeRight=RheeXs-SacrXs;
ToeOffRight=RtoeXs-SacrXs;

plot(HeelStrikeRight)
hold on
plot(ToeOffRight,'r')

threshol = max(HeelStrikeRight);
thresholdr=0.5*threshol;

y=1;
for i=1:60
    gecici=HeelStrikeRight(i-y+1:i+y);
    if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>thresholdr)
        stancefirstr(i) = HeelStrikeRight(i);
    end
end

stancefirstr1=find(stancefirstr==max(stancefirstr));

x=17;
for k=x:(length(HeelStrikeRight)-x)
    gecici=HeelStrikeRight(k-x+1:k+x);
    if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>thresholdr)
        stancesr(k) = HeelStrikeRight(k);
    end
end

figure
stancestartr=find(stancesr>0);
stancestartr1=[stancefirstr1 stancestartr];
plot(HeelStrikeRight)
hold on
plot(stancestartr1,HeelStrikeRight(stancestartr1),'r+','MarkerFaceColor','r')
str = 'Heel Strike';
text(stancestartr1,HeelStrikeRight(stancestartr1),str)

HellStrikeNoktalari=stancestartr1;

threshol1 = max(ToeOffRight);
thresholdr1=0.5*threshol1;

y=1;
for i=1:180
    gecici=ToeOffRight(i-y+1:i+y);
    if(gecici(ceil(length(gecici)/2))==min(gecici) & gecici(ceil(length(gecici)/2))<thresholdr1)
        swingfirstr(i) = ToeOffRight(i);
    end
end

swingfirstr1=find(swingfirstr==max(swingfirstr));

x=37;
for k=x:(length(ToeOffRight)-x)
    gecici=ToeOffRight(k-x+1:k+x);
    if(gecici(ceil(length(gecici)/2))==min(gecici) & gecici(ceil(length(gecici)/2))<thresholdr1)
        swingsr(k) = ToeOffRight(k);
    end
end

figure
swingstartr=find(swingsr<0);
swingfirstr1=[stancefirstr1 swingstartr];

hold on
plot(ToeOffRight,'r')
hold on
plot(swingstartr,ToeOffRight(swingstartr),'k+','MarkerFaceColor','k')
str = 'Toe Off';
text(swingstartr,ToeOffRight(swingstartr),str)

ToeOffnoktalari=swingstartr;

%% SOL AYAK

LtoeXs=YP(:,xKoordinatlar(7));
LheeXs=YP(:,xKoordinatlar(4));
SacrXs=YP(:,xKoordinatlar(15));

HeelStrikeLeft=LheeXs-SacrXs;
ToeOffLeft=LtoeXs-SacrXs;
figure;
plot(HeelStrikeLeft)
hold on
plot(ToeOffLeft,'r')

threshol = max(HeelStrikeLeft);
thresholdl=0.5*threshol;

y=1;
for i=1:60
    gecici=HeelStrikeLeft(i-y+1:i+y);
    if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>thresholdl)
        stancefirstl(i) = HeelStrikeLeft(i);
    end
end

stancefirstl1=find(stancefirstl==max(stancefirstl));

x=17;
for k=x:(length(HeelStrikeLeft)-x)
    gecici=HeelStrikeLeft(k-x+1:k+x);
    if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>thresholdl)
        stancesl(k) = HeelStrikeLeft(k);
    end
end

figure
stancestartl=find(stancesl>0);
stancestartl1=[stancefirstl1 stancestartl];
plot(HeelStrikeLeft)
hold on
plot(stancestartl1,HeelStrikeLeft(stancestartl1),'r+','MarkerFaceColor','r')
str = 'Heel Strike';
text(stancestartl1,HeelStrikeLeft(stancestartl1),str)

HellStrikeNoktalariSol=stancestartl1;

threshol1 = max(ToeOffLeft);
thresholdl1=0.5*threshol1;

y=1;
for i=1:180
    gecici=ToeOffLeft(i-y+1:i+y);
    if(gecici(ceil(length(gecici)/2))==min(gecici) & gecici(ceil(length(gecici)/2))<thresholdl1)
        swingfirstl(i) = ToeOffLeft(i);
    end
end

swingfirstl1=find(swingfirstl==max(swingfirstl));

x=37;
for k=x:(length(ToeOffLeft)-x)
    gecici=ToeOffLeft(k-x+1:k+x);
    if(gecici(ceil(length(gecici)/2))==min(gecici) & gecici(ceil(length(gecici)/2))<thresholdl1)
        swingsl(k) = ToeOffLeft(k);
    end
end

figure
swingstartl=find(swingsl<0);
swingfirstl1=[stancefirstl1 swingstartl];

hold on
plot(ToeOffLeft,'r')
hold on
plot(swingstartl,ToeOffLeft(swingstartl),'k+','MarkerFaceColor','k')
str = 'Toe Off';
text(swingstartl,ToeOffLeft(swingstartl),str)

ToeOffnoktalariSol=swingstartl;

%% StanceveSwing faz belirleme

%HeelStrikeNoktalariSol ve ToeOffnoktalariSol ve sað da mevcut
StancefaziSol=HellStrikeNoktalariSol(2:end-1)-ToeOffnoktalariSol;
SwingfaziSol=ToeOffnoktalariSol-HellStrikeNoktalariSol(3:end);
StancefaziSag=HellStrikeNoktalari(1:end-1)-ToeOffnoktalari;
SwingfaziSag=ToeOffnoktalari-HellStrikeNoktalari(2:end);

%% Double Support Single Support Belirleme

%DS:Stance-(100-Stance)
% DSsol=abs(StancefaziSol)-(100-abs(StancefaziSol));
% DSsag=StancefaziSag-(100-StancefaziSag);
% %Single support:
% SingleSupportSol=ToeOffnoktalariSol-HellStrikeNoktalariSol(3:end);
% SingleSupportSag=ToeOffnoktalari-HellStrikeNoktalari(2:end);

firstDs=HellStrikeNoktalari(2:end)-ToeOffnoktalariSol;
secondDs=HellStrikeNoktalariSol(2:end-1)-ToeOffnoktalari;
singleSup=ToeOffnoktalariSol-HellStrikeNoktalariSol(3:end);

% stanceMeanl=stancestartl(1:end-1)-swingstartl;
% swingMeanl=swingstartl-stancestartl(2:end);

StanceRatio=abs(stanceMeanl)/(abs(stanceMeanl+swingMeanl));

fDSRatio=abs(firstDs)/(abs(firstDs)+abs(secondDs)+abs(singleSup))
sDSRatio=abs(secondDs)/(abs(firstDs)+abs(secondDs)+abs(singleSup))
SSRatio=abs(singleSup)/(abs(firstDs)+abs(secondDs)+abs(singleSup))

firstDoublesixty=fDSRatio*StanceRatio
secondDoublesixty=sDSRatio*StanceRatio
singleSupsixty=SSRatio*StanceRatio

mean(StancefaziSol)
mean(SwingfaziSol)
mean(StancefaziSag)
mean(SwingfaziSag)
% DS1=fDSRatio*StanceRatio
% DS2=sDSRatio*StanceRatio
% SS_=SSRatio*StanceRatio

% SolTarafinYuzdelenmesi=StancefaziSol/(StancefaziSol+SwingfaziSol)

