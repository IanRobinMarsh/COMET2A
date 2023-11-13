data -> in Matlab
read ->	data.table
butter


res(
	process(
		data + filter 
			      butter(
					read(
						data))))



plot(
	butter(
		read(
			data
				)))
