# README

Authentication and helper method
- Added current_user and logged_in? helper methods.

- Modified the navigation partial and utilized these methods to display links based on logged in state.

- Modified the users controller create action so users' are logged in once they sign-up.

- Added set_user method and used it as before_action for show, edit and update actions in users controller.
