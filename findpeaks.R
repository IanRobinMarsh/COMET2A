require(gsignal)



#
# get signals
# 
t <- length(signals)
data <- signals
signals <- signals * 100
peaks1 <- findpeaks(data)
peaks2 <- findpeaks(data, MinPeakHeight=1)
dt <- t[2]-t[1]
peaks3 <- findpeaks(data, MinPeakHeight=1, MinPeakDistance=round(0.5/dt))


pdf("findpeaks_example.pdf")
 op <- par(mfrow=c(1,3))
 plot(t, data, type="l", xlab="", ylab="")
 points (t[peaks1$loc],peaks1$pks,col="red", pch=1)
 plot(t, data, type="l", xlab="", ylab="")
 points (t[peaks2$loc],peaks2$pks,col="red", pch=1)
 par (op)
 title(paste("Peaks for With Oscillation")
dev.off()