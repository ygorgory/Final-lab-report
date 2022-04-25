lnk=[log(0.000822), log(0.002629), log(0.004438)];
oneoT=[1/(273.15+40), 1/(273.15+50), 1/(273.15+60)];
p3030=polyfit(oneoT, lnk, 1);
ym=sum(lnk)/3;
medsum=sum((lnk-ym).^2);
modsum=sum((lnk-teoea).^2);
rsq=1-(modsum/medsum)^2;
xm=sum(oneoT)/3;
medsumx=sum((oneoT-xm).^2);
sm=sqrt(modsum/medsumx);
sm30=standev(time, ln60);

function sm = standev(x, y)
    p=polyfit(x, y, 1);
    ym=sum(y)/length(y);
    teoy=p(2)+p(1)*x;
    modsum=sum((y-teoy).^2);
    xm=sum(x)/length(x);
    medsumx=sum((x-xm).^2);
    ym-teoy'
    medsumx
    modsum
    length(x)
    sm=sqrt(modsum/(medsumx*(length(x)-2)));
end