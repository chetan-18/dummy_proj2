class UsersController < ApplicationController 

    def new
        @user = User.new 
    end 
    # new and create action both act upon new.html.erb
    def create 
        # byebug
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to project,#{@user.username} you have succefully signed up"
            redirect_to articles_path
        else  
            render 'new'
        end 
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end
end 
