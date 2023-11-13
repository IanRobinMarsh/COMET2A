diffs <- function(sequence, no, ndiffs) {

      	 time <- sequence$T$no
	 seq <- sequence$S$no
	 osc <- sequence$O$no
	 
       	 

	 diffs <- diff(seq)
	 zeros <- rep(0, length(seq))
	 diffs10 <- seq - roll_mean(seq, width=ndiffs)
	 # myplot(diffs)
	 
	 return(diffs$ndiffs)
}

source("main.R")


