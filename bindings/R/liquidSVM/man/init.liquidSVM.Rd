% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/liquidSVM.R
\name{init.liquidSVM}
\alias{init.liquidSVM}
\alias{init.liquidSVM.default,}
\alias{init.liquidSVM.formula}
\alias{init.liquidSVM.formula}
\alias{init.liquidSVM.default}
\title{Initialize an SVM object.}
\usage{
init.liquidSVM(x, y, ...)

\method{init.liquidSVM}{formula}(x, y, ..., d = NULL)

\method{init.liquidSVM}{default}(x, y, scenario = NULL, useCells = NULL,
  ..., sampleWeights = NULL, groupIds = NULL, ids = NULL, d = NULL)
}
\arguments{
\item{x}{either a formula or the features}

\item{y}{either the data or the labels corresponding to the features \code{x}.
It can be a \code{character} in which case the data is loaded using \code{\link{liquidData}}.
If it is of type \code{liquidData} then after \code{train}ing and \code{select}ion
the model is \code{\link{test}}ed using the testing data (\code{y$test}).}

\item{...}{configuration parameters, see \link{Configuration}. Can be \code{threads=2, display=1, gpus=1,} etc.}

\item{d}{level of display information}

\item{scenario}{configures the model for a learning scenario:
E.g. \code{scenario='ls', scenario='mc', scenario='npl', scenario='qt'} etc.
Unlike the specialized functions \code{qtSVM, exSVM, nplSVM} etc.
this does not trigger the correct \code{select}}

\item{useCells}{if \code{TRUE} partitions the problem (equivalent to \code{partition_choice=6})}

\item{sampleWeights}{vector of weights for every sample or \code{NULL} (default) [currently has no effect]}

\item{groupIds}{vector of integer group ids for every sample or \code{NULL} (default).
If not \code{NULL} this will do group-wise folds, see \code{folds_kind='GROUPED'}.}

\item{ids}{vector of integer ids for every sample or \code{NULL} (default) [currently has no effect]}
}
\value{
an object of type \code{svm}
}
\description{
\strong{Should only be used by experts!}
This initializes a \code{svm} object and allocates in C++ an SVM model to which it keeps a reference.
}
\details{
Since it binds heap memory it has to be released using \code{\link{clean.liquidSVM}} which
is also performed at garbage collection.

The training data can either be provided using a formula and a corresponding \code{data.frame}
or the features and the labels are given directly.
}
\section{Methods (by class)}{
\itemize{
\item \code{formula}: Initialize SVM model using a a formula and data

\item \code{default}: Initialize SVM model using a data frame and a label vector
}}

\examples{
modelTrees <- init.liquidSVM(Height ~ Girth + Volume, trees[1:20, ])  # least squares
modelIris <- init.liquidSVM(Species ~ ., iris)  # multiclass classification
}
\seealso{
\code{\link{svm}}, \code{\link{predict.liquidSVM}}, \code{\link{test.liquidSVM}} and \code{\link{clean.liquidSVM}}
}
