# 	Gilbert crossing
#
# 	source("diffs.R")
# 	source("gilbert.R")
# 	source("run_gilbert.R")
# 	source("plot_gilbert.R")



gilbert <- function(vec, start, end) {

  vec <- na.omit(vec)
#  print(paste(end - start, "of", length(vec), "items."))
    
  pp <- 0
  pn <- 0
  np <- 0
  nn <- 0
  broken <- 0
  
  for (i in start:(end+1)) {
    # pp
    if ((vec[i] >= 0) & (vec[i+1] >= 0))
       {pp <- pp + 1}
    # pn   
    else if (vec[i] >= 0 & vec[i+1] < 0)
       {pn <- pn + 1}
    # np   
    else if (vec[i] < 0 & vec[i+1] >= 0)
       {np <- np + 1}
    # nn   
    else if (vec[i] < 0 & vec[i+1] < 0)
       {nn <- nn + 1}
    else 
         {broken <- broken + 1}
  }

  return(cbind(i, pp, pn, np, nn))
}
