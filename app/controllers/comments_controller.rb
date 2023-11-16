class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article&.comments.create(permitted_params)
        redirect_to @article
    end
    private
    def permitted_params
        params.require(:comment).permit(:commentor, :body)
    end
end