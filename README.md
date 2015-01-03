rpac
====

This is an R package for performing labelled PCA. Did you ever want to visualize high-dimensional data? If the data is unlabelled, the answer is simple: use [PCA](http://en.wikipedia.org/wiki/Principal_component_analysis). But what if it isn't labelled? Labelled PCA to the rescue!

To install:

```R
install.packages("devtools")
require(devtools)
install.packages("geigen")
require(geigen)
install_github("aashidham/rpac")
require(rpac)
```

Examples of use (code):
```R
library(RCurl)
library(rpac)

X <- getURL("http://stanford.edu/~ashidham/X_sample.csv")
X <- read.csv(textConnection(X))
X <- data.matrix(X)

Y <- getURL("http://stanford.edu/~ashidham/Y_sample.csv")
Y <- read.csv(textConnection(Y))
Y <- data.matrix(Y)

#lPCA plot
plotlPCA(X,Y) 

#compare to normal PCA plot
pca = prcomp(X)
plot(pca$x[,1],pca$x[,2],col=Y) 
```
Output of the above. The first image is labelled PCA, the second is normal PCA. The colored clusters are much better in the first image.

![Labelled PCA](http://stanford.edu/~ashidham/new.png)
![Unlabelled PCA](http://stanford.edu/~ashidham/old.png)


Details
-------------
There are two functions inside this package: lPCA and plotlPCA.

plotlPCA takes in X and Y and returns its best visualization of
the results. lPCA takes in X and Y and returns toplot and V, which
you can use for your own visualizations. 

This package needs two inputs from you: X and Y.

X is a matrix of n rows of samples, and m columns of features of these samples. Y is n rows by 1 column of labels (say 1 for some group, 2 for another, etc.). X and Y should be numerical matrices without any NAs. **It is really important that n > m for meaningful results.**
