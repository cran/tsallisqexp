\name{tsal.fit}
\alias{tsal.loglik}
\alias{tsal.fisher}
\alias{tsal.fit}

\title{Fitting Tsallis Distributions}
\description{
  Loglikelihood and fit functions.
}
\usage{
tsal.loglik(x, shape, scale, q=tsal.q.from.shape(shape),
kappa=tsal.kappa.from.ss(shape,scale), xmin=0)

tsal.fit(x, xmin=0, method=c("mle.equation", "mle.direct", "leastsquares"), ...)

#
# Note that this function ONLY works with the shape-scale parameterization
# Inputs: shape, scale, left-censoring threshold

tsal.fisher(shape, scale, xmin=0)

}
\arguments{
    \item{x}{vector of quantiles.}
    \item{shape, q}{shape parameters.}
    \item{scale, kappa}{scale parameters.}
    \item{xmin}{minimum x-value.}

    \item{method}{A character string for the estimation method:
    \code{"mle.equation"} (default), \code{"mle.direct"}, \code{"leastsquares"}.}
    \item{\dots}{further arguments to be passed to the estimation method.}


}
\details{
\code{tsal.loglik} computes the loglikelihood of a sample \code{x}.

\code{tsal.fisher} calculates the Fisher information matrix, for asymptotic variances and
 covariances of the maximum likelihood estimates of shape and scale
 First row/column corresponds to shape, second to scale
 Convergence to the asymptotic normal distribution can be slow, so for limited
 data you should bootstrap.

\code{tsal.fit} estimates parameters by solving maximum likelihood equations when
\code{method="mle.equation"}, by minimizing the log-likelihood (directly) when
\code{method="mle.direct"}, by minimizing the square difference between the
empirical and theoretical distribution functions.
This function is a wrapper for the actual methods:
\code{tsal.fit.mle.equation} (solve maximum likelihood estimating equations);
\code{tsal.fit.mle.direct} (numerical likelihood maximization); and
\code{tsal.fit.leastsquares} (least-squares curve-fitting to the empirical
                            distribution);
prettying up the results in all cases.



}
\value{
  \code{tsal.loglik} returns the loglikelihood as a numeric.

\code{tsal.fit} returns \code{NA} when estimation aborts
or a list with components (\code{type}, \code{q}, \code{kappa}, \code{shape},
\code{scale}, \code{loglik}, \code{n}, \code{xmin},
\code{method}) when estimation succeeds.
}

\references{

\emph{Maximum Likelihood Estimation for q-Exponential (Tsallis) Distributions},
\url{http://bactra.org/research/tsallis-MLE/} and \url{http://arxiv.org/abs/math.ST/0701854}.


}
\author{
Cosma Shalizi (original R code),
Christophe Dutang (R packaging)

}
\examples{

#####
# (1) fit
x <- rtsal(20, 1/2, 1/4)
tsal.loglik(x, 1/2, 1/4)

tsal.fit(x, method="mle.equation")
tsal.fit(x, method="mle.direct")
tsal.fit(x, method="leastsquares")



		
}
\keyword{distribution}
