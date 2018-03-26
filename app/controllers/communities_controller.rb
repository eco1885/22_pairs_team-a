class CommunitiesController < ApplicationController
  # before_action :authenticate_user!, only: :search

  def index
    @communities = Community.page(params[:page]).order("created_at DESC").per(5)
    # @communities = Community.order("created_at DESC").limit(100) ページネイト前
    # @products = Product.order('id ASC').limit(20)
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if params[:back]
      render :new
    elsif
      @community.image.retrieve_from_cache! params[:cache][:image]
      @community.save
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
    params.require(:community).permit(:community_name, :category, :image)
  end
end
