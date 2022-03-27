#
# Top level driving script.
# 
# 1. Select a random sequence.
# 2. Put it through our suite of tests
# 3. Build up a metric of guesses functional style "lapply(thisSeq, Osctests)"
# 4. Output it
# 5. Run and compare
# 6. Adjust heuristics / values
#
# 

OscTests <- c("heuristics", "crossing", "wavelet", "deeplearning", "fft")


#
# Choose a random sequence 1-27 (1-20 with Oscillations and 21-28 Without)
# 
num <- round(runif(n=1, min=1, max=28))
print(paste("selected sequence", this))


#
# import (unknown) signal
#
if (num <= 20) {
		thisSeqSig <- WithOscS$num
		thisSeqOsc <- WithOscO$num
		thisSeqTim <- WithOscT$num 
	} else if (num > 20) {
		thisSeqSig <- WithoutOscS$num
		thisSeqOsc <- WithoutOscO$num
		thisSeqTim <- WithOoutscT$num 
	} else {
		print("bad sequence.")
	}

#
# 
#
for (thisTest in OscTests) {
	print(paste("This test", thisTest))
   	(inSeq, outSeq) <- test(ThisSeq, thisTest)
}


#
# Do tests
#
if (heuristics()) {
	guess <- guess + 1
	}
else {
	guess <- guess + 0
}




#
# Is it correct?
#