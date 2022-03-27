
plotme <- function() {

  print(getwd())
#  require(data.table)
  d <- fread("Data/gilbert_data.txt")

pdf("plot_gilbert.pdf")

#  command <- paste0(type, "(\"plot_gilbert.", type, "\")")
#  print(command)
#  eval(parse(command))
#  eval(quote(command))


  plot(d$i, d$nn, type='l', col='green', lwd=2, ylab="No. transistions", xlab="Sequence No.", main="Number of sign changes per time slot (500)", ylim=c(0,100))
  lines(d$i, d$pp, type='o', col='red', lwd=3)
  lines(d$i, d$pn, type='o', col='blue', lwd=3)
  lines(d$i, d$np, type='o', col='black', lwd=3)

  legend(1, 95, legend=c("Neg-Neg", "Pos-Pos", "Pos-Neg", "Neg-Pos"), col=c("green", "red", "blue", "black"), lty=1:2, cex=0.8)
dev.off()

}