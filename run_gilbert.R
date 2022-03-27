run_gilbert <- function(start, end, step) {

#  df <- data.frame(LineNo=as.integer(), PP=as.integer(), NP=as.integer(), PN=as.integer(), NN=as.integer(),  stringsAsFactors=FALSE)


  for (i in seq(start, end, step)) {
    print(gilbert(diffs_signs, i, i+z))
    #print(df[i])
  }

  #print(data)
  
#return(gilbert_data)
}