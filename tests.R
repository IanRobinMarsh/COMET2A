
#
#	Run sequence through implemented tests 
#
for (thisTest in OscTests) {
	print(paste("This test", thisTest))
#   	(inSeq, outSeq) <- Mytest(thisTest)

   	# Check tests
   	if ((thisSeq == "with_osc") && (between(x=num, left=1, right=20))) {
   		print("Correct: Guess had oscillations and was between 1-20 (in range)")
   		correct <- correct + 1
   	} else if ((thisSeq == "with_osc") && (between(x=num, left=21, right=27))) {
 		print("Incorrect: Guess had oscillations and was between 21-27 (outside range)")
 		incorrect <- incorrect + 1
   	} else if ((thisSeq == "without_osc") && (between(x=num, left=21, right=27))) {
   		print("Correct: Guess had no oscillations, was between 21-27 (in range)")
 		correct <- correct + 1
  	} else if ((thisSeq == "without_osc") && (between(x=num, left=1, right=20))) {
  		print("Incorrect: Guess had no oscillations and was between 1-20 (outside range)")
 		incorrect <- incorrect + 1
  	} else  {
  		print("something broken")}
}

print("Totals (correct, incorrect)", correct, incorrect)
