lPCA <- function(X,Y) {
#X <- as.matrix(X)
X <- scale(X)
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
V <- geigen(A,B)$vectors
V <- V[,ncol(V):1]
toplot <- X %*% V
output <- list("V"=V, "toplot"=toplot,"L"=L,"A"=A,"B"=B)
return(output)
}

plotlPCA <- function(X,Y,...) {
res <- lPCA(X,Y)
plot(res$toplot[,1],res$toplot[,2],col=Y,...)
}