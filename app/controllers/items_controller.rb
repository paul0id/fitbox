class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Item was successfully destroyed.' }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :kind, :upc, :color, :size, :picture)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
