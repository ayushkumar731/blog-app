class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    # def create
    #     # render plain: params[:article].inspect
    #     @article = Article.new(params[:article]).permit(:title, :text))

 
    #     @article.save
    #     redirect_to @article
    # end

    def create
        @article = Article.new(article_params)
    
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
   
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
