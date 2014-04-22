\name{rpac-package}
\alias{rpac}
\docType{package}
\title{
This package lets you visualize labelled data.
}
\description{
You can install and use this package by doing the following:
install.packages("devtools")
require(devtools)
install.packages("geigen")
require(geigen)
install_github("aashidham/rpac")
require(rpac)

There are two functions inside this package: lPCA and plotlPCA.

plotlPCA takes in X and Y and returns its best visualization of the results.
lPCA takes in X and Y and returns toplot and V, which you can use for your own visualizations. See the examples section for how to use.

This package needs two inputs from you: X and Y. 

X is a matrix of n rows of samples, and m columns of features of these samples. Y is n rows by 1 column of labels (say 1 for some group, 2 for another, etc.).X and Y should be numerical matrices without any NAs. It is really important that n > m for meaningful results.

toplot is an n by m matrix that plotlPCA uses to produce its plot, but is returned directly by lPCA. The rows are samples, the columns are the new features, where the first feature is the most informative. 

V is an m by m matrix that shows how to transform from the regular basis of vectors to the basis where the PCA is plotted. X %*% V == toplot.

}
\details{
\tabular{ll}{
Package: \tab anRpackage\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-04-21\cr
License: \tab What license is it under?\cr
}
}
\author{
Aaditya Shidham
}
\keyword{ package }
\seealso{
}
\examples{
X <- data.matrix(read.csv("X_sample.csv"))
Y <- data.matrix(read.csv("Y_sample.csv"))

#option 1
r <- lPCA(X,Y)
r$V
r$toplot
plot(r$toplot[,1],r$toplot[,2],col=Y)

#option 2
plotlPCA(X,Y,...) #the extra parameters are passed to plot
}
