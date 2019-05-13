# WeightedLinearRegression
Matlab code for performing a weighted linear regression in matlab and getting out all the important stuff including confidence intervals on the parameters and covariance.

The example ‘accidentstest.m’ is looking at traffic accident data in the US. If you use the function 

`[yhat, residuals, betahat, betahatintervals, betastd, tstar, covmat,sigma2] = linearreg(y,X,pvalue,W)`

Then you’ll get the parameter estimates in `betahat`, the pvalue*100% confidence intervals on the parameter values in `betahatintervals`.
 
For example in the ‘accidentstest.m’ code,
`betahat(1)` is the estimate of the intercept, `betahat(2)` is the estimate of the slope,
`betahatintervals(1,1)` to `betahatintervals(1,2)` is the 95% confidence interval of the intercept, and
`betahatintervals(2,1)` to `betahatintervals(2,2)` is the 95% confidence interval of the slope.


For the function linearreg():

function [yhat, residuals, betahat, betahatintervals, betastd, tstar, covmat,sigma2] = linearreg(y,X,pvalue,W)
©2016 Gordon McDonald

INPUTS
y:     nx1 observation y-values
X:     nxb matrix of prediction functions in terms of x variable e.g. 
pvalue: p-value to get uncertainties for
W:     nxn matrix of weights (if omitted defaults to identity)

OUTPUTS
yhat:              predicted y-values  (n x 1)
residuals:         y(obs)-y(predicted)  (n x 1)
betahat:           predicted parameters of the linear regression (b x 1)
betastd:           estimate of the uncertainty of the parameters (b x 1)
betahatintervals:  confidence intervals for that p-value (b x 2)

Details:
If you only put in linearreg(y,X) - then pvalue defaults to 0.95 and W defaults to the identity.
If you only put in linearreg(y,X,pvalue) - then W defaults to the identity.
