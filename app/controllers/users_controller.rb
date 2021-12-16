class UsersController < ApplicationController 
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show 
        # @user = User.find(params[:id])  # set_user 
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
        # @user = User.find(params[:id])     # this will find user based on id
    end 
    # edit and update action work on edit.html.erb
    # edit action gets the required parameters using GET
    # update action post the updated datat to edit.html.erb with POST
    def update 
        # @user = User.find(params[:id])  # set_user method used for finding user
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
            session[:user_id] = @user.id  # as soon as user is created, his session makes to him stay signin
            flash[:notice] = "Welcome to project,#{@user.username} you have successfully signed up"
            redirect_to articles_path
        else  
            render 'new'
        end 
    end
    
    def destroy
        # @user = User.find(params[:id])  # set_user private method will give this user
        @user.destroy 
        session[:user_id] = nil # nil, because session work on current_user if we destroy current_user it will through an error
        flash[:notice] = "User account and all associated articles are successfully deleted"
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user 
        @user = User.find(params[:id])
    end

    def require_same_user   # user can apply mentioned actions only on himself not on other user
        if current_user != @user 
            flash[:alert] = "You can only edit or delete your own aticle"
            redirect_to @user
        end
    end 
end 
