from django.http import HttpResponse
from django.shortcuts import render
from .models import Greeting
import requests
import os
import psycopg2

DATABASE_URL = 'postgres://mdiwjmmqkstylu:6b6ace56f18465763c247bd522e1b15c4be35495fdb0f12e5241b05e201bd735@ec2-100-24-139-146.compute-1.amazonaws.com:5432/d3ojhmtu9jae3f'
#Sample database with database 'users'
#Two values 'name' and 'password'
#Two values currently in it 'John Smith' with 'password' and 'Mary Sue' with 'password2'

conn = psycopg2.connect(DATABASE_URL, sslmode='require')
cur = conn.cursor()

def index(request):
    cur.execute('SELECT * from users;') #to send query to database
    text = cur.fetchall(); #to get results from query
    return HttpResponse('<pre>' + str(text) + '</pre>') #returning httpresponse for heroku app, need to change for whatever xcode requires
    
def db(request):
    greeting = Greeting()
    greeting.save()
    greetings = Greeting.objects.all()
    
    return render(request, "db.html", {"greetings":greetings})
