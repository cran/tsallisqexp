\name{tsal}
\alias{tsal}
\alias{dtsal}
\alias{ptsal}
\alias{qtsal}
\alias{rtsal}
\alias{tsal.mean}

\title{The Tsallis Distribution}
\description{
  Density function, distribution function, quantile function, random generation.
}
\usage{
dtsal(x, shape=1, scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale),
log=FALSE)

ptsal(x, shape=1, scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale),
lower.tail=TRUE, log.p=FALSE)

qtsal(p,  shape=1, scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale),
lower.tail=TRUE, log.p=FALSE)

rtsal(n, shape=1, scale=1, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale))

tsal.mean(shape, scale, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale))

}
\arguments{
    \item{x}{vector of quantiles.}
    \item{q}{vector of quantiles or a shape parameter.}
    \item{p}{vector of probabilities.}
    \item{n}{number of observations. If \code{length(n) > 1}, the length
    is taken to be the number required.}

    \item{shape}{shape parameter.}
    \item{scale, kappa}{scale parameters.}

    \item{log, log.p}{logical; if TRUE, probabilities p are given as log(p).}
    \item{lower.tail}{logical; if TRUE (default), probabilities are
    \eqn{P[X \le x]}, otherwise, \eqn{P[X > x]}.}


}
\details{
    The Tsallis distribution is defined by the following density
    \deqn{
        f(x) = \frac{1}{ \kappa}(1-(1-q)x/\kappa)^{1/(1-q)}
    }{
        f(x) = 1/\kappa(1-(1-q)x/\kappa)^{1/(1-q)}
    }
    for all \eqn{x}.
It is convenient to introduce a re-parameterization
\eqn{shape = -1/(1-q)}, \eqn{scale = shape*\kappa}
 which makes the relationship to the Pareto clearer, and eases estimation.
 If we have both shape/scale and q/kappa parameters, the latter over-ride.

}
\value{
  \code{dtsal} gives the density,
  \code{ptsal} gives the distribution function,
  \code{qtsal} gives the quantile function, and
  \code{rtsal} generates random deviates.
    \code{tsal.mean} computes the expected value.

  The length of the result is determined by \code{n} for
  \code{rtsal}, and is the maximum of the lengths of the
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
