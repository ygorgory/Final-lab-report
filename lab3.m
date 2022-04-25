lambda=Ygorlab3{:, 1};
c2=Ygorlab3{:, 2};
c4=Ygorlab3{:, 4};
c6=Ygor1lab3{:, 2};
c8=Ygor1lab3{:, 4};
c=[0, 2.555, 4.057, 6.037, 7.251];
l550=[0, c2(150), c4(150), c6(150), c8(150)];
p=polyfit(c, l550, 1);
y=[p(2), p(1)*2.555+p(2), p(1)*4.057+p(2), p(1)*6.037+p(2), p(1)*7.251+p(2)];
ym=sum(l550);
ym2=sum((l550-ym).^2);
ys=0;
for i=1:5
    ys=(ys+l550(i)-c(1)*p(1)-p(2))^2;
end
r=1-ys/ym2;
scatter(c, l550)
hold on
xlabel("Concentration (mM)")
ylabel("Absorbance")
plot(c, y)
legend("data", "A=0.0492[Co]+0.0138, r^2=0.9390")
hold off
%%
eps=1:401;
for i=1:401
    l=[0, c2(i), c4(i), c6(i), c8(i)];
    p=polyfit(c, l, 1);
    eps(i)=p(1);
end
%plot(lambda, eps)
xlabel("wavelength")
ylabel("extinction coefficient")

%%

cconcc=[0, 2.555, 4.057, 6.037, 7.251];
aabsso=[0, 0.1560, 0.2180, 0.3159, 0.3573];
scatter(cconcc, aabsso);
hold on
paraame=polyfit(cconcc, aabsso, 1);
teoabs=paraame(2)+paraame(1).*cconcc;
plot(cconcc, teoabs)
ym=sum(aabsso)/5;
medsum=sum((aabsso-ym).^2);
modsum=sum((aabsso-teoabs).^2);
xm=sum(cconcc)/5;
medsumx=sum((cconcc-xm).^2);
sm=sqrt(modsum/medsumx);




