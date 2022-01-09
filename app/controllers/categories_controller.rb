class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]  # restricting new to only admin users

    def new 
        @category = Category.new
    end 

    def create          # should not create category if not admin user
        @category = Category.new(params.require(:category).permit(:name) )
        if @category.save 
            flash[:notice] = "category successfully created"
            redirect_to @category   # show page  localhost:3000/categories/id
        else 
            render 'new'           # new page   localhost:3000/categories/new
        end 
    end 

    def index 
        @categories = Category.all
    end 

    def show 
    
    end 

    private 

    def require_admin
        if !(logged_in? && current_user.admin?)  # if not logged in and current user is not admin
            flash[:alert] = "only admin logged in users  can perform this action"
            redirect_to categories_path
        end 
    end 
end