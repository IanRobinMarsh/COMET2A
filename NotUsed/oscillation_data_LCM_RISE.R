# options
options(width=200)	
require(R.matlab)
require(data.tabnames(osc[1])le)


osc <- readMat('oscillationDataLCM.mat')


#WithoutDT <- Mat2DT(osc, names(osc[1]))

Without <- Labelcols(Without, 20)
With    <- Mat2DT(osc, signalsWithoutOscillations)
With    <- Labelcols(With, 7)



# Plot (as groups of 3 next)
png("OSC1_osc.png")
 plot(WithOsc$T1, WithOsc$S1, type='l', col="black", xlab="Time", ylab="Signal (Black), Input (Red)")
 lines(WithOsc$T1, WithOsc$O1, type='l', col='red', lw=2)
dev.off()

# Plot (as groups of 3 next)
png("OSC1_noosc.png")
 plot(WithoutOsc$T1, WithoutOsc$S1, type='l', col="black", xlab="Time", ylab="Signal (Black), Input (Red)")
 lines(WithoutOsc$T1, WithoutOsc$O1, type='l', col='red', lw=2)
dev.off()


system("open OSC1_osc.png")
system("open OSC1_noosc.png")




# Extra struff

# str(osc) /* R structure */


# Import
# names(osc$signalsWithOscillations[,,1])
# [1] "time"        "signal"      "oscillation"


# array sizes
# osc$signalsWithOscillations[[1:3], [1], [1:20]]
# osc$signalsWithoutOscOscillations[[1:3], [1], [1:7]]
# because we have wide columns [time, oscillations, signal


Labelcols <- function(data, n) {
  strings <- rep(c("T", "S", "O"), n); 
  digits  <- rep(c(1:n), each = 3);
  names(data) <- paste0(strings, digits);

  return(data)
}

Mat2DT <- function(oscdata, part) {
    out <- oscdata$part
    out <- lapply(out, unlist, use.names=FALSE)
    out <- as.data.table(out)

    return(out)
}
