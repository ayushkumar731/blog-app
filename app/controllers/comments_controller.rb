class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_commentable, only: :create

    def create
        @comment = @commentable.comments.new comment_params
        @comment.save
        redirect_back(fallback_location: root_path)
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
        @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
        @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    end
    
end
