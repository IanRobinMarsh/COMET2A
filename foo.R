require(data.table)

myfun <-function(filename1, filename2){
 d1 <- fread(filename1)
  print(head(d1))

 d2 <- fread(filename2)
 print(head(d2))

}
