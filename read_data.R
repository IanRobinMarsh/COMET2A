#
# Assume we are at the top level (your path ~/COMET2A)
#

osc <- readMat('./Data/oscillationDataLCM.mat')

names(osc$signalsWithOscillations[,,1])

#
# T1-S1-O1, T2-S2-O2, ... T20-S20-O20
#
WithOsc <- osc$signalsWithOscillations
WithOsc <- lapply(WithOsc, unlist, use.names=FALSE)
WithOsc <- as.data.table(WithOsc)
WithOsc <- round(WithOsc, digits=3)

strings <- rep(c("T", "S", "O"), 20)
digits  <- rep(c(1:20), each = 3)
names(WithOsc) <- paste0(strings, digits)


#
# T1-S1-O1, T2-S2-O2, ...  T7-S7-O7.
#
WithoutOsc <- osc$signalsWithoutOscillations
WithoutOsc <- lapply(WithoutOsc, unlist, use.names=FALSE)
WithoutOsc <- as.data.table(WithoutOsc)

strings <- rep(c("T", "S", "O"), 7)
digits  <- rep(c(1:7), each = 3)
names(WithoutOsc) <- paste0(strings, digits)
WithoutOsc <- round(WithoutOsc, digits=3)












