class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)
  end

  def edit
    @shop = Shop.find(params[:id])
    unless @shop.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    if @shop.update(shop_params)
      redirect_to @shop
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :bland, :shop_detail, :image).merge(user_id: current_user.id)
  end
end
