#
# Assume we are at the top level.
#
# 
require(R.matlab, quietly=F, warn.conflicts=F)
require(data.table, quietly=F, warn.conflicts=F)
require(signal, quietly=F, warn.conflicts=F)
require(swfscMisc, quietly=F, warn.conflicts=F)

osc <- readMat('./oscillationDataLCM.mat')

names(osc$signalsWithOscillations[,,1])

WithOsc <- osc$signalsWithOscillations
WithOsc <- lapply(WithOsc, unlist, use.names=FALSE)
WithOsc <- as.data.table(WithOsc)

WithoutOsc <- osc$signalsWithoutOscillations
WithoutOsc <- lapply(WithoutOsc, unlist, use.names=FALSE)
WithoutOsc <- as.data.table(WithoutOsc)


strings <- rep(c("T", "S", "O"), 20)
digits  <- rep(c(1:20), each = 3)
names(WithOsc) <- paste0(strings, digits)

strings <- rep(c("T", "S", "O"), 7)
digits  <- rep(c(1:7), each = 3)
names(WithoutOsc) <- paste0(strings, digits)



print("====== With Oscillations =======")
for (i in 1:20) {
  print(i)

  time <- eval(parse(text = paste0("WithOsc$T", i)))
  signals <- eval(parse(text = paste0("WithOsc$S", i)))
  oscillations <- eval(parse(text = paste0("WithOsc$O", i)))
  
  csv_ts_file <- paste0("Data/WithOsc/with_osc", i, ".csv")
  write.table(x = list(time, signals, oscillations),
              file=eval(csv_ts_file),
              row.names=FALSE,
              col.names=c("T", "S", "O"),
              sep=";")
  
  
  # Plot raw data
  pdf_ts_plot <- paste0("Plots/WithOsc/with_osc", i, ".pdf")
  pdf(pdf_ts_plot)

  title=paste0("With oscillations number", i)

  plot(
    x=time,
    y=signals,
    type='l',
    col="blue",
    xlab="Time",
    ylab="Signal (Blue), Oscillation (Red)")
    main=title
  
    lines(
      x=time,
      y=oscillations,
      type='l',
      col='red',
      lw=2)

  dev.off()


  # Plot fft
  filename <- paste0("Plots/WithOsc/FFT/with_osc_fft", i, ".pdf")
  pdf(filename)
  plot(fft(signals), col="blue")
  dev.off()
}


#
#
#
print("====== Without Oscillations =======")
for (i in 1:7) {
  print(i)
  filename <- paste0("Plots/WithoutOsc/without_osc", i, ".pdf")
  pdf(filename)

  xvalT <- eval(parse(text = paste0("WithoutOsc$T", i)))
  yvalS <- eval(parse(text = paste0("WithoutOsc$S", i)))
  yvalO <- eval(parse(text = paste0("WithoutOsc$O", i)))
  title=paste0("Without oscillations number", i)
  
  plot(
    x=xvalT,
    y=yvalS,
    type='l',
    col="blue",
    xlab="Time",
    ylab="Signal (Blue), (No) oscillations (Red)")
    main=title
  
    lines(
      x=xvalT,
      y=yvalO,
      type='l',
      col='red',
      lw=2)

  filename <- paste0("Plots/WithoutOsc/FFT/without_osc_fft", i, ".pdf")
  pdf(filename)
  plot(fft(signals), col="blue")
  dev.off()
  dev.off()
}



quit()

# -----------------------------------------------

d1 <- fread("TimeSeries/Data/WithOsc/with_osc1.csv")
bf <- butter(3, 0.1)
z <- filter(bf, d1$S1)

plot(d1$T, d1$S, type="l", col="blue")
lines(z, col = "red")

bf <- butter(3, 0.01)
plot(d1$T, d1$S, type="l", c\
ol="blue")
lines(z, col = "red")



#Labelcols <- function(mydata, n) {
#  strings <- rep(c("T", "S", "O"), n)
#  digits  <- rep(c(1:n), each = 3)
# names(mydata) <- paste0(strings, digits)

#  mydata
#  return(mydata)
#}

# Misc
# str(osc) /* structure */
# d <- as.array(osc$signalsWithoutOscillations[2])
