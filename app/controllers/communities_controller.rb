class CommunitiesController < ApplicationController
  # before_action :set_user
  # before_action :authenticate_user!, only: :search

  def index
    # 作成されているコミュニティ全て
    @communities_all = Community.page(params[:page]).order("created_at DESC").per(5)
    # カレントユーザーが持っている（作成）したコミュニティ全て
    @communities = current_user.communities.page(params[:page]).order("created_at DESC").per(5)

    # パラメータとして名前か性別を受け取っている場合は絞って検索する
    if params[:community_name].present?
    # @communities_result = @communities_all.get_by_community_name params[:community_name]
    @communities = @communities_all.get_by_community_name params[:community_name]
    end
    if params[:category].present?
    # @communities_result = @communities_all.get_by_category params[:category]
    @communities = @communities_all.get_by_category params[:category]
    end

  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.image.retrieve_from_cache! params[:cache][:image]
    if params[:back]
      render :new
    elsif @community.save
      @community.users << current_user
      # render :index                :値を渡さず、ビューのみを持ってくる
      # redirect_to communities_path :URL自体にアクセスする
      redirect_to community_complete_path
    else
      render :new
    end
  end

  def confirm
    @community = Community.new(community_params)
    render :new if @community.invalid?
  end

  def complete
  end

  def show
    @community = Community.find(params[:id])
  end

  def search
    # @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  private

  def community_params
    params.require(:community).permit(:community_name, :category, :image, { :user_ids => [] })
    # params.require(:community).permit(:community_name, :category, :image).merge(user_id: current_user.id)

  # 参考
  # def group_params
  #   params.require(:group).permit(:group_name, { :user_ids => [] })
  # end
  end

end
