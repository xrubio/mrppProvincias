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


#### MRPP for the rolling threshold 

library(ggplot2)
library(gridExtra)


source("mrppBase.R")

# multi mrpp
multiMrpp <- rollingMrpp()

########### figure multi mrpp

g1 <- ggplot(multiMrpp, aes(x=minCodesPerSite, y=numSites)) + geom_line(size=1, col="goldenrod1") + xlab("") + ylab("number of sites") +  annotate("label", label="sample size", x=95, y=500, colour="white", fill="goldenrod1", fontface="bold") + theme_bw()
g2 <- ggplot(multiMrpp, aes(x=minCodesPerSite, y=delta)) + geom_line(size=1, col="indianred2")  + xlab("") + ylab("delta") + annotate("label", label="mean group distance", x=90, y=0.1, colour="white", fill="indianred2", fontface="bold") + theme_bw() + scale_y_continuous(limits=c(0,1))
g3 <- ggplot(multiMrpp, aes(x=minCodesPerSite, y=effect)) + geom_line(size=1, col="palegreen4") + xlab("") + ylab("distance means") + annotate("label", label="effect", x=95, y=0.003, colour="white", fill="palegreen4", fontface="bold") + theme_bw()
g4 <- ggplot(multiMrpp, aes(x=minCodesPerSite, y=pvalue)) + geom_line(size=1, col="skyblue3") + xlab("n. stamps (threshold)") + ylab("p-value")+ annotate("label", label="significance", x=95, y=0.6, colour="white", fill="skyblue3", fontface="bold") + geom_hline(yintercept=0.05, col="grey50", size=1, linetype="twodash") +  theme_bw() + scale_y_continuous(limits=c(0,1))

#pdf("multiMprrFamily.pdf", width=10, height=10)
grid.arrange(g1,g2,g3,g4,ncol=1, top="MRPP for all stamps")
#dev.off()

