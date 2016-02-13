#--------------------------------------------------------
#	Uses of library: 	"predfinitepop"
#--------------------------------------------------------

#             Read files with functions in R
rm(list=ls())

library("predfinitepop")

set.seed(12345)

#-------------------------------------------------------------
#		DATA
#-------------------------------------------------------------
data(predfinitepop_datos)

#		Sample (with 10% of the population)

datos <- datos_10

#-------------------------------------------------------------
#		MODEL PARAMETERS
#-------------------------------------------------------------

#	a.	Parameter "alpha" of the Dirichlet process
#		(this is for J02 planned domains)
alphaDP <- matrix(0.03,2,1)   

#	b. vector with indicator variables for unplanned domains
colid_D	<- t(as.matrix(c(6:8)))	

#	c. Matrix with parameters for unplanned domains
#		(this is for J=2 planned domains)
alpha_D <- matrix(0.3,2,length(colid_D))

#-------------------------------------------------------------
#		CODE PARAMETERS
#-------------------------------------------------------------

#	A. Interval for calibration of G_0
inter <- 3 

#	B. Number of groups for predictive validation and model comparison
part <- 20

#	C. Number of Monte Carlo replicates of the predictive distributions
nSim <- 10				

#-------------------------------------------------------------
#		TESTING "domplan.R"
#-------------------------------------------------------------
date.ini <- date()
domplan_sim <- domplan(datos,datos_ant,domplan_N,alphaDP,inter,part,nSim)
date.fin <- date()

#
#	--	END	--