function plothandle=plotreg2(xdata,ydata,xmat,yhat,covmat,tstar,dotlinestyle,fitlinestyle,CIlinestyle)
%©2016 Gordon McDonald
%INPUTS
%xdata:             nx1 data x values
%ydata:             nx1 data y values 
%xmat:              nxb matrix of functions of x
%yhat:              predicted y-values  (n x 1)
%betahat:           predicted parameters of the linear regression (b x 1)
%betastd:           estimate of the uncertainty of the parameters (b x 1)
%
%Plots the data, (xdata, ydata) along with the fit curve (yhat)
%with many examples of curves randomly sampled from the possible
%distribution of fit curves plotted in the background to give a visual
%estimate of the uncertainty of the fit parameters.
%
ystd=sqrt(diag(xmat*covmat*xmat'));
upper=yhat+tstar*ystd;
lower=yhat-tstar*ystd;


hold on
%plot the max and min curves


Xfill=[xdata',fliplr(xdata')];                %#create continuous x value array for plotting
Yfill=[lower',fliplr(upper')];              %#create y values for out and then back
hfill=fill(Xfill,Yfill,CIlinestyle);  
set(hfill,'FaceAlpha',0.1,'EdgeColor','none')

%plot(xdata,almostmaxcurve,CIlinestyle,xdata,almostmincurve,CIlinestyle,'MarkerSize',10)

%plot the data and least squares fit

plothandle=plot(xdata,ydata,dotlinestyle,xdata,yhat,fitlinestyle,'MarkerSize',10);


hold off

end
