signs <- function(vec, start, end) {

  vec <- na.omit(vec)
  print(paste("length", length(vec)))
  vec <- na.omit(vec)
  print(paste("length", length(vec)))
      
  signs <- 0
  for (i in start:end) {
    if (vec[i] < 0)
	{signs[i] <- -1}
    else if (vec[i] >= 0)
         {signs[i] <- 1}
    else 
         {signs[i] <- 0}
  }
  return(signs)
}


# WithOsc
# run_median
# diffs
# signs
# gilbert
# run_gilbert