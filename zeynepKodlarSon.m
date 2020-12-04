veri=huseyinangle;
% veri = zeynepden;
[s1,s2]=size(veri);
for i=2:s1*s2
     if(isnan(veri(i))==1) 
         veri(i)=veri(i-1);
     end
end
YP=veri;
N=size(veri);
xs=1:3:N(2);
ys=2:3:N(2);
zs=3:3:N(2);
toeXs=YP(:,xs(2));
toeYs=YP(:,ys(2));
toeZs=YP(:,zs(2));
kalcaXs=YP(:,xs(4));
kalcaYs=YP(:,ys(4));
kalcaZs=YP(:,zs(4));
kneeXs=YP(:,xs(3));
kneeYs=YP(:,ys(3));
kneeZs=YP(:,zs(3));
ankleXs=YP(:,xs(5));
ankleYs=YP(:,ys(5));
ankleZs=YP(:,zs(5));

%kalce ile knee arasýndaki doðru ile, knee ile ankle arasýndaki doðrunun
%arasýndaki açýyý bulalým

m1=(kalcaZs-kneeZs)./(kalcaXs-kneeXs); %kalça ile kneenin oluþturduðu doprunun eðimi
m2=(kneeZs-ankleZs)./(kneeXs-ankleXs); %knee ile ankleýn oluþturduðu doðrunun eðimi
kneeAngle = (m1-m2)./(1+m1.*m2);
KneeAcilar=atand(kneeAngle);
figure
plot(KneeAcilar)

%knee ile ankle arasýndaki doðru ile, ankle ile toe arasýndaki doðrunun
%arasýndaki açýyý bulalým

m11=(kneeZs-ankleZs)./(kneeXs-ankleXs); %knee ile ankleýn oluþturduðu doðrunun eðimi
m22=(toeZs-ankleZs)./(toeXs-ankleXs); %ankle ile toenun oluþturduðu doðrunun eðimi
ankleAngle = (m11-m22)./(1+m11.*m22);
ankleAcilar=atand(ankleAngle);
figure
plot((ankleAcilar))
ankleAcilar_=0;
for i=1:length(ankleAcilar)
    if(ankleAcilar(i)>0)
        ankleAcilar_(i)=ankleAcilar(i)-90;
    elseif(ankleAcilar(i)<0)
        ankleAcilar_(i)=ankleAcilar(i)+90;
    end
end
figure
plot(ankleAcilar_)
%b planý knee ankle için

% b=(kneeXs.*ankleXs+kneeYs.*ankleYs+kneeZs.*ankleZs)./((sqrt(kneeXs.^2+kneeYs.^2+kneeZs.^2).*sqrt(ankleXs.^2+ankleYs.^2+ankleZs.^2)))

c=(kneeXs.*ankleXs+kneeYs.*ankleYs+kneeZs.*ankleZs)./((sqrt(kneeXs.^2+kneeYs.^2+kneeZs.^2).*sqrt(ankleXs.^2+ankleYs.^2+ankleZs.^2)))

% c=(kalcaXs.*kneeXs+kalcaYs.*kneeYs+kalcaZs.*kneeZs)./((sqrt(kalcaXs.^2+kalcaYs.^2+kalcaZs.^2).*sqrt(kneeXs.^2+kneeYs.^2+kneeZs.^2)))

plot(acosd(c))


% a1=-kneeXs+kalcaXs;
% b1=-kneeYs+kalcaYs;
% c1=-kneeZs+kalcaZs;
% 
% a2=-ankleXs+kneeXs;
% b2=-ankleYs+kneeYs;
% c2=-ankleZs+kneeZs;
% 
% d=(a1.*a2+b1.*b2+c1.*c2)./((sqrt(a1.^2+b1.^2+c1.^2).*sqrt(a2.^2+b2.^2+c2.^2)))
% 
% % c=(kalcaXs.*kneeXs+kalcaYs.*kneeYs+kalcaZs.*kneeZs)./((sqrt(kalcaXs.^2+kalcaYs.^2+kalcaZs.^2).*sqrt(kneeXs.^2+kneeYs.^2+kneeZs.^2)))
% figure
% plot(acosd(d))

% a1=kneeXs-ankleXs;
% b1=kneeYs-ankleYs;
% c1=kneeZs-ankleZs;
% 
% a2=toeXs-ankleXs;
% b2=toeYs-ankleYs;
% c2=toeZs-ankleZs;
% 
% d=(a1.*a2+b1.*b2+c1.*c2)./((sqrt(a1.^2+b1.^2+c1.^2).*sqrt(a2.^2+b2.^2+c2.^2)))
% 
% % c=(kalcaXs.*kneeXs+kalcaYs.*kneeYs+kalcaZs.*kneeZs)./((sqrt(kalcaXs.^2+kalcaYs.^2+kalcaZs.^2).*sqrt(kneeXs.^2+kneeYs.^2+kneeZs.^2)))
% figure
% plot(acosd(d)-90)