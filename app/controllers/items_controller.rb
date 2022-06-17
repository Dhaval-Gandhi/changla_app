class ItemsController < ApplicationController
  def index
    if params[:commit] == 'Search' && params[:q].present?
      @items = Item.where("code ilike :search OR name ilike :search", search: "%#{params[:q]}%")
      @search = params[:q].to_s
    else
      @search = ""
      @items = Item.all  
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      redirect_to new_item_path
    end
  end

  private

  def item_params
    params.permit(:code, :name, :manufactured_by)
  end
end
