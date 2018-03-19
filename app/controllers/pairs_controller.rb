class PairsController < ApplicationController

  def index
    @usersPage = User.page(params[:page]).per(1)
    @users = User.all
    @relationship = Relationship.new
  end

end
