class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)
  end

  def edit
    unless @shop.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @shop.update(shop_params)
    if @shop.update(shop_params)
      redirect_to @shop
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    if @shop.destroy
      redirect_to @shop
    end
  end

  def search
    @shops = Shop.search(params[:keyword])
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :bland, :shop_detail, :image).merge(user_id: current_user.id)
  end

  def set_item
    @shop = Shop.find(params[:id])
  end

end
