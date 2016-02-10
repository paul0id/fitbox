class FitBoxesController < ApplicationController
  before_action :set_fit_box, only: [:show, :edit, :update, :destroy]

  # GET /fit_boxes
  # GET /fit_boxes.json
  def index
    @fit_boxes = FitBox.all
  end

  # GET /fit_boxes/1
  # GET /fit_boxes/1.json
  def show
  end

  # GET /fit_boxes/new
  def new
    @fit_box = FitBox.new
  end

  # GET /fit_boxes/1/edit
  def edit
  end

  # POST /fit_boxes
  # POST /fit_boxes.json
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

  # PATCH/PUT /fit_boxes/1
  # PATCH/PUT /fit_boxes/1.json
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

  # DELETE /fit_boxes/1
  # DELETE /fit_boxes/1.json
  def destroy
    @fit_box.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Fit box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fit_box
      @fit_box = FitBox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fit_box_params
      params.require(:fit_box).permit(:name, :description, :manager_id, :client_id)
    end
end
