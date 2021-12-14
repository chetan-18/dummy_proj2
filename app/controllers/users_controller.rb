class UsersController < ApplicationController 

    def show 
        @user = User.find(params[:id])
    end 

    def index 
        @users = User.all
    end 

    def new
        @user = User.new 
    end 
    # new and create action both acts upon new.html.erb
    # new action gives page new.html.erb with GET
    # create action post the new data to new.html.erb with POST 

    def edit 
        @user = User.find(params[:id])     # this will find user based on id
    end 
    # edit and update action work on edit.html.erb
    # edit action gets the required parameters using GET
    # update action post the updated datat to edit.html.erb with POST
    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to articles_path
        else 
            render 'edit'
        end 
    end 

    def create 
        # byebug
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to project,#{@user.username} you have successfully signed up"
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
