#
# Top level script.
#
# 0. This script does very little. Invoke the others, "Rscript diffs.R"
# 1. Select a random sequence of data (1-21)
# 2. Put it through our suite of tests
# 3. Construct answers using functional style "lapply(thisSeq, Osctests)"
# 4. Collate replies
# 5. Examine

assign("last.warning", NULL)
source("./requires.R")
source("./read_data.R")


#
# Choose a random sequence with oscillations (1-20)
#
no <- 20
sequence <- sample(1:no, no, replace=F)
seq <- paste(sequence, sep=" ", collapse=" ")
cat("\nSequence\n--------\n")
cat(seq)
cat("\n\n")

sel <- sequence[1]
time <- WithOsc[, sel, ]
seq  <- WithOsc[, sel+1, ]
osc  <- WithOsc[, sel+2, ]






#  Without Oscillations (1-7)
no <- 7
sequence <- sample(1:no, no, replace=F)
seq <- paste(sequence, sep=" ", collapse=" ")
cat("\nSequence\n--------\n")
cat(seq)
cat("\n\n")


first <- sequence[1]
time <- WithoutOsc[, first]
seq  <- WithoutOsc[, first + 1]
osc  <- WithoutOsc[, first + 2]


#diffs(WithOsc, 10, 10)
#diffs(WithoutOsc, 10, 10)










