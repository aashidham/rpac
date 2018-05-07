# This function takes in X and Y and returns toplot and V.
# X is a matrix of n rows of samples, and m columns of features of these samples. Y is n rows by 1 column of labels (say 1 for some group, 2 for another, etc.).
# toplot is an n by m matrix where rows are samples and the columns are the new features, where the first feature is the most informative.
# V is an m by m matrix that shows how to transform from the regular basis of vectors to the basis where the PCA is plotted.
lPCA <- function(X,Y) {
X <- as.matrix(X)
X <- scale(X)
# construct L where each (i,j) entry  is -1 unless i = j or Y(i) = Y(j)
L <- matrix(-1,nrow(X),nrow(X))
for (i in 1:nrow(L))
{
	for (j in 1:ncol(L))
	{
		if(Y[i] == Y[j])
		{
			L[i,j]<-0
		}
		if(i==j)
		{
			L[i,j]<-0
		}
	}
}
# Also let L(i,i) = the sum of row i
for (i in 1:nrow(L))
{
	for (j in 1:ncol(L))
	{
		if(i==j)
		{
			L[i,j]<--sum(L[i,])
		}
	}
}
A <- t(X) %*% L %*% X
B <- t(X) %*% X
# find the generalized eigenvectors v that solve the expression A*v = lambda*B*v
V <- geigen(A,B)$vectors
V <- V[,ncol(V):1]
toplot <- X %*% V
output <- list("V"=V, "toplot"=toplot,"L"=L,"A"=A,"B"=B)
return(output)
}

# This function takes in X and Y and returns its best 2D visualization of the results.
plotlPCA <- function(X,Y,...) {
res <- lPCA(X,Y)
plot(res$toplot[,1],res$toplot[,2],col=Y,...)
}
