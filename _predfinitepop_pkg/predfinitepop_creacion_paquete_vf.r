#    Pasos para la creacion de la Libreria "predfinitepop"

#########
# paso 1
#########

rm(list = ls())

rutacode <- "C:/JCMO.Research/Coding/_r/_predfinitepop_pkg/R"
source(paste(rutacode,"/conteo.R",sep=""))
source(paste(rutacode,"/domnoplan.R",sep=""))
source(paste(rutacode,"/domnoplan_composicion.R",sep=""))
source(paste(rutacode,"/domnoplan_g0.R",sep=""))
source(paste(rutacode,"/domnoplan_totalcomp.R",sep=""))
source(paste(rutacode,"/domplan.R",sep=""))
source(paste(rutacode,"/domplan_g0.R",sep=""))
source(paste(rutacode,"/domplan_total.R",sep=""))
source(paste(rutacode,"/g0_licitacion.R",sep=""))
source(paste(rutacode,"/g0_simulacion.R",sep=""))
source(paste(rutacode,"/ghat_simulacion.R",sep=""))
source(paste(rutacode,"/gstar_simulacion.R",sep=""))
source(paste(rutacode,"/invGauss.R",sep=""))
source(paste(rutacode,"/pesosDP.R",sep=""))
source(paste(rutacode,"/randDirichlet.R",sep=""))
source(paste(rutacode,"/unicstar.R",sep=""))

load("C:/JCMO.Research/Coding/_r/_predfinitepop_pkg/data/predfinitepop_datos.RData")

datasample <- muestras
dataref <- datos_ant
popcomp <- list(domplan_N,N,ND)
poptot <- list(T,TD)

package.skeleton("predfinitepop", path="C:/JCMO.Research/Coding/_r/",list=c(	
				"conteo",
				"domnoplan",
				"domnoplan_composicion",
				"domnoplan_g0",
				"domnoplan_totalcomp",
				"domplan",
				"domplan_g0",
				"domplan_total",
				"g0_licitacion",
				"g0_simulacion",
				"ghat_simulacion",
				"gstar_simulacion",
				"pinvgauss",
				"dinvgauss",
				"qinvgauss",
				"rinvgauss",
				"pesosDP",
				"randDirichlet",
				"unicstar",
				"datasample",
				"dataref",
				"popcomp", 
				"poptot")
				)

##########
# Paso 2
##########

#------------------------------
#	Remplzar y revizar los archivos de documentacion en la nueva carpeta donde se creara el paquete
#------------------------------

# system("Rcmd.exe Rd2txt C:/JCMO.Research/_r/predfinitepop/man/conteo.Rd")

# Con la instruccion "Rd2pdf" podemos convertir a pdf, ya sea solo de una funcion como el de toda la carpeta "man"
# system("Rcmd.exe Rd2pdf C:/JCMO.Research/_r/predfinitepop/man/conteo.Rd")

# En este paso para verificar y compilar la libreria se puede hacer por dos partes ya sea con las siguientes instrucciones 
# o generandola en Rstudio, en este ultimo es de una manera mas sencilla y practica

# Comandos (falta depurarlos y verificar que funcionen)

system("Rcmd.exe check C:/JCMO.Research/Coding/_r/predfinitepop")

system("Rcmd.exe build C:/JCMO.Research/Coding/_r/predfinitepop --resave-data")

# system("Rcmd.exe INSTALL --build --preclean C:/JCMO.Research/Coding/_r/predfinitepop --resave-data")

##########
# Paso 3
##########

# PARA GENERAR EL "PDF" DE LA LIBRERIA ("FINAL") se tiene que manadar la ubicacion de la libreria 
#       (C:/JCMO.Research/_r/_predfinitepop/R/predfinitepop) asi ya incorporará el archivo DESCRIPTION.archivo

system("Rcmd.exe Rd2pdf C:/JCMO.Research/Coding/_r/predfinitepop")

#
#	--	FIN --