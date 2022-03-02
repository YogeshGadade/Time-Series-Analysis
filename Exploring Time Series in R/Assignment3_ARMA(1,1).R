######################################################
# Time Series Analysis
#
# Yogesh Awdhut Gadade
#
# Objective - Investigate ARMA models
######################################################
rm(list=ls())
options(width=200)
library(astsa)
######################################################
cat(" Investigate ARMA models\n\n", "Last modification:",date(),'\n')

######################################################
# Sketch the autocorrelation functions for each of the following ARMA models:
#  (a) ARMA(1,1) with ?? = 0.7 and ?? = 0.4.
#  (b) ARMA(1,1) with ?? = 0.7 and ?? = ???0.4.
# Hint: Like question 1., you can use ARMAacf function. (c) Simulate each the
# models in (a)-(b) with 150 observations, and plot theirs series, and their sample ACF.

ARMA11 <- arima.sim(model=list(ar=.7,ma=.4),n=150)
ARMA01 <- arima.sim(model=list(ma=.7),n=150)
ARMA10 <- arima.sim(model=list(ar=.4),n=150)
#
# compute ACF for all three sims
#
ARMA11.acf <- acf(ARMA11,plot=F)
ARMA01.acf <- acf(ARMA01,plot=F)
ARMA10.acf <- acf(ARMA10,plot=F)
#
# compute theoretical ACFs for all models
#
acf.11 <- ARMAacf(ar=.7,ma=.4,lag.max=20)
acf.01 <- ARMAacf(ma=.7,lag.max=20)
acf.10 <- ARMAacf(ar=.4,lag.max=20)
#
# plot against each other
#
plot(ARMA11.acf)
lines(ARMA11.acf$lag,acf.11)
