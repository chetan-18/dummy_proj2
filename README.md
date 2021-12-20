# README

Adding Admin functionality

Permission functionality
    Based on the permissions given users can be divided into admin, moderator and regular user
admin -  has the all the permissions
moderator - moderate permission
regular user -  have only regular permission not main permission

We can add admin functionality 
1 By giving string value to admin column eg. "admin", 'moderator'
2 adding admin column which has boolean value in users table



Admin access thruough views and controller

Here, we will define functionality such that if the user logged in is admin it will show admin with username. And also admin has all view, edit and delete functioanlity of all users' articles(which was restricted to only article's user previously)

Admin able to delete other users


