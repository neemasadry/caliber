class TopsController < ApplicationController
  before_action :set_top, only: [:show, :edit, :update, :destroy]

  # GET /tops
  def index
    @pagy, @tops = pagy(Top.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @tops.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @tops.load
  end

  # GET /tops/1
  def show
  end

  # GET /tops/new
  def new
    @top = Top.new
  end

  # GET /tops/1/edit
  def edit
  end

  # POST /tops
  def create
    @top = Top.new(top_params)

    if @top.save
      redirect_to @top, notice: "Top was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /tops/1
  def update
    if @top.update(top_params)
      redirect_to @top, notice: "Top was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /tops/1
  def destroy
    @top.destroy
    redirect_to tops_url, notice: "Top was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_top
    @top = Top.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def top_params
    params.require(:top).permit(:user_id, :brand_id, :name, :product_image_data, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end
end
