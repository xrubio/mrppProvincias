# Copyright (c) 2017 - Xavier Rubio-Campillo 
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version
#
# The source code is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#   
# You should have received a copy of the GNU General Public 
# License along with this library.  If not, see <http://www.gnu.org/licenses/>.


### Exploratory Data Analysis of dataset

library(ggplot2)


########## FREQUENCY DISTRIBUTIONS

sites <- read.table("../data/sites.csv", header=T, sep=";")
presence <-  as.matrix(read.csv("../data/presence.csv", row.names = 1, header=T, sep=';'))

sites$numCodes <- rowSums(presence)


# plot frequency distribution of sites per code
ggplot(sites, aes(x=numCodes)) + geom_histogram()

# plot number of codes present in sites organised by province  
    
svg("stampsPerProvince.svg", width=8, height=10)    
ggplot(sites, aes(y=reorder(province, numCodes), x=numCodes, fill=province)) + geom_jitter(col="grey50", alpha=0.5, shape=21, height=0.2, width=0.3, size=3) + scale_colour_manual(values=myPalette) + theme_bw() + theme(legend.position="None")
dev.off()


