class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :load_id, :prefecture_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end

def set_item
  @item = Item.find(params[:id])
end