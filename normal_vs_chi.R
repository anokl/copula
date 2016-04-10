

x <- rnorm(5000)
xx <- x * x

plot(x = x)

par(mfrow=c(1,3))

hist(x
    , breaks = 50
    , probability = "true"
    , main = expression("Loi normale standard")
    , ylab = expression("Densité"))

lines(density(x),col="red")

hist(xx
    , breaks = 50
    , probability = "true"
    , main = expression(chi^{2})
    , xlab = expression(x^{2})
    , ylab = expression("Densité"))

lines(density(xx),col="red")

plot ( x
     , xx
     , pch=10
     , cex=.3
     , xlab = expression(x)
     , ylab = expression(x^{2})
     , main = expression( "Diagramme de dispersion" ~ x ~ vs ~ x^{2} )
     , col=rgb(0, 0, 1, 0.3))

cor(x,xx)

