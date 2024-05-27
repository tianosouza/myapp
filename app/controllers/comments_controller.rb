class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      redirect_to @article, alert: 'There was an error creating the comment.'
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: 'Comment was successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
