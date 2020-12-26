class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new # needed to instantiate the form_for
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to shop_path(@shop)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    # no need for app/views/shops/destroy.html.erb
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :city, :post_code, :country, :phone_number)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end