#
# find crossing points (h = 0) 
#
crossing <- function(filename) {


	diffs <- diff(filename)
	zeros <- rep(1, length(filename) - 1)

	x1 <- diff(filename)
	x2 <- zeros[1:length(filename) - 1]

	above <- x1 > x2

	# Points always intersect when above=TRUE, then FALSE or reverse
	intersect.points <- which(diff(above) != 0)

	# Find the intersection for each segment.
	x.points <- intersect.points + ((x2[intersect.points] - x1[intersect.points]) / (x1.slopes-x2.slopes))
	y.points <- x1[intersect.points] + (x1.slopes*(x.points-intersect.points))

	# Joint points
	joint.points <- which(x1 == x2)
	x.points <- c(x.points, joint.points)
	y.points <- c(y.points, x1[joint.points])

	# Plot points
	plot(x1,type='l')
	lines(x2,type='l',col='red')
	points(x.points,y.points,col='blue')

	# Segment overlap
	start.segment <- joint.points[-1][diff(joint.points) == 1] - 1
	for (i in start.segment) lines(x = c(i, i+1), y = x1[c(i, i+1)], col = 'blue')
}





# Find the slopes for each line segment.
#x1.slopes <- x1[intersect.points+1] - x1[intersect.points]
#x2.slopes <- x2[intersect.points+1] - x2[intersect.points]

# WithOscS1 <- WithOsc$S1
# WithOscT1 <- WithOsc$T1
# WithOscO1 <- WithOsc$O1