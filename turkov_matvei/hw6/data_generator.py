import random
from data_fixer import COMMENTS
from datetime import timedelta, datetime
import mysql.connector
import json

mydb = mysql.connector.connect(
   host="localhost",
   user="matt1",
   passwd="matt1",
   database="online_kino"
 )

mycursor = mydb.cursor()
def random_date(start, end):
     delta = end - start
     int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
     random_second = random.randrange(int_delta)
     return start + timedelta(seconds=random_second)
D1 = datetime.strptime('1/1/2009 1:30 PM', '%m/%d/%Y %I:%M %p')
D2 = datetime.strptime('1/1/2010 1:30 PM', '%m/%d/%Y %I:%M %p')

# Movies table insert
val = []
sql = "INSERT INTO Movies (movie_name, movie_price) VALUES (%s,%s)"
with open("kinopoisk.csv",'r') as file:
	for line in file:
		tmp_list = []
		line = line.split(';')
		movies = (line[1],random.randint(150,400))
		val.append(movies)
print(sql)
mycursor.executemany(sql, val)
mydb.commit()

#Users table insert
sql = """INSERT INTO Users (user_name) VALUES {%s}"""
with open('usernames.txt','r') as file:
	for line in file:
		if (line != '\n'):
			names = (line[:-1])
			sql = """INSERT INTO Users (user_name) VALUES (\'{}\');""".format(names)
			mycursor.execute(sql)
mydb.commit()

#Payment method table insert
sql = "INSERT INTO Payment_methods (payment_method) VALUES (\'%s\');"
payment_methods = ['Visa','MasterCard','American Express','Paypal',"Yandex Money", "Apple card"]
for element in payment_methods:
	sql = "INSERT INTO Payment_methods (payment_method) VALUES (\'{}\');".format(element)
	mycursor.execute(sql)
mydb.commit()

# #Comments table insert
val = []
sql = "INSERT INTO Comments (movie_id,user_id,comment_text,comment_date) VALUES (%s,%s,%s,%s)"
for comment in COMMENTS:
	comment_block = (random.randint(1,223),random.randint(1,200),comment,str(random_date(D1,D2)))
	val.append(comment_block)

mycursor.executemany(sql, val)
mydb.commit()

#Actors table insert
val = []
actors = []
movie_id_checker = []
sql = "INSERT INTO Actors (actor_name,actor_surname) VALUES (%s,%s)"
with open('kinopoisk.csv','r') as file :
	for line in file:
		line = line.split(';')
		if (line[-1] != ''):
			line = line[-1].split(',')[:-1]
			movie_id_checker.append(line)
			for person in line:
				if person not in actors:
					actors.append(person)
for actor in actors:
	actor = actor.split(' ')
	if (len(actor) == 2):
		actor = (actor[0],actor[1])
		val.append(actor)
	else: pass
mycursor.executemany(sql, val)
mydb.commit()

#Payments table insert
val = []
sql = "INSERT INTO Payments (payment_method_id, payment_date, movie_id, user_id) VALUES (%s,%s,%s,%s)"
for _ in range(0,10000):
	payment = (random.randint(1,6),str(random_date(D1,D2)),random.randint(1,223),random.randint(1,200))
	val.append(payment)
mycursor.executemany(sql, val)
mydb.commit()

# #Views table insert
val = []
sql = "INSERT INTO Views (view_time, user_id, moviee_id) VALUES (%s,%s,%s)"
for _ in range(0,1000):
	view = (str(random_date(D1,D2)),random.randint(1,200),random.randint(1,223))
	val.append(view)
mycursor.executemany(sql, val)
mydb.commit()



#Actors in Movies table insert
val = []
sql ="INSERT INTO Actor_in_Movie (movie_id, actor_id) VALUES (%s,%s)"
for i in range(len(movie_id_checker)):
	for actor in actors:
		if actor in movie_id_checker[i]:
			data_add = (i+1,actors.index(actor)+1)
			val.append(data_add)
		else:pass
mycursor.executemany(sql, val)
mydb.commit()
