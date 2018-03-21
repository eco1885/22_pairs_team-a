class PairsController < ApplicationController

  def index
    @usersPage = User.page(params[:page]).per(1)
    @users = User.all
    @relationship = Relationship.new
  end
  def messages_index

  end

  def search_one
  end

  def myprofile
  end

  def from_partner

  end

  def visitor_list
  end

  def visitor_setting
  end
end
