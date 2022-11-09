class UsersController < ApplicationController
  require 'date'


  def show
    @user = User.find(params[:id])
    @anniversaries = @user.anniversaries.order("created_at DESC")
  end

  # @after_100day = @anniversary.created_at.next_day(1)    
  # @today = Time.current 
  # @countdown_hour = (@after_100day - @today).to_i / 60 / 60 % 24
  # @countdown_day = (@after_100day - @today).to_i / 60 / 60 / 24

end
