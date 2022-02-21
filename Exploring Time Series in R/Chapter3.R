# chapter 3
#install.packages('TSA')
library(TSA)

# regression random walk
data(rwalk)
model1=lm(rwalk~time(rwalk))
summary(model1)


plot(rwalk,type='o',ylab='y', lwd=2, col="blue")
abline(model1) # add the fitted least squares line from model1



data(tempdub)
month.=season(tempdub) # period added to improve table display
model2=lm(tempdub~month.-1) # -1 removes the intercept term
summary(model2)


model3=lm(tempdub~month.) # January is dropped automatically
summary(model3)

############################################################

# residual analysis for radnom walk data

plot(y=rstudent(model1),x=as.vector(time(rwalk)),
     xlab='Time',ylab='Standardized Residuals',type='o', lwd=2, col="blue")


plot(y=rstudent(model1),x=as.vector(fitted(model1)),
     xlab='Fitted Trend Values', ylab='Standardized Residuals',type='p')


hist(rstudent(model1),xlab='Standardized Residuals')

qqnorm(rstudent(model1))


runs(rstudent(model1))
shapiro.test(rstudent(model1))


#model 3

plot(tempdub, xlab='Year',type='o', lwd=2, col="blue" )
plot(y=rstudent(model3),x=as.vector(time(tempdub)),
     xlab='Time',ylab='Standardized Residuals',type='o', lwd=2, col="blue" )

plot(y=rstudent(model3),x=as.vector(fitted(model3)),
     xlab='Fitted Trend Values', ylab='Standardized Residuals',type='n')
points(y=rstudent(model3),x=as.vector(fitted(model3)),pch=as.vector(season(tempdub)), lwd=2, col="blue")

hist(rstudent(model3),xlab='Standardized Residuals', lwd=2   )

qqnorm(rstudent(model3) , lwd=2, col="blue" )
qqline(rstudent(model3), col = "red")

runs(rstudent(model3))
shapiro.test(rstudent(model3))

###############################################################


##ACF

acf(rstudent(model3), lwd=2, col="blue", main="") 
acf(rstudent(model1), lwd=2, col="blue", main="") 


# 

# Remember in the annual rainfall in Los Angeles, we found no evidence of dependence in that series,
par(mfrow=c(1,2))
data(larain);
plot(larain,ylab='Inches',xlab='Year',type='o', lwd=2, col="blue")


# But we now look for evidence against normality.
#win.graph(width=3,height=3,pointsize=8)
plot(y=larain,x=zlag(larain),ylab='Inches',xlab='Previous Year Inches', lwd=2, col="blue")

par(mfrow=c(1,1))

data(larain);
qqnorm(larain, lwd=2, col="blue")

qqline(larain, col="red")

runs(larain)
shapiro.test(larain)

acf(larain)