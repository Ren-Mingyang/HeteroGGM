% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate.data.R
\name{generate.data}
\alias{generate.data}
\title{Data Generation}
\usage{
generate.data(N,Mu0.list,Theta0.list,Sigma0.list)
}
\arguments{
\item{N}{K0 * 1 vector, the sample sizes of subgroups.}

\item{Mu0.list}{A list including K0 mean vectors (p * 1).}

\item{Theta0.list}{A list including K0 precision matrices (p * p).}

\item{Sigma0.list}{A list including K0 correlation matrices (p * p).}
}
\value{
The simulated data and the true parameters.
}
\description{
Data Generation
}
\examples{
n <- 200              # The sample size of each subgroup
p <- 20               # The dimension of the precision matrix
K0 <- 3               # The true number of subgroups
N <- rep(n,K0)        # The sample sizes of K0 subgroups

################ The true parameters ################
mue <- 1.5
nonnum <- 4
mu01 <- c(rep(mue,nonnum),rep(-mue,nonnum),rep(0,p-2*nonnum))
mu02 <- c(rep(mue,2*nonnum),rep(0,p-2*nonnum))
mu03 <- c(rep(-mue,2*nonnum),rep(0,p-2*nonnum))

# Power law network
set.seed(2)
A.list <- Power.law.network(p,s=5,I2=c(1),I3=c(2))
Theta01 <- A.list$A1
Theta02 <- A.list$A2
Theta03 <- A.list$A3
sigma01 <- solve(Theta01)
sigma02 <- solve(Theta02)
sigma03 <- solve(Theta03)
Mu0.list <- list(mu01,mu02,mu03)
Sigma0.list <- list(sigma01,sigma02,sigma03)
Theta0.list <- list(Theta01,Theta02,Theta03)

################ Generating simulated data ################
whole.data <- generate.data(N,Mu0.list,Theta0.list,Sigma0.list)

}
