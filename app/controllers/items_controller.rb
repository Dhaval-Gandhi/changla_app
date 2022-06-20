class ItemsController < ApplicationController
  before_action :fetch_item, only: [:show, :edit, :update, :destroy]

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
      flash[:notice] = "Item save successfully"
      redirect_to items_path
    else
      flash[:alert] = @item.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @item_charges = @item.item_charges
  end

  def edit

  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Item updated successfully"
      redirect_to items_path
    else
      flash[:alert] = @item.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "Item deleted successfully"
    else
      flash[:alert] = "Item not deleted"
    end
    redirect_to items_path
  end

  private

  def item_params
    params.permit(:code, :name, :thick, :item_id, :item_af, :weight, :unit, :manufactured_by, :copper_price, :casting_labor, :burning_per, :profit_margin, :net_weight, :require_rod)
  end

  def fetch_item
    @item = Item.find_by_id(params[:id])
    flash[:alert]= "Item not found" and redirect_to root_path and return if @item.blank?
  end
end
