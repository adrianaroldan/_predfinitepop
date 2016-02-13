#
#	Inverse Gaussian distribution
#
#	Package: 	rmutil
#	Version: 	1.0
#	Title: 		Utilities for Nonlinear Regression and Repeated Measurements Models
#	Author: 	Jim Lindsey <jlindsey@luc.ac.be>
#

pinvgauss <- function(q, m, s){
#	Inverse Gaussian distribution - Probability 
#
#	Package: 	rmutil
#	Version: 	1.0
#	Title: 		Utilities for Nonlinear Regression and Repeated Measurements Models
#	Author: 	Jim Lindsey <jlindsey@luc.ac.be>
if(any(q<=0)){stop("q must contain positive values")}
if(any(m<=0)){stop("m must be positive")}
if(any(s<=0)){stop("s must be positive")}
t <- q/m
v <- sqrt(q*s)
out <- pnorm((t-1)/v)+exp(2/(m*s))*pnorm(-(t+1)/v)
return(out)
}

dinvgauss <- function(y, m, s, logcond=FALSE){
#	Inverse Gaussian distribution - Density 
#
#	Package: 	rmutil
#	Version: 	1.0
#	Title: 		Utilities for Nonlinear Regression and Repeated Measurements Models
#	Author: 	Jim Lindsey <jlindsey@luc.ac.be>
if(any(y<=0)){stop("y must contain positive values")}
if(any(m<=0)){stop("m must be positive")}
if(any(s<=0)){stop("s must be positive")}
tmp <- -(y-m)^2/(2*y*s*m^2)-(log(2*pi*s)+3*log(y))/2
if(!logcond){tmp <- exp(tmp)}
return(tmp)
}

qinvgauss <- function(p, m, s){
#	Inverse Gaussian distribution - Quantile 
#
#	Package: 	rmutil
#	Version: 	1.0
#	Title: 		Utilities for Nonlinear Regression and Repeated Measurements Models
#	Author: 	Jim Lindsey <jlindsey@luc.ac.be>
h <- function(y){
	t <- y/m[i]
	v <- sqrt(y*s[i])
	pnorm((t-1)/v)+exp(2/(m[i]*s[i]))*pnorm(-(t+1)/v)-p[i]}
if(any(p<0|p>1))stop("p must lie between 0 and 1")
if(any(m<=0))stop("m must be positive")
if(any(s<0))stop("s must be positive")
len <- max(length(p),length(m),length(s))
if(length(p)!=len){
	if(length(p)==1)p <- rep(p,len)
	else stop("length of p incorrect")}
if(length(m)!=len){
	if(length(m)==1)m <- rep(m,len)
	else stop("length of m incorrect")}
if(length(s)!=len){
	if(length(s)==1)s <- rep(s,len)
	else stop("length of s incorrect")}
tmp <- vector(mode="numeric",len)
for (i in 1:len){
	interval <- c(.Machine$double.xmin,20)
	while(h(interval[1])*h(interval[2])>0)interval <- 2*interval
	tmp[i] <- uniroot(h,interval)$root}
return(tmp)
}

rinvgauss <- function(n=1, m, s){
#	Inverse Gaussian distribution - Simulation
#
#	Package: 	rmutil
#	Version: 	1.0
#	Title: 		Utilities for Nonlinear Regression and Repeated Measurements Models
#	Author: 	Jim Lindsey <jlindsey@luc.ac.be>
temp <- qinvgauss(runif(n),m=m,s=s)
return(temp)
}
