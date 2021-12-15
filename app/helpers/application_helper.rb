module ApplicationHelper

    def current_user    # ||=  it is used for memoisation to store data make operation faster
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end     # it gives current user who is logged in

    def logged_in?  # !!  it will convert cuerrent_user into boolean
        !!current_user
    end
end 
