class FitBoxesController < ApplicationController

  load_and_authorize_resource except: [:show]
  # skip_authorize_resource :only => [:show]
  before_action :set_fit_box, only: [:edit, :update, :destroy]

  # def index
  #   @fit_boxes = FitBox.all
  # end

  def show
    @fit_box = FitBox.friendly.find(params[:id])
    authorize! :show, FitBox unless @fit_box.slug == params[:id]
  end

  def new
    @fit_box = FitBox.new
  end

  def edit
  end

  def accept
    fit_box = FitBox.friendly.find(params[:fit_box_id])
    fit_box.status = 3
    fit_box.save
    redirect_to :back
  end

  def reject
    fit_box = FitBox.friendly.find(params[:fit_box_id])
    fit_box.status = 4
    fit_box.save
    redirect_to :back
  end

  def return
    fit_box = FitBox.friendly.find(params[:fit_box_id])
    fit_box.status = 2
    fit_box.save
    redirect_to :back
  end

  def return_back
    fit_box = FitBox.friendly.find(params[:fit_box_id])
    fit_box.status = 0
    fit_box.save
    redirect_to :back
  end
  
  def remove_item_from_box
    box = FitBox.friendly.find(params[:fit_box_id])
    box.items.delete( Item.find(params[:item_id]) )
    redirect_to :back
  end
  
  def add_item_to_box
    if params
      box = FitBox.friendly.find(params[:fit_box_id])
      puts params[:items]
      box.items << Item.where(id: params[:items])
      redirect_to :back
    end
  end

  def create
    @fit_box = FitBox.new(fit_box_params)

    respond_to do |format|
      if @fit_box.save
        format.html { redirect_to :back, notice: 'Fit box was successfully created.' }
        format.json { render :show, status: :created, location: @fit_box }
      else
        format.html { render :new }
        format.json { render json: @fit_box.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fit_box.update(fit_box_params)
        format.html { redirect_to :back, notice: 'Fit box was successfully updated.' }
        format.json { render :show, status: :ok, location: @fit_box }
      else
        format.html { render :edit }
        format.json { render json: @fit_box.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fit_box.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Fit box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_fit_box
      @fit_box = FitBox.friendly.find(params[:id])
    end

    def fit_box_params
      params.require(:fit_box).permit(:name, :description, :manager_id, :client_id)
    end
end
