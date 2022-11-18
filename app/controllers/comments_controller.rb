class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,  anniversary_id: params[:anniversary_id])
  end
end
