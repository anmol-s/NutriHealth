from django.http import HttpResponse
from django.shortcuts import render
from .models import Account
import requests
import os
import psycopg2

DATABASE_URL = 'postgres://yywcjcdlqiyalw:d5e3519c63a873f226094da1ac4d7af5456d03c8471fedb75d88503ee60193f3@ec2-54-225-190-241.compute-1.amazonaws.com:5432/db7tbrbrrjbeqm'
# 'accounts' table: user_id (integer), username (varchar(50)), password (varchar(50)), email (varchar(255))
# test users: [(0, 'test', 'test', 'test@email.com'), (1, 'a', 'a', 'a@email.com')]

conn = psycopg2.connect(DATABASE_URL, sslmode='require')
cur = conn.cursor()

def index(request):
    cur.execute('SELECT * from accounts;') #to send query to database
    text = cur.fetchall() #to get results from query
    return HttpResponse('<pre>' + str(text) + '</pre>') #returning httpresponse for heroku app, need to change for whatever xcode requires
    
def db(request):
    account = Account()
    account.save()
    accounts = Account.objects.all()
    
    return render(request, "db.html", {"accounts":accounts})