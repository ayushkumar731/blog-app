class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

    def index
      @articles = Article.all
      authorize @articles
    end
    
    def show
      @article = Article.find_by_slug(params[:slug])
    end

    def new
            @article = Article.new
            authorize @article
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
      @article = Article.new(article_params)
      @article.user = current_user
      authorize @article
      if @article.save
        redirect_to @article
      else
        render 'new'
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
