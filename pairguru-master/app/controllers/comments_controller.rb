class CommentsController < ApplicationController
  before_action :has_reviewed?
  before_action :correct_user,   only: :destroy

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(params[:comment].permit(:user, :body))
    @comment.user_id = current_user.id if current_user
    @comment.save
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  def has_reviewed?
    redirect_to movie_comments_path, notice: "You've already written a comment for this movie." if current_user.comments.exists?(movie: @movie)
  end

  private
  def comment_params
    params.require(:comment).permit(:user, :body)
  end

  def correct_user
    @movie = Movie.find(params[:movie_id])
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to movie_path(@movie) if @comment.nil?
  end
end
