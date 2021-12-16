# README

Restricting action at controller level
Restrict at articles controller
- Added require user method in application controller.

- Added require same user private method in articles controller.

- Used the two methods defined above as before_action methods in a few actions to restrict activities in the articles controller.

REstrict at users controller


DELETE User
- with the deletion of user it's associated articles needs to be deleted
for that in user model
class User < ApplicationRecord 
    has_many :articles, dependent: :destroy 
end 

