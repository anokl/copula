
#install.packages("rgl")
install.packages("plot3D")

library(rgl)

###############################################################
fu <- function(xx)
{
  res = c(length=length(xx))
  for(i in 1: length(xx))
  {
    if (xx[i] >= gamma && xx[i] <= 1-gamma )
      res[i] <- 1.0
    else
      res[i] <- (2 * gamma - 1) / (2 * gamma)
  }
  return(res)
}

gu <- function(xx)
{
  res = c(length=length(xx))
  for(i in 1: length(xx))
  {
    if (xx[i] >= gamma && xx[i] <= 1-gamma )
      res[i] <- -1.0
    else
      res[i] <- -(2 * gamma - 1) / (2 * gamma)
  }
  return(res)
}

copula <- function(x, y)
{
    x*y + integrate(fu, 0, x)$value * integrate(gu, 0, y)$value  
}

###############################################################


gamma <- 0.3
x <- seq(0, 1, by = 0.05)
y <- seq(0, 1, by = 0.05)
z <- matrix(nrow = length(x), ncol = length(y))


for(i in 1:length(x))
{
  for(j in 1:length(y))
  {
    z[i,j] <- copula(x[i], y[j])
  }
}

persp3D ( z = z
        , x = x
        , y =y
        , lighting = TRUE
        , r = 2
        , d = 2
        , scale = FALSE
        , expand = 0.6
        , cex.lab = 1
        , cex.axis = 0.6
        , ticktype = "detailed"
        , nticks=4)
