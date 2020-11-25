class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = Article.all
    end
    
    def show
    end

    def new
      @article = Article.new
      authorize @article
    end

    def edit
    end
  

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
          @article = Article.find_by_slug(params[:slug])
          authorize @article
        end
        def article_params
            params.require(:article).permit(:title, :text, :image, :author, :readingtime, :date, :image_url)
        end
end
