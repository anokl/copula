#install.packages("copula")
#install.packages("gsl")
install.packages("plot3D")
library(copula)
library(plot3D)

# gumbel
gumbel.cop <- copula::gumbelCopula(param = 1.8, 2)

mvd <- mvdc(gumbel.cop
            , c("gamma", "gamma")
            , list( list(shape = 3, scale = 1)
                  , list(shape = 3, scale = 1))
            )

gumbel.sample <- rMvdc(10000, mvd)

cor(gumbel.sample[,1],gumbel.sample[,2])

# gaussian

gaussian.cop <- copula::normalCopula(0.7 , dim = 2)

mvd <- mvdc(gaussian.cop
            , c("gamma", "gamma")
            , list( list(shape = 3, scale = 1)
                  , list(shape = 3, scale = 1))
            )

gaussian.sample <- rMvdc(10000, mvd)

cor(gaussian.sample[,1],gaussian.sample[,2])            

# plot samples
par(mfrow=c(1,2))

xmax = max ( gaussian.sample[,1]
             , gaussian.sample[,2]
             , gumbel.sample[,1]
             , gumbel.sample[,2])

plot( x=gaussian.sample[,1]
    , y=gaussian.sample[,2]
    , pch=10
    , cex=.3
    , col=rgb(0, 0, 1, 0.3)
    , xlim = c(0, xmax)
    , ylim = c(0, xmax)
    , xlab = expression(X)
    , ylab = expression(Y)
    , main = expression(Gauss))

plot( x=gumbel.sample[,1]
      , y=gumbel.sample[,2]
      , pch=10
      , cex=.3
      , col=rgb(0, 0, 1, 0.3)
      , xlim = c(0, xmax)
      , ylim = c(0, xmax)
      , xlab = expression(X)
      , ylab = expression(Y)
      , main = expression(Gumbel))

par(mfrow=c(2,2))

xmax = max ( gaussian.sample[,1]
    , gaussian.sample[,2]
    , gumbel.sample[,1]
    , gumbel.sample[,2])

hist(gaussian.sample[,1]
     , breaks = 50
     , probability = "true"
     , xlim = range(0,xmax) )

hist(gumbel.sample[,1]
     , breaks = 50
     , probability = "true"
     , xlim = range(0,xmax) )

hist(gaussian.sample[,2]
     , breaks = 50
     , probability = "true"
     , xlim = range(0,xmax) )

hist(gumbel.sample[,2]
     , breaks = 50
     , probability = "true"
     , xlim = range(0,xmax) )
