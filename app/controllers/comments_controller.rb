class CommentsController < ApplicationController
before_action :find_commentable, only: :create

    def create
        # @article = Article.find(params[:article_id])
        @comment = @commentable.comments.new comment_params
        # @commentable.comments.build(comment_params)
        @comment.save
        redirect_to article_path(@article)
    end


    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
     
    private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
    
    def find_commentable
        if params[:comment_id]
            @commentable = Comment.find_by_id(params[:comment_id]) 
        elsif params[:article_id]
            @commentable = Article.find_by_id(params[:article_id])
        end
    end
end
