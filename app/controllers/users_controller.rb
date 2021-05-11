class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @articles = current_user.articles
  end
end
