\name{tsal.boot}
\alias{tsal.boot}
\alias{tsal.bootstrap.errors}
\alias{tsal.total.magnitude}

\title{Bootstraps methods for Tsallis Distributions}
\description{
  Bootstrap functions.
}
\usage{
tsal.bootstrap.errors(dist=NULL, reps=500, confidence=0.95,
    n=if(is.null(dist)) 1 else dist$n,
    shape=if(is.null(dist)) 1 else dist$shape,
    scale=if(is.null(dist)) 1 else dist$scale,
    q = if(is.null(dist)) tsal.q.from.shape(shape) else dist$q,
    kappa = if(is.null(dist)) tsal.kappa.from.ss(shape,scale) else dist$kappa,
    method = if(is.null(dist)) "mle.equation" else dist$method,
    xmin = if(is.null(dist)) 0 else dist$xmin)


tsal.total.magnitude(dist=NULL, n=if(is.null(dist)) 1 else dist$n,
    shape=if(is.null(dist)) 1 else dist$shape,
    scale=if(is.null(dist)) 1 else dist$scale,
    q = if(is.null(dist)) tsal.q.from.shape(shape) else dist$q,
    kappa = if(is.null(dist)) tsal.kappa.from.ss(shape,scale) else dist$kappa,
    xmin = if(is.null(dist)) 0 else dist$xmin,
    mult = 1)

}
\arguments{

\item{dist}{distribution (as a list of the sort produced by tsal.fit)}
\item{reps}{number of bootstrap replicates.}
\item{confidence}{confidence level for confidence intervals.}
\item{n}{original sample size.}
\item{shape, q}{shape parameters (over-riding those of the distribution, if
one was given).}
\item{scale, kappa}{scale parameters (over-riding those of the distribution, if
one was given).}
\item{method}{fitting method (over-riding that used in the original
fit, if one was given), see \code{\link{tsal.fit}}.}
\item{xmin}{minimum x-value (left-censoring threshold).}
\item{mult}{multiplier of size (if the base units of the data are not real units).}



}
\details{
\code{tsal.bootstrap.errors} finds biases and standard errors for parameter estimates by parametric
 bootstrapping, and simple confidence intervals
 Simulate, many times, drawing samples from the estimated distribution, of
 the same size as the original data; re-estimate the parameters on the
 simulated data.  The distribution of the re-estimates around the estimated
 parameters is approximately the same as the distribution of the estimate
 around the true parameters.
 This function invokes the estimating-equation MLE, but it would be easy to modify to
 use other methods.
 Confidence intervals (CI) are calculated for each parameter separately, using
 a simple pivotal interval (see, e.g., Wasserman, _All of Statistics_, Section
 8.3).  Confidence regions for combinations of parameters would be a tedious,
 but straightforward, extension.




\code{tsal.total.magnitude}
estimates the total magnitude of a tail-sampled population
 given that we have n samples from the tail of a distribution, i.e., only
 values >= xmin were retained, provide an estimate of the total magnitude
 (summed values) of the population.
Then it estimates the number of objects, observed and un-observed, as n/pr(X >= xmin)
 and then multiply by the mean.

}
\value{
\code{tsal.bootstrap.errors} returns a structured list, containing the actual parameter settings used,
          the estimated biases, the estimated standard errors, the lower
          confidence limits, the upper confidence limits, the sample size, the
          number of replicates, the confidence level, and the fitting method.

\code{tsal.total.magnitude} returns a list, giving estimated total magnitude
and estimated total population size.

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
# (1) fit
x <- rtsal(20, 1/2, 1/4)
tsal.loglik(x, 1/2, 1/4)

tsal.fit(x, method="mle.equation")
tsal.fit(x, method="mle.direct")
tsal.fit(x, method="leastsquares")



		
}
\keyword{distribution}
