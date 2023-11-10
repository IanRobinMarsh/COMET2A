#
# 	Top level script.
# 
# 	1. Select a random sequence.
# 	2. Put it through our suite of tests
# 	3. Build up a metric of guesses functional style "lapply(thisSeq, Osctests)"
# 	4. Output 
# 	5. Run and compare Bool and quantity (in and out of envelope)
# 	6. Adjust heuristics / values



#
# 	Packages
#
require(data.table, quietly=T, warn.conflicts=F)
require(roll, quietly=T, warn.conflicts=F)
require(dplyr, quietly=T, warn.conflicts=F)
require(gsignal, quietly=T, warn.conflicts=F)
require(R.matlab, quietly=T, warn.conflicts=F)
require(swfscMisc, quietly=T, warn.conflicts=F)
require(signal, quietly=T, warn.conflicts=F)

source("./read_data.R")



# 	Gilbert crossing
#
# 	source("diffs.R")
# 	source("gilbert.R")
# 	source("run_gilbert.R")
# 	source("plot_gilbert.R")


#
# 	Implemented tests
#
OscTests <- c("heuristics", "crossing", "wavelet", "deeplearning", "fft")


#
# 	Choose a random sequence 1-27 (1-20 with Oscillations and 21-28 Without)
# 
seed <- 2 # not sure need this

num <- round(runif(n=1, min=1, max=28))
print(paste("selected sequence", num))


#
# 	Import (unknown) signal
#
if (num <= 20) {
	thisSeqSig <- WithOsc$num
	thisSeqOsc <- WithOsc$num
	thisSeqTim <- WithOsc$num 
} else if (num > 20) {
	thisSeqSig <- WithoutOsc$num
	thisSeqOsc <- WithoutOsc$num
	thisSeqTim <- WithoutOsc$num 
} else {
	print("bad sequence.")
}


MyTest <- function( ) {
       	  	    
}

#
#	Run sequence through implemented tests 
#
for (thisTest in OscTests) {
	print(paste("This test", thisTest))
#   	(inSeq, outSeq) <- Mytest(thisTest)

   	# Check tests
   	if ((thisSeq == "with_osc") && (between(x=num, left=1, right=20))) {
   		print("Correct: Guess had oscillations and was between 1-20 (in range)")
   		correct <- correct + 1
   	} else if ((thisSeq == "with_osc") && (between(x=num, left=21, right=27))) {
 		print("Incorrect: Guess had oscillations and was between 21-27 (outside range)")
 		incorrect <- incorrect + 1
   	} else if ((thisSeq == "without_osc") && (between(x=num, left=21, right=27))) {
   		print("Correct: Guess had no oscillations, was between 21-27 (in range)")
 		correct <- correct + 1
  	} else if ((thisSeq == "without_osc") && (between(x=num, left=1, right=20))) {
  		print("Incorrect: Guess had no oscillations and was between 1-20 (outside range)")
 		incorrect <- incorrect + 1
  	} else  {
  		print("something broken")}
}

print("Totals (correct, incorrect)", correct, incorrect)









