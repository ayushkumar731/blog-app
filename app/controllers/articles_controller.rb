class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
        authorize @articles
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def new
        if user_signed_in?
            @article = Article.new
            authorize @article
        else
            redirect_to user_session_path
        end
    end

    def edit
        @article = Article.find(params[:id])
    end
    # def create
    #     # render plain: params[:article].inspect
    #     @article = Article.new(params[:article]).permit(:title, :text))

 
    #     @article.save
    #     redirect_to @article
    # end

    def create
        if user_signed_in?
            @article = Article.new(article_params)
            @article.user = current_user
            authorize @article
    
            if @article.save
                redirect_to @article
            else
                render 'new'
            end
        else
            redirect_to user_session_path
        end
       
    end


    def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end


    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        puts params[:id]
        redirect_to articles_path
    end
    
    private
        def set_article
          @article = Article.find(params[:id])
          authorize @article
        end
        def article_params
            params.require(:article).permit(:title, :text, :image, :author, :readingtime, :date)
        end
end
