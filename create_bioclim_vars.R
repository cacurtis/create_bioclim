########################
#for more info, check the "dismo" package tutorial
#Adapted by Caroline Curtis
#7-Dec-2015
#Use this code to make 19 bioclim variables from monthly climate data
#######################


####################################
#load required libraries
library(dismo)
library(rgdal)
library(sp)


#set the working directory. Change this according to where your file location
setwd("F:/artr_t_presentation/artr_clim_change")
#####################################

####################################
#make single layers from each variable  - two options

#IF STARTING WITH MONTHYL CLIMATE LAYERS:
#for each of the 3 climate variables, load all 12 months and turn them into a raster stack
#this creates a single RasterStack from the 12 files
#note that I have additional file directory information here becuase my files were in sub-folders within the working directory


tmax<-stack(paste(getwd(),"/clim/Daymet_monthly/tmax/tmax_avg", 1:12, ".tif", sep=""))
tmin<-stack(paste(getwd(),"/clim/Daymet_monthly/tmin/tmin_avg", 1:12, ".tif", sep=""))
ppt<-stack(paste(getwd(),"/clim/Daymet_monthly/ppt20inc/ppt20inc", 1:12, ".tif", sep=""))





#name the new 19 layer Rasterbrick (x) and use the function "biovars" to combine the 3 sets of climate data
#this will take a while.  longer for larger areas.  
x<-biovars(prec=ppt,tmin=tmin,tmax=tmax)

#check that your new layer (x) contains all 19 layers, has the correct dimensions, etc.  
names(x)
plot(x)
plot(x$bio1) #use this view each layer individually

#save the bioclim rasterbrick
DaymetBioclim <- writeRaster(x, "clim/Daymet_monthly/dymt_ppt20inc_bioclm/dymt_ppt20inc_bioclm.tif", format='GTiff')
plot(DaymtBioclm$bio1)
############################
#add points and extract the bioclim layer values to the points
# artr <-read.csv("artr.shpfiles/artr_all_19bioclim_extract_ll_only.csv", header=TRUE)
# plot(x$bio1,col=grey(1:99/100))
# points(artr,col="red",lwd=2)
# extract(x, artr, cellnumbers=TRUE)



