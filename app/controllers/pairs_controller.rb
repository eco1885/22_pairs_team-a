class PairsController < ApplicationController

  def index
    @users = User.page(params[:page]).per(8)
    @relationship = Relationship.new
  end





  def messages_index
  end

  def search_one
    @users = User.page(params[:page]).per(1)
  end

  def myprofile
  end

  def from_partner
  end

  def visitor_list
  end

  def visitor_setting
  end

  def privacy_setting
  end

  def hide
  end

  def block
  end
end
