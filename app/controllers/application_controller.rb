class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    # saving current_user method to application controller so that it would available to every controller(but not view)
    # but we also require it as helper method for views, hence we mention it as helper_method(same for logged_in?)
    # where as require_user only needs for controller not view hence we do not mentioned it in helper_method
    def current_user    # ||=  it is used for memoisation to store recent data make operation faster
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end     # it gives current user who is logged in

    def logged_in?  # !!  it will convert cuerrent_user into boolean
        !!current_user
    end

    def require_user
        if !logged_in?  # if not logged in
          flash[:alert] = "You must be logged in to perform that action"
          redirect_to login_path
        end
    end
    
end
