pkgname <- "predfinitepop"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('predfinitepop')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("dataref")
### * dataref

flush(stderr()); flush(stdout())

### Name: dataref
### Title: Reference data set of a simulated population segemented in
###   planned and unplanned domains.
### Aliases: dataref
### Keywords: datasets

### ** Examples
data(dataref)


cleanEx()
nameEx("datasample")
### * datasample

flush(stderr()); flush(stdout())

### Name: datasample
### Title: Data set of a simulated population segemented in planned and
###   unplanned domains.
### Aliases: datasample
### Keywords: datasets

### ** Examples
data(datasample)


cleanEx()
nameEx("domnoplan")
### * domnoplan

flush(stderr()); flush(stdout())

### Name: domnoplan
### Title: Finite population inference on unplanned domains using reference
###   data.
### Aliases: domnoplan
### Keywords: Total Population Convolutions Domains planned Compositional
###   analysis Domains unplanned

### ** Examples

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
data(dataref)
data(datasample)
data(popcomp)

#		Sample (with 10% of the population)

datos <- datasample[[1]]
datos_ant <- dataref
domplan_N <- popcomp[[1]]

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
#		TESTING "domnoplan.R"
#-------------------------------------------------------------
date.ini <- date()
domnoplan_sim <- domnoplan(datos,datos_ant,domplan_N,alphaDP,colid_D,alpha_D,inter,part,nSim)
date.fin <- date()

#
#	--	END --
		  


cleanEx()
nameEx("domnoplan_g0")
### * domnoplan_g0

flush(stderr()); flush(stdout())

### Name: domnoplan_g0
### Title: Finite population inference on unplanned domains using
###   subjective G_{j0}.
### Aliases: domnoplan_g0
### Keywords: Total Population convolutions Domains planned Compositional
###   analysis Domains unplanned

### ** Examples

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
data(datasample)
data(popcomp)

#		Sample (with 10% of the population)

datos <- datasample[[1]]
domplan_N <- popcomp[[1]]

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
#		CODE PARAMETERS AND INCORPORATION OF THE DISTRIBUTION
#-------------------------------------------------------------
#  Incorporate each element ("g0_licitacion_in_J") according to the number of domains planned
#    g0_licitacion_in_1 <- list("distribution",teta1,esp(teta1))
# 
# In this case we have two domains planned 
g0_licitacion_in_1 <- list("Lognormal",c(6.198,0.840),.5)  
g0_licitacion_in_2 <- list("Gamma",c(6.198,0.840),.5)  
				
g0_licitacion_sal <- list(g0_licitacion_in_1,g0_licitacion_in_2)
	
#	B. Number of Monte Carlo replicates of the predictive distributions
nSim <- 10			

#-------------------------------------------------------------
#		TESTING "domnoplan.R"
#-------------------------------------------------------------
date.ini <- date()
domnoplan_sim <- domnoplan_g0(datos,domplan_N,alphaDP,colid_D,alpha_D,nSim,g0_licitacion_sal)
date.fin <- date()            

#
#	--	END --
		  


cleanEx()
nameEx("domplan")
### * domplan

flush(stderr()); flush(stdout())

### Name: domplan
### Title: Finite population inference on unplanned domains using reference
###   data.
### Aliases: domplan
### Keywords: Total Population Convolutions Domains planned

### ** Examples

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
data(dataref)
data(datasample)
data(popcomp)

#		Sample (with 10% of the population)

datos <- datasample[[1]]
datos_ant <- dataref
domplan_N <- popcomp[[1]]

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



cleanEx()
nameEx("domplan_g0")
### * domplan_g0

flush(stderr()); flush(stdout())

### Name: domplan_g0
### Title: Finite population inference on unplanned domains using
###   subjective G_{j0}.
### Aliases: domplan_g0
### Keywords: Population Total Convolutions Planned domains

### ** Examples

#--------------------------------------------------------
#	Uses of library: 	"predfinitepop"
#--------------------------------------------------------

#             Read files with functions in R
rm(list=ls())

#library("predfinitepop")

set.seed(12345)

#-------------------------------------------------------------
#		DATA
#-------------------------------------------------------------
data(datasample)
data(popcomp)

#		Sample (with 10% of the population)

datos <- datasample[[1]]
domplan_N <- popcomp[[1]]

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
#		CODE PARAMETERS AND INCORPORATION OF THE DISTRIBUTION
#-------------------------------------------------------------
#  Incorporate each element ("g0_licitacion_in_J") according to the number of domains planned
#    g0_licitacion_in_1 <- list("distribution",teta1,esp(teta1))
# 
# In this case we have two domains planned 
g0_licitacion_in_1 <- list("Lognormal",c(6.198,0.840),.5)  
g0_licitacion_in_2 <- list("Gamma",c(6.198,0.840),.5)  
				
g0_licitacion_sal <- list(g0_licitacion_in_1,g0_licitacion_in_2)
	
#	B. Number of Monte Carlo replicates of the predictive distributions
nSim <- 10				
 
#-------------------------------------------------------------
#		TESTING "domplan.R"
#-------------------------------------------------------------
date.ini <- date()
domplan_sim <- domplan_g0(datos,domplan_N,alphaDP,nSim,g0_licitacion_sal)
date.fin <- date()

#
#	--	END	--



cleanEx()
nameEx("popcomp")
### * popcomp

flush(stderr()); flush(stdout())

### Name: popcomp
### Title: Composition of the simulated population segemented in planned
###   and unplanned domains.
### Aliases: popcomp
### Keywords: datasets

### ** Examples
data(popcomp)


cleanEx()
nameEx("poptot")
### * poptot

flush(stderr()); flush(stdout())

### Name: poptot
### Title: Totals of the simulated population segemented in planned and
###   unplanned domains.
### Aliases: poptot
### Keywords: datasets

### ** Examples
data(poptot)


### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
