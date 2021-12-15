# README
Contrlller method as helper method

- Moved the current_user and logged_in? authentication methods from application helper to application controller and declared them as helper methods so they can be used in views as well.

- Updated the create action in articles controller so the logged in user is associated with the article being created instead of hardcoding the user.

- Updated pages controller home action (root route) to redirect to articles index page if users are logged in.


Restricting actions from UI

- to check whether user is logged in and who the user is that logged in
- in articles listing index edit, delete option should only availabe to user who have created them

- Added logged in and current user == article user based restrictions to articles/_article.html.erb partial, articles/show.html.erb, users/index.html.erb and users/show.html.erb.

