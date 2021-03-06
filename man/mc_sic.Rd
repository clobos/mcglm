% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mc_sic.R
\name{mc_sic}
\alias{mc_sic}
\title{Score Information Criterion - Regression}
\source{
Bonat, W. H. (2016). Multiple Response Variables Regression
Models in R: The mcglm Package. Journal of Statistical Software, submitted.

Bonat, et. al. (2016). Modelling the covariance structure in
marginal multivariate count models: Hunting in Bioko Island.
Environmetrics, submitted.
}
\usage{
mc_sic(object, scope, data, response, penalty = 2)
}
\arguments{
\item{object}{an object of \code{mcglm} class.}

\item{scope}{a vector of covariate names to be tested.}

\item{data}{data set containing all variables involved in the model.}

\item{response}{index indicating for which response variable the
SIC should be computed.}

\item{penalty}{penalty term (default = 2).}
}
\value{
A data frame containing SIC values, degree of freedom,
Tu-statistics and chi-squared reference values.
}
\description{
Compute the score information criterion (SIC) for an
object of \code{mcglm} class.
The SIC is useful for selecting the components of the linear predictor.
It can be used to construct an stepwise covariate selection.
}
\examples{
set.seed(123)
x1 <- runif(100, -1, 1)
x2 <- gl(2,50)
beta = c(5, 0, 3)
X <- model.matrix(~ x1 + x2)
y <- rnorm(100, mean = X\%*\%beta , sd = 1)
data <- data.frame(y, x1, x2)
# Reference model
fit0 <- mcglm(c(y ~ 1), list(mc_id(data)), data = data)
# Computing SIC
mc_sic(fit0, scope = c("x1","x2"), data = data, response = 1)

}
\seealso{
\code{mc_sic_covariance}.
}
\author{
Wagner Hugo Bonat, \email{wbonat@ufpr.br}
}
