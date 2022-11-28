class AnniversariesController < ApplicationController
  require 'date'

  before_action :authenticate_user!, except: [:index, :show]
  before_action :all_item, only: [:index, :all]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def all
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

  def edit
  end

  def update
    if @anniversary.update(anniversary_params)
      redirect_to anniversary_path(@anniversary.id)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @anniversary.comments.includes(:user).order("created_at DESC")

    # @after_100day = @anniversary.created_at.next_day(2)
    # @today = Time.current 
    # @countdown = (@after_100day - @today).to_i

    # @countdown_sec = (@after_100day - @today).to_i
    # @countdown_min = (@after_100day - @today).to_i / 60
    # @countdown_hour = (@after_100day - @today).to_i / 60 / 60 % 24
    # @countdown_day = (@after_100day - @today).to_i / 60 / 60 / 24
  end

  def destroy
    @anniversary.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def anniversary_params
    params.require(:anniversary).permit(:image, :anniversary_name, :anniversary_date, :anniversary_description, :category_id, :who_anniversary).merge(user_id: current_user.id)
  end

  def all_item
    @anniversaries = Anniversary.includes(:user).order("created_at DESC")
  end

  def set_item
    @anniversary = Anniversary.find(params[:id])
  end
end
