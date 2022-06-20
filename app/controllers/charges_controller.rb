class ChargesController < ApplicationController
  before_action :fetch_item
  before_action :fetch_item_charge, only: [:show, :edit, :update, :destroy]

  def new
    @item_charge = @item.item_charges.build
  end

  def create
    @item_charge = @item.item_charges.build(charge_params)
    if @item_charge.save
      flash[:notice] = "Item charge save successfully"
      redirect_to item_path(@item)
    else
      flash[:alert] = @item_charge.errors.full_messages.join(', ')
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @item_charge.update(charge_params)
      flash[:notice] = "Item charge updated successfully"
      redirect_to item_path(@item)
    else
      flash[:alert] = @item_charge.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    if @item_charge.destroy
      flash[:notice] = "Item deleted successfully"
    else
      flash[:alert] = "Item not deleted"
    end
    item_charges_path(item_id: @item)
  end

  private

  def charge_params
    params.permit(:name, :amount)
  end

  def fetch_item
    @item = Item.find_by_id(params[:item_id])
    flash[:alert]= "Item not found" and redirect_to root_path and return if @item.blank?
  end

  def fetch_item_charge
    @item_charge = @item.item_charges.find_by_id(params[:id])
    flash[:alert]= "Item charge not found" and redirect_to root_path and return if @item_charge.blank?
  end
end
