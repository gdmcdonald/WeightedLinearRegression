function [yhat, residuals, betahat, betahatintervals, betastd, tstar, covmat,sigma2] = linearreg(y,X,pvalue,W)
%©2016 Gordon McDonald
%INPUTS
%y:     nx1 observation y-values
%X:     nxb matrix of prediction functions in terms of x variable e.g. 
%pvalue: p-value to get uncertainties for
%W:     nxn matrix of weights (if omitted defaults to identity)
%
%OUTPUTS
%yhat:              predicted y-values  (n x 1)
%residuals:         y(obs)-y(predicted)  (n x 1)
%betahat:           predicted parameters of the linear regression (b x 1)
%betastd:           estimate of the uncertainty of the parameters (b x 1)
%betahatintervals:  confidence intervals for that p-value (b x 2)
%
%
%

if nargin==3
    W=eye(length(y));
elseif nargin==2
    pvalue=0.95;
    W=eye(length(y));
end

    

betahat=(X'*W*X)\(X'*W)*y;
yhat=X*betahat;
residuals=y-yhat;
nu=length(y)-length(betahat);
sigma2=sum(residuals.^2)/nu;
covmat=inv(X'*W*X).*sigma2;
betastd=sqrt(diag(covmat));

tstar=tinv((pvalue+1)/2,nu);

betahatintervals=[betahat-tstar*betastd betahat+tstar*betastd];

end
