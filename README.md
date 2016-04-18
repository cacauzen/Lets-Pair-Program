# Let's Pair Program

A pair-programming scheduling app for [Firehose Project](http://thefirehoseproject.com) students.


## Contributors

* Ken Mazaika
* Robert Sapunarich
* Aubrette Reid
* Risse Rigdon
* Diane Van Etten
* Erica Roy
* Claudia Almeida
* Natalie Holton
* Amanda Mark


## Developer Notes
If you're using Vagrant for your development environment start the server by running rails s -b 0.0.0.0 instead of rails server.

[ ![Codeship Status for FirehoseCommunity/Lets-Pair-Program](https://codeship.com/projects/4e7b2d80-cf85-0133-c208-7ebf8e5f4104/status?branch=master)](https://codeship.com/projects/141277)

[Live on Heroku](http://fhp-lets-pair-program.herokuapp.com)

## To use custom Rake tasks:

* To LIST custom rake tasks run "rake -T" and these rake tasks will be at the end of the list alphabetically with usage in the description
* "rake users:admin" without params will add a default "admin@fhpletspairtest.net" with password "pairingisawesome"
* "rake users:admin[youremail,password]" NO SPACES because rake is quirky, will add an explicit admin user with the specified email and password. There is no email format validation here, it's just for seeding the database
* "rake users:user" without params will add a default "user@fhpletspairtest.net" with password "pairingisawesome"
* "rake users:user[email,password]" will add the explicit user
* Can pass just an email to have password default to "pairingisawesome"
* "rake users:promote[email]" to promote user to admin
* "rake users:demote[email]" to remove admin authority from specified user
