class DetailsController < ApplicationController
def show
    @usersPage = User.page(params[:page]).per(1)
    @users = User.all
    @relationship = Relationship.new
  end

  def new
    # @user = User.find(params[:product_id])
    @residence =  Residence.new
  end

  def create
   @residence =  Residence.create(prefecture: residence_params[:prefecture],user_id: current_user.id)
    # @residence = Residence.new
    # @residence.save
  end

private
  def residence_params
    params.require(:residence).permit(:prefecture)
  end
end
