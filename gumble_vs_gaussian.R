#install.packages("copula")
#install.packages("gsl")
library(copula)

# gumbel
gumbel.cop <- copula::gumbelCopula(3, 2)

mvd <- mvdc(gumbel.cop
            , c("gamma", "gamma")
            , list( list(shape = 3, scale = 1)
                  , list(shape = 3, scale = 1))
            )

gumbel.sample <- rMvdc(1000, mvd)

plot( x=gumbel.sample[,1]
    , y=gumbel.sample[,2]
    , pch=10
    , cex=.3
    , col=rgb(0, 0, 1, 0.3))

# gaussian


