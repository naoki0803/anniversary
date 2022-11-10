class AnniversariesController < ApplicationController

  require 'date'

  def index
    @anniversaries = Anniversary.all
  end

  def all
    @anniversaries = Anniversary.includes(:user).order("created_at DESC")
    @comment = Comment.new
    # @commentいらない
  end

  def new
    @anniversary = Anniversary.new
  end

  def create
    @anniversary = Anniversary.new(anniversary_params)
    if @anniversary.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @anniversary = Anniversary.find(params[:id])
    @comment = Comment.new
    @comments = @anniversary.comments.includes(:user)

    @after_100day = @anniversary.created_at.next_day(2)
    
    @today = Time.current 

    @countdown = (@after_100day - @today).to_i

    @countdown_sec = (@after_100day - @today).to_i
    @countdown_min = (@after_100day - @today).to_i / 60
    @countdown_hour = (@after_100day - @today).to_i / 60 / 60 % 24
    @countdown_day = (@after_100day - @today).to_i / 60 / 60 / 24
  end

  private
  def anniversary_params
    params.require(:anniversary).permit(:image, :anniversary_name, :anniversary_date, :anniversary_description, :category_id, :who_anniversary).merge(user_id: current_user.id)
  end
end
