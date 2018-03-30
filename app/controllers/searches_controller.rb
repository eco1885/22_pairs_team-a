class SearchesController < ApplicationController
   DISPLAYED_USER = 16


  #条件検索用にgem "ransack"を使用しています
  def search_index
    @q = User.ransack(params[:q])
    @residence = Residence.all
    @alcohol = Alcohol.all
    @smoke = Smoke.all
    @occupancy = Occupancy.all
    @school = School.all
  end

  def search_result
    # @selected = params[:selected_value].present? ? params[:selected_value] : 16
    @q = User.search(search_params)
    # if current_user.gender == "male"
    @users = @q.result(distinct: true).page(params[:page]).per(DISPLAYED_USER)
    # else
      # @users = @q.result(distinct: true).page(params[:page]).per(@selected)
    # end
     @q = User.search(search_params)
     @users = @q.result(distinct: true).page(params[:page]).per(DISPLAYED_USER)
  end

  private
  def search_params
    params.require(:q).permit(:residence_id_eq, :smoke_id_eq, :occupancy_id_eq, alcohol_id_in:[], school_id_in:[])
  end
end
