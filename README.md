# WeightedLinearRegression
Matlab code for performing a weighted linear regression in matlab and getting out all the important stuff including confidence intervals on the parameters and covariance.

The example ‘accidentstest.m’ is looking at traffic accident data in the US. If you use the function 
`[yhat, residuals, betahat, betahatintervals, betastd, tstar, covmat,sigma2] = linearreg(y,X,pvalue,W)`
Then you’ll get the parameter estimates in `betahat`, the pvalue*100% confidence intervals on the parameter values in `betahatintervals`.
 
For example in the ‘accidentstest.m’ code,
`betahat(1)` is the estimate of the intercept, `betahat(2)` is the estimate of the slope,
`betahatintervals(1,1)` to `betahatintervals(1,2)` is the 95% confidence interval of the intercept, and
`betahatintervals(2,1)` to `betahatintervals(2,2)` is the 95% confidence interval of the slope.
