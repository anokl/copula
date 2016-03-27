

x <- rnorm(5000)
xx <- x * x

plot(x = x)

par(mfrow=c(2,2))

hist(x
    , breaks = 50
    , probability = "true"
    , main = "Standard normal")

lines(density(x),col="red")

hist(xx
    , breaks = 50
    , probability = "true"
    , main = "Chi squared"
    , xlab = "x²")

lines(density(xx),col="red")

plot ( x
     , xx
     , pch=10
     , cex=.3
     , xlab = "x"
     , ylab = "x²"
     , main = "Scatter plot x vs x²"
     , col=rgb(0, 0, 1, 0.3))

cor(x,xx)

