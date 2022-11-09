class ListsController < ApplicationController
  require 'date'

  def index
    @user = User.find(params[:user_id])
    @anniversaries = @user.anniversaries
    @today = Date.current
    # @latest_anniversary =  @user.anniversaries.order(created_at: :desc).limit(1) . 対象ユーザーの全てのanniversaryかｒ麻維新の1件を取得して@latest_anniversaryに代入
  end
end