class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :anniversary_params, only: [:create, :destroy]


  def create
    Like.create(user_id: current_user.id, anniversary_id: @anniversary.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, anniversary_id: @anniversary.id)
    like.destroy
  end

  private
  def anniversary_params
    @anniversary = Anniversary.find(params[:anniversary_id])
  end

end