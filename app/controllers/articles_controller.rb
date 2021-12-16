class ArticlesController < ApplicationController 
    # all before action must follow order to operate
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index] # requires useer for certain actions
    before_action :require_same_user, only: [:edit, :update, :destroy] # to check current user wrt article user for edit 
    # it is helper which will run set_aricle method before we do any action mentioned in only
    # if only is not used it will apply to every actions which we don't want
    def show
        # byebug
        # @article = Article.find(params[:id])   # @article -> instance variable to access in webpage  
    end 

    def index 
        @articles = Article.all             # @articles -> all articles named according to convention
    end 

    def new
        @article = Article.new
    end 

    def edit 
        # @article = Article.find(params[:id])  # ii will find article of specific index and shows to page
        @article.user = User.first 
    end

    def create 
        @article = Article.new(article_params)  # article_pramas -> private method to reduce redundancy
        @article.user = current_user  # current_user is a helper method which gives current signed in user   
        if @article.save 
            flash[:notice] = "Article is saved successfully"
            redirect_to @article  # goes to  articles/:id - it is another way of returning to route 
        else  
            render 'new'   # if article is not saved it will redirect to articles/new
        end
    end
    
    def update 
        # byebug
        # @article = Article.find(params[:id])
        # if @article.update(params.require(:article).permit(:title, :description))
        if @article.update(article_params)  
            flash[:notice] = "Article is updated successfully"
            redirect_to @article 
        else 
            render 'edit'
        end
    end 

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path   # it will go to index page  /articles
    end 

    # to avoid redunduncy of code we will define some code that can be used again
    private   # it means everyting define below is private attribute and can call only in this class
    def set_article  # this method will find article and set it as instance variable    
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if cuerrent_user != @article.user 
            flash[:alert] = "You can only edit or delete your own aticle"
            redirect_to @article 
        end
    end 
    # private doesn't need end block
end 