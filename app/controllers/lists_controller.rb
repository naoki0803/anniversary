class ListsController < ApplicationController
  require 'date'

  def index
    @user = User.find(params[:user_id])
    @anniversaries = @user.anniversaries.order("anniversary_date ASC")
    @today = Date.current
    @anniversary_lists = [100,200,300,400,500,600,700,777,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,3000,5000,7777,10000,15000,20000,25000,30000,35000]

  end
end