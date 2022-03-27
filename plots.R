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

  dev.off()
