#
# Top level script.
#
# 0. This script does very little. Invoke the others, e.g. "Rscript diffs.R"
# 1. Select a random sequence of data (1-20 and 1-7)
# 2. Put it through our suite of tests
# 3. Construct answers using functional style "lapply(thisSeq, Osctests)"
# 4. Collate replies
# 5. Report which methods work and which datasets

assign("last.warning", NULL)
source("./requires.R")
source("./read_data.R")
source("./pretty-print.R")

# take first
sel <- sequence[1]
print(paste("Current series:", sel))


time <- WithOsc[, paste("T", sep="", sel), with=FALSE]
print(time)
#seq  <- WithOsc[, paste("S", sep="", sel), with=FALSE]
#osc  <- WithOsc[, paste("O", sep="", sel), with=FALSE]
 
plot(time$T$sel, seq$S$sel, type="lines")
#lines(time$T$sel, osc$O$sel, type="lines", col="red")












