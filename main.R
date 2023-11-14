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
# Implemented tests
#
#OscTests <- c("heuristic", "crossing", "wavelet", "deep_learning", "fft")


#
# Choose a random sequence 1-27 (1-20 with Oscillations and 21-28 Without)
#
no <- 27
sequence <- sample(1:no, no, replace=F)
#plot(hist(sequence, breaks=no+2, xlim=c(0,no+2)))
cat("\nSequence\n--------\n")
str <- paste(sequence, sep=" ", collapse=" ")
cat(str)
cat("\n\n")

# different each time this runs
first <- sequence[1]


foo <- paste('WithOsc$S', first, sep='')
print(foo)
plot(foo)

#diffs(WithOsc, 10, 10)
#diffs(WithoutOsc, 10, 10)










