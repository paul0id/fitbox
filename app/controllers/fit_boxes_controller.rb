class FitBoxesController < ApplicationController

  load_and_authorize_resource
  before_action :set_fit_box, only: [:show, :edit, :update, :destroy]

  # def index
  #   @fit_boxes = FitBox.all
  # end

  def show
  end

  def new
    @fit_box = FitBox.new
  end

  def edit
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
      @fit_box = FitBox.find(params[:id])
    end

    def fit_box_params
      params.require(:fit_box).permit(:name, :description, :manager_id, :client_id)
    end
end
