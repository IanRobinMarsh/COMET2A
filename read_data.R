#
# Assume we are at the top level (your path ~/COMET2A)
#

require(R.matlab, quietly=T, warn.conflicts=F)
require(data.table, quietly=T, warn.conflicts=F)
require(signal, quietly=T, warn.conflicts=F)
require(swfscMisc, quietly=T, warn.conflicts=F)

osc <- readMat('./Data/oscillationDataLCM.mat')

names(osc$signalsWithOscillations[,,1])

WithOsc <- osc$signalsWithOscillations
WithOsc <- lapply(WithOsc, unlist, use.names=FALSE)
WithOsc <- as.data.table(WithOsc)
WithOsc <- round(WithOsc, digits=3)



WithoutOsc <- osc$signalsWithoutOscillations
WithoutOsc <- lapply(WithoutOsc, unlist, use.names=FALSE)
WithoutOsc <- as.data.table(WithoutOsc)

strings <- rep(c("T", "S", "O"), 20)
digits  <- rep(c(1:20), each = 3)
names(WithOsc) <- paste0(strings, digits)


strings <- rep(c("T", "S", "O"), 7)
digits  <- rep(c(1:7), each = 3)
names(WithoutOsc) <- paste0(strings, digits)
WithoutOsc <- round(WithoutOsc, digits=3)












