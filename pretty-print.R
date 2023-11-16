#
# Choose a random sequence for both oscillations (1-27)
#
min <- 1
middle <- 7
max <- 27

sequence <- sample(1:max, max, replace=F)
#seq <- paste(sequence, sep=" ", collapse=" ")

cat("\nSequence\n--------\n")
cat("With Oscillations\t\t\t\t\t Without Oscillations\n")
cat(sequence[min:(max-middle)], sep=" ")
cat("  |  ")
cat(sequence[(max - middle + 1) : max], sep=" ")
cat("\n\n")

