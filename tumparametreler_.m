% clear; clc;
% T = readtable('Zeynep60framerate.xls');
clear; clc;
% T = readtable('huseyinnormal4v.xls');
[s1,s2]=size(huseyinnormal4v);
for i=2:s1*s2
     if(isnan(huseyinnormal4v(i))==1) 
         huseyinnormal4v(i)=huseyinnormal4v(i-1);
     end
end
xKoordinatlar=1:3:51;
yKoordinatlar=2:3:51;
zKoordinatlar=3:3:51;
% YP=Zeynep60framerate;
YP=huseyinnormal4v;
%% Sað AYAK
RtoeXs=YP(:,xKoordinatlar(6));
RtoeYs=YP(:,yKoordinatlar(6));
RheeXs=YP(:,xKoordinatlar(4));
RheeYs=YP(:,yKoordinatlar(4));
SacrXs=YP(:,xKoordinatlar(9));

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
str = 'Topuk Vuruþu';
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
str = 'Parmak kalkýþý';
text(swingstartr,ToeOffRight(swingstartr),str)

ToeOffnoktalari=swingstartr;

%% SOL AYAK

LtoeXs=YP(:,xKoordinatlar(8));
LtoeYs=YP(:,yKoordinatlar(8));
LheeXs=YP(:,xKoordinatlar(12));
LheeYs=YP(:,yKoordinatlar(12));
SacrXs=YP(:,xKoordinatlar(9));

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
StancefaziSol=HellStrikeNoktalariSol(2:end-1)-ToeOffnoktalariSol(2:end);
% Burada ayaðýn yere bastýðý aralýk. o yüzden önce hell strike gelirken
% sonra toe of gelmeli
SwingfaziSol=ToeOffnoktalariSol-HellStrikeNoktalariSol(2:end);
% burada ise ayak havada kalacak. hava kalma iþlemi toe dan baþladýðý için
% önce toe , sonra hell gelecek burda da. burada yapýlan iþler hell ve toe
% tespit edilen koordinatlara baðlý frame deðerleri üzerinden yappýldýðý
% için zaman tespiti yapýyoruz , FRAME cinsinden. Frame'ide 60'a bölersek
% sn cinsinden süreyi de hesaplayabiliriz.
StancefaziSag=HellStrikeNoktalari(2:end-1)-ToeOffnoktalari;
%önce hell
SwingfaziSag=ToeOffnoktalari-HellStrikeNoktalari(3:end);
%önce toe

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

stanceMeanl=stancestartl(1:end-1)-swingstartl;
swingMeanl=swingstartl-stancestartl(2:end);

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
%% Stance fazlarý daðýlýmý

% loading response = Sað ayak heel strikedan sol ayak toe off a geçen süre

loadingResponse=HellStrikeNoktalari(2:end)-ToeOffnoktalariSol

% mid stance = Sol  toe off ile sað heel rise aarasýnda geçen süre
% Right ankle = 14. R_ank=YP(:,xKoordinatlar(14)); 
% heel rise = Rankdan elde edilen tepe noktalarýnýn 4 mm üstü
% heel off was measured from sagital trajectroy of the ankle marker. a 4 mm
% elevation of the marker above its plato during heel contact was
% considered as heel off.

R_ankZs=YP(:,zKoordinatlar(14));
R_ankZs_smoothed = sgolayfilt(R_ankZs,3,11);

R_heelZs=YP(:,zKoordinatlar(8));

threshol_ank = max(R_ankZs);
thresholdrank=0.5*threshol_ank;

y=1;
for i=1195:1197
    gecici=R_ankZs(i-y+1:i+y);
    if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>thresholdrank)
        heeloff_r(i) = R_ankZs(i);
    end
end

heeloff_rson=find(heeloff_r==max(heeloff_r));

x=17;
for k=x:(length(R_ankZs)-x)
    gecici=R_ankZs(k-x+1:k+x);
    if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>thresholdrank)
        heel_off_son(k) = R_ankZs(k);
    end
end

figure
heel_off_last=find(heel_off_son>0);
heel_off_last_1=[ heel_off_last heeloff_rson];
plot(R_ankZs)
hold on
plot(heel_off_last_1,R_ankZs(heel_off_last_1),'r+','MarkerFaceColor','r')
str = 'Heel Off';
text(heel_off_last_1,R_ankZs(heel_off_last_1),str)

Heel_rise_degerleri=R_ankZs(heel_off_last_1)+4;
Yeni_heel_off=[29 107 183 259 335 412 488 563 640 717 793 870 947 1024 1102 1180];
midStance=ToeOffnoktalariSol-Yeni_heel_off(2:end) % smooth edilmiþ heel contact platolardan heel off çýkarma (RankZ'den)

midStance=ToeOffnoktalariSol-heel_off_last_1(2:end)
% midStance=ToeOffnoktalariSol(1:end-1)-heel_off_last(2:end)


% Terminal stance Sag = Sað Heel rise ile Sol hell strike arasýndaki fark

TerminalStance = heel_off_last_1(1:end-1)-HellStrikeNoktalariSol(3:end)
TerminalStance = Yeni_heel_off(1:end-1)-HellStrikeNoktalariSol(3:end)
% preswing = sol heel strike sað tooooooe offf

preswing = HellStrikeNoktalariSol(2:end-2)-ToeOffnoktalari(1:end-1);

preswing=[preswing ceil(mean(preswing))]
%total of these

toplamsiklus=abs(TerminalStance)+abs(preswing)+abs(loadingResponse)+abs(midStance)

terminalorani= abs(TerminalStance)./toplamsiklus
preswingrate=abs(preswing)./toplamsiklus
loadingresponserate=abs(loadingResponse)./toplamsiklus
midstancerate=abs(midStance)./toplamsiklus

mean(terminalorani)*StanceRatio
mean(preswingrate)*StanceRatio
mean(loadingresponserate)*StanceRatio
mean(midstancerate)*StanceRatio


%% Spatio Temporal parameters

steplength=HellStrikeNoktalari-HellStrikeNoktalariSol(2:end)
mean(steplength)

steplengthttt=cumsum(HellStrikeNoktalari-HellStrikeNoktalariSol(2:end))
% stride length için opsion

stepTime=mean(steplength/60)
StrideLength=0;
for i=1:length(HellStrikeNoktalari)-1
    StrideLength(i)=HellStrikeNoktalari(i+1)-HellStrikeNoktalari(i);
end
mean(StrideLength)

StrideTime=mean(StrideLength/60)

RtoeYs=yurume(:,yKoordinatlar(14));
RheeYs=YP(:,yKoordinatlar(8));
LtoeYs=yurume(:,yKoordinatlar(12));
LheeYs=YP(:,yKoordinatlar(4));

StepWidth=RheeYs(HellStrikeNoktalari)-LheeYs(HellStrikeNoktalariSol(2:end))
mean(StepWidth)

AdimSayisi=length(HellStrikeNoktalari)-1
% 
dakikaAdim=3600*AdimSayisi/1200

%% Progresyion acýsý

LeftAciXs=LtoeXs-LheeXs;
LeftAciYs=LtoeYs-LheeYs;
LeftFootProgressionAngle=atand(LeftAciYs./LeftAciXs);
AverageFPA=mean(LeftFootProgressionAngle);

%% Ankle açýsý
% diz ile ankleý birleþtiren doðrunun eðimini bul
%ankle ile toe u birleþtiren doðrunun eðimini bul
% arasýndaki açýyý da hesapla:
% açý formulu = atand((m1-m2)/(1+m1m2))
% Sað ayak için
RkneeXs=YP(:,xKoordinatlar(15));
RkneeZs=YP(:,zKoordinatlar(15));
RankXs=YP(:,xKoordinatlar(11));
RankZs=YP(:,zKoordinatlar(11));
RtoeZs=YP(:,zKoordinatlar(6));

%m1=kneez-anklez / kneex-anklex
m1=(RkneeZs-RankZs)./(RkneeXs-RankXs)
%m2=anklez-toez/anklex-toex
m2=(RankZs-RtoeZs)./(RankXs-RtoeXs)
figure
ankleAngle = atand((m1-m2)/(1+m1.*m2));
plot(ankleAngle)
mean(ankleAngle)