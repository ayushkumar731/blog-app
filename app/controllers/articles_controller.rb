class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def new
        if user_signed_in?
            @article = Article.new
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
        def article_params
            params.require(:article).permit(:title, :text, :image, :author, :readingtime, :date)
        end
end
