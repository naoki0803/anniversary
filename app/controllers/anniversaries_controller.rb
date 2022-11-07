class AnniversariesController < ApplicationController
  def index
    @anniversaries = Anniversary.all
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

  private
  def anniversary_params
    params.require(:anniversary).permit(:image, :anniversary_name, :anniversary_date, :anniversary_description, :category_id, :who_anniversary).merge(user_id: current_user.id)
  end
end
