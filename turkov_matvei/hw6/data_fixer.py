COMMENTS=[]
with open("entertainment_movies.csv",'r') as file:
	for line in file:
		line = line.split(',')
		if (line[2]!=''):
			COMMENTS.append(line[2])
		else:
			pass

# print(COMMENTS)