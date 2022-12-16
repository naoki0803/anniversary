class ListsController < ApplicationController
  require 'date'

  def index
    @user = User.find(params[:user_id])
    @anniversaries = @user.anniversaries.order("anniversary_date ASC")
    @today = Date.current
    @anniversary_lists = [100,200,300,400,500,1000,3000,5000]



  end
end