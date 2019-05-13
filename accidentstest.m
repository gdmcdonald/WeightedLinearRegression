load accidents
xdata = hwydata(:,14); %Population of states
ydata = hwydata(:,4); %Accidents per state
yuncert = 10*rand(length(hwydata(:,4)),1); %Made up uncertainties on the y-values
xtext='Population of states';
ytext='Accidents per state';
weights = diag(1./yuncert.^2);
%weights = weights./sum(sum(weights));

%prepare linear and quadratic models

xmat=generateXmat(xdata,'1','x');
xmat2=generateXmat(xdata,'1','x','x.^2');

pvalue=0.95;

[yhat, residuals, betahat, betahatintervals, betastd, tstar, covmat, sigma2]=linearreg(ydata,xmat,pvalue,weights);
[yhat2, residuals2, betahat2, betahatintervals2, betastd2, tstar2, covmat2, sigma22]=linearreg(ydata,xmat2,pvalue,weights);

% plot figures

figure(1)
clf

pe=errorbar(xdata,ydata,yuncert,yuncert,'o')
p1=plotreg2(xdata,ydata,xmat,yhat,covmat,tstar,'bo','b-','b');
p2=plotreg2(xdata,ydata,xmat2,yhat2,covmat2,tstar2,'ro','r-','r');

xlabel(xtext);
ylabel(ytext);
title("Data with models");


figure(2)

plot(xdata,(ydata-yhat),'bo',xdata,(ydata-yhat2),'rx')
title("Residuals for both models");

ss1=sum((ydata-yhat).^2)
ss2=sum((ydata-yhat2).^2)

AIC1=length(ydata)*log(ss1)+2*length(betahat)
AIC2=length(ydata)*log(ss2)+2*length(betahat2)


Fstat=abs(ss1-ss2)/min(ss2,ss1)*max(length(betahat2),length(betahat))/abs(length(betahat)-length(betahat2))
p = 1-fcdf(Fstat,length(betahat2),length(betahat))