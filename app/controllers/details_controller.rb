class DetailsController < ApplicationController
# def show  後で使う予定
#     @usersPage = User.page(params[:page]).per(1)
#     @users = User.all
#     @user = User.find(params[:id])
#     @relationship = Relationship.new
#   end

  def edit
    @user =  User.find(params[:id])
  end

  def update
   user = User.find(params[:id])
   user.update(details_params)
  end

private
  def details_params
    params.require(:user).permit(:residence_id, :alcohol_id)#Userモデルのresidence_id,alcohol_idに値を追加する
  end
end
