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
    save_foot(@users[0].id)
  end

  def myprofile
  end

  def from_partner

  end

  def visitor_list
    @foot = current_user.comings
  end

  def visitor_list_zero
  end

  def visitor_setting
  end

  def privacy_setting
    @user = User.find(current_user)
  end

  def hide
  end

  def block
  end

  def parts
  end

  def create_foot
    save_foot(params[:id])
  end

  private

    def save_foot(visitor_id)
      if Foot.exists?(user_id: current_user.id, visitor_id: visitor_id)
        @foot = Foot.find_by(user_id: current_user.id, visitor_id: visitor_id)
        @foot.touch
        @foot.save
      else
        @foot = Foot.new(user_id: current_user.id, visitor_id: visitor_id)
        @foot.save
      end
    end

end
