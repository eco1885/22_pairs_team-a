class PairsController < ApplicationController

  def index
    # @users = current_user.comings
    @users = User.page(params[:page]).per(8)
    @relationship = Relationship.new
  end
  def messages_index

  end

  def search_one
    @users = User.page(params[:page]).per(1)
    if Foot.exists?(user_id: current_user.id, visitor_id: @users[0].id)
      @foot = Foot.where(user_id: current_user.id, visitor_id: @users[0].id)
      @foot.update(user_id: current_user.id+1, visitor_id: @users[0].id)
      @foot.update(user_id: current_user.id, visitor_id: @users[0].id)
    else
      @foot = Foot.new(user_id: current_user.id, visitor_id: @users[0].id)
      @foot.save
    end
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

  def create_foot
    if Foot.exists?(user_id: current_user.id, visitor_id: params[:id])
      @foot = Foot.where(user_id: current_user.id, visitor_id: params[:id])
      @foot.update(user_id: current_user.id+1, visitor_id: params[:id])
      @foot.update(user_id: current_user.id, visitor_id: params[:id])
    else
      @foot = Foot.new(user_id: current_user.id, visitor_id: params[:id])
      @foot.save
    end
  end

end
