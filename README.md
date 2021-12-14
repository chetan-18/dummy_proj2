# README

Login form

route for login will not be resources, because session for login won't hit database
we won't have routes for restapi, so we have to manually create the routes
1. creating routes
routs.rb
    get 'login', to: 'session#new'

2. creating session controller and actions


Create and destroy user sessions

we will log the user in or authenticate base on which user logged
we will utilize session to represent login state
with entering log in credential it is varified base on the users table information

