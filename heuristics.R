Read

Difference

diffs 0-1 length 2000-5000 (3000 long)

ecdfs


signs <- function() {
  signs <- ""
  for (i in 1:length(diffs)) {
    if (diffs[i] < 0)
       	{signs[i] <- '-1'}
    else if (diffs[i] > 0) 
         {signs[i] <- '1'}
    else {
    	 {signs[i] <- 0
  }
  return(signs)
}