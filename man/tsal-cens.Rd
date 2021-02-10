\name{tsal.tail}
\alias{tsal.tail}
\alias{dtsal.tail}
\alias{ptsal.tail}
\alias{qtsal.tail}
\alias{rtsal.tail}

\title{The Tsallis Distribution with a censoring parameter (tail-conditional)}
\description{
  Density function, distribution function, quantile function, random generation.
}
\usage{
dtsal.tail(x, shape=1,scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale), xmin=0,
log=FALSE)

ptsal.tail(x, shape=1, scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale), xmin=0,
lower.tail=TRUE, log.p=FALSE)

qtsal.tail(p,  shape=1, scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale), xmin=0,
lower.tail=TRUE, log.p=FALSE)

rtsal.tail(n, shape=1, scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale), xmin=0)

}
\arguments{
    \item{x}{vector of quantiles.}
    \item{q}{vector of quantiles or a shape parameter.}
    \item{p}{vector of probabilities.}
    \item{n}{number of observations. If \code{length(n) > 1}, the length
    is taken to be the number required.}

    \item{shape}{shape parameter.}
    \item{scale, kappa}{scale parameters.}
    \item{xmin}{minimum x-value.}

    \item{log, log.p}{logical; if TRUE, probabilities p are given as log(p).}
    \item{lower.tail}{logical; if TRUE (default), probabilities are
    \eqn{P[X \le x]}, otherwise, \eqn{P[X > x]}.}


}
\details{
    The Tsallis distribution with a censoring parameter is the distribution of
    a Tsallis distributed random variable conditionnaly on \eqn{x>xmin}.
    The density is defined as
    \deqn{
        f(x) = \frac{C}{ \kappa}(1-(1-q)x/\kappa)^{1/(1-q)}
    }{
        f(x) = C/\kappa(1-(1-q)x/\kappa)^{1/(1-q)}
    }
    for all \eqn{x>xmin} where \eqn{C} is the appropriate constant so that the integral
of the density equals 1. That is \eqn{C} is the survival probability of the classic Tsallis
distribution at \eqn{x=xmin}.
It is convenient to introduce a re-parameterization
\eqn{shape = -1/(1-q)}, \eqn{scale = shape*\kappa}
 which makes the relationship to the Pareto clearer, and eases estimation.
 If we have both shape/scale and q/kappa parameters, the latter over-ride.

}
\value{
  \code{dtsal.tail} gives the density,
  \code{ptsal.tail} gives the distribution function,
  \code{qtsal.tail} gives the quantile function, and
  \code{rtsal.tail} generates random deviates.

  The length of the result is determined by \code{n} for
  \code{rtsal.tail}, and is the maximum of the lengths of the
  numerical parameters for the other functions.  
  
}

\references{

\emph{Maximum Likelihood Estimation for q-Exponential (Tsallis) Distributions},
\url{http://bactra.org/research/tsallis-MLE/} and \url{https://arxiv.org/abs/math/0701854}.


}
\author{
Cosma Shalizi (original R code),
Christophe Dutang (R packaging)

}
\examples{

#####
# (1) density function
x <- seq(0, 5, length=24)

cbind(x, dtsal(x, 1/2, 1/4))

#####
# (2) distribution function

cbind(x, ptsal(x, 1/2, 1/4))




		
}
\keyword{distribution}
