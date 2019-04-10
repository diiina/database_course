import random
import mysql.connector

from random import randrange
from datetime import timedelta, datetime

def random_date(start, end):
    """
    This function will return a random datetime between two datetime 
    objects.
    """
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = randrange(int_delta)
    return start + timedelta(seconds=random_second)

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="technotrack",
  database="tatoo"
)

mycursor = mydb.cursor()

sql = "INSERT INTO prices (Complexity, Size, Price, IsColor) VALUES (%s, %s, %s, %s)"
val =  [
    ("easy", "small", 1000, False),
    ("normal", "small", 2000, False),
    ("hard", "small", 3000, False),
    ("easy", "normal", 4000, False),
    ("normal", "normal", 5000, False),
    ("hard", "normal", 6000, False),
    ("easy", "big", 7000, False),
    ("normal", "big", 8000, False),
    ("hard", "big", 9000, False),
    ("easy", "small", 1500, True),
    ("normal", "small", 2500, True),
    ("hard", "small", 3500, True),
    ("easy", "normal", 4500, True),
    ("normal", "normal", 5500, True),
    ("hard", "normal", 6500, True),
    ("easy", "big", 7500, True),
    ("normal", "big", 8500, True),
    ("hard", "big", 9500, True)
]
mycursor.executemany(sql, val)

mydb.commit()

print("prices", mycursor.rowcount, "record inserted.")

sql = "INSERT INTO clients (Name, Phone, E_mail, BirthdayDay) VALUES (%s, %s, %s, %s)"

f1 = open('names.txt')
f2 = open('phone.txt')
names = []
phones = []
val = []
for line in f1:
    names.append(line)
for line in f2:
    phones.append(line)

d1 = datetime.strptime('1/1/1984 1:30 PM', '%m/%d/%Y %I:%M %p')
d2 = datetime.strptime('1/1/2001 4:50 AM', '%m/%d/%Y %I:%M %p')

for i in range(0, 100, 1):
    e_mail = names[i].replace(" ", "").replace('\n', '') + "@mail.ru"
    client = (names[i].replace('\n', ''), phones[i], e_mail, random_date(d1, d2))
    val.append(client)

mycursor.executemany(sql, val)

mydb.commit()

print("clients", mycursor.rowcount, "record inserted.")

sql = "INSERT INTO employees (Name, Phone, E_mail, Position) VALUES (%s, %s, %s, %s)"

f1 = open('names2.txt')
f2 = open('phone2.txt')
names = []
phones = []
val = []
for line in f1:
    names.append(line)
for line in f2:
    phones.append(line)

for i in range(0, 100, 1):
    e_mail = names[i].replace(" ", "").replace('\n', '') + "@mail.ru"
    if (i%2):
        position = "Master"
    else:
        position= "Intern"
    client = (names[i].replace('\n', ''), phones[i], e_mail, position)
    val.append(client)

mycursor.executemany(sql, val)

mydb.commit()
print("employees", mycursor.rowcount, "record inserted.")

sql = "INSERT INTO tatoos (IdEmployee, Name, IdPrice) VALUES (%s, %s, %s)"
val = []
for i in range(0, 500, 1):
    tattoo = (random.randint(0,100), "Tattoo" + str(i), random.randint(0,18))
    val.append(tattoo)

mycursor.executemany(sql, val)

mydb.commit()
print("tatoos", mycursor.rowcount, "record inserted.")

val = []
sql = "INSERT INTO orders (IdClient, IdTatoo) VALUES (%s, %s)"

for i in range(0, 300, 1):
    order = (random.randint(0,100), random.randint(0,500))
    val.append(order)

mycursor.executemany(sql, val)

mydb.commit()
print("orders", mycursor.rowcount, "record inserted.")

val = []
sql = "INSERT INTO visits (IdOrder, DateVisit) VALUES (%s, %s)"

d1 = datetime.strptime('1/1/2018 1:30 PM', '%m/%d/%Y %I:%M %p')
d2 = datetime.strptime('1/1/2020 4:50 AM', '%m/%d/%Y %I:%M %p')

for i in range(0, 550, 1):
    visit = (random.randint(0,300), random_date(d1, d2))
    val.append(visit)

mycursor.executemany(sql, val)

mydb.commit()
print("visits", mycursor.rowcount, "record inserted.")

val = []
sql = "INSERT INTO payments (DatePayement, IdOrder, Pay) VALUES (%s, %s, %s)"

d1 = datetime.strptime('1/1/2018 1:30 PM', '%m/%d/%Y %I:%M %p')
d2 = datetime.strptime('1/1/2020 4:50 AM', '%m/%d/%Y %I:%M %p')

for i in range(0, 550, 1):
    pay = (random_date(d1, d2), random.randint(0,300), random.randint(100, 1000))
    val.append(pay)

mycursor.executemany(sql, val)

mydb.commit()
print("pay", mycursor.rowcount, "record inserted.")



