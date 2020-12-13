# Paybo 
![PayBo Logo](logo.png)

Paybo is an all in one donation app, not only for institute, but for anyone who wants to donate for a great cause.
  - Install the app from the github repo
  - Navigate inside the app for the cause you wish
  - Donate for the cause
  - Seamless Payments with RAZORPAY APIs

# Features!
  - Upi, cards, Neft, all payment methods supported, Cheers to Razorpay!
  - Beautiful Admin Dashboard to see donation statistics
  - Add event option to Allow creating Events (eg. Orphanage drives)

##### You can also:
  - Collect allowances or money for In-house Events.
  - Get informatin about current events going.
  - Receive mail after donation is saved in database.

## Running
Grab the latest release from git repo.
The Admin dashboard can be found [here](https://payboo.herokuapp.com/admin).

# Why PayBo
> Our institute needed a payment solution for donation as well as fund collection for Student Body Clubs. There was also a need for a portal where anyone can donate money without worries about misuse. Through Paybo, we can reach everyone, including Alumnis, that wish to donate to their college.
Paybo is also meant to provide a fund for emergencies.

### Tech Stack
Paybo was made with love using various technologies combined

* [Flutter](flutter.dev) - Cross platform apps fast & easy!
* [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) - Online NoSQL based storage solution
* [Heroku](https://dashboard.heroku.com/) - Platform as a Service to run any kind of app
* [Python](https://www.python.org/) - Interpreted Programming Language
* [Flask](https://flask.palletsprojects.com/en/1.1.x/) - A micro web framework written in Python.
* [RazorPay APIs](https://razorpay.com/) - Payment Gateway
* [HTML5](https://html5.org/) - duh

### Dev Installation 
#### Server
Start a local Mongo Session and update the MONGO_URL in database/dp.py file.
Install the dependencies and devDependencies and start the server.
```sh
$ cd PayBo/Server
$ pip3 install requirements.txt
$ export FLASK_APP=app.py
$ export FLASK_ENV=development
$ flask run
```
For production environments...
```sh
$ export FLASK_ENV=production
$ flask run
```
> To create the necessary document structure in database, go to HOSTED_URL/init for the first time you run the server

#### App
Install flutter and Android SDK
```sh
$ cd App
$ flutter pub get
$ flutter run
```
This will start the app in debug mode on connecte device.

Made with ❤️
By:- Mohit Raj Munot
     Ayush Agarwal
     Harsh Chaurasia
