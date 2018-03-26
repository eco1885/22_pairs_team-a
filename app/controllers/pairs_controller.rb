class PairsController < ApplicationController

  def index
    # @users = current_user.comings
    @users = User.page(params[:page]).per(8)
    @relationship = Relationship.new
  end
  def messages_index

  end

  def search_one
    if Foot.exists?(user_id: current_user.id, visitor_id: 3)
      @foot = Foot.where(user_id: current_user.id, visitor_id: 3)
      @foot.update(user_id: current_user.id+1, visitor_id: 3)
      @foot.update(user_id: current_user.id, visitor_id: 3)
    else
      @foot = Foot.new(user_id: current_user.id, visitor_id: 3)
      @foot.save
    end
    @users = User.page(params[:page]).per(1)
  end

  def myprofile
  end

  def from_partner

  end

  def visitor_list
    @foot = current_user.comings
  end

  def visitor_setting
  end

end
