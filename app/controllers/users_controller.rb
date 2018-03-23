class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @usersPage = User.page(params[:page]).per(1)
    @users = User.all
    @relationship = Relationship.new
  end

end
