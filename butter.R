#
# Butterworth filter
#
require(data.table)
require(signal)
print(getwd())

RISEbutter <- function(filename1) {

x1 <- 1
x2 <- 0.1
x3 <- 0.5

	pdf("butter.pdf")
	
	print(paste("file1:", filename1))
	d1 <- fread(filename1)
	print(head(d1))

#	print(paste("file2:", filename2))
#	d2 <- fread(filename2)
#	print(head(d2))


	fs <- 10000
	bf <- gsignal::butter(x1, x2)
	z  <- filter(bf, d1$S1)
        plane = c("z", "s"),

	plot(d1$T, d1$S, type="l", col="blue")
	lines(z, col = "red")
	bf <- gsignal::butter(x1, x3)
	plot(d1$T, d1$S, type="l", col="blue")
	lines(z, col = "red")


#	bf <- gsignal::butter(x1, x2)
#	z <- filter(bf, d2$S1)
#	plot(d2$T, d2$S, type="l", col="blue")
#	lines(z, col = "red")
#	bf <- gsignal::butter(x1, x3)
#	plot(d2$T, d2$S, type="l", col="blue")
#	lines(z, col = "red")

	dev.off()	

}
