class FragrancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_fragrance, only: [:show, :edit, :update, :destroy]

  # GET /fragrances
  def index
    @pagy, @fragrances = pagy(Fragrance.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @fragrances.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @fragrances.load
  end

  # GET /fragrances/1
  def show
  end

  # GET /fragrances/new
  def new
    @fragrance = Fragrance.new
  end

  # GET /fragrances/1/edit
  def edit
  end

  # POST /fragrances
  def create
    @fragrance = Fragrance.new(fragrance_params)

    if @fragrance.save
      redirect_to @fragrance, notice: "Fragrance was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /fragrances/1
  def update
    if @fragrance.update(fragrance_params)
      redirect_to @fragrance, notice: "Fragrance was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /fragrances/1
  def destroy
    @fragrance.destroy
    redirect_to fragrances_url, notice: "Fragrance was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fragrance
    @fragrance = Fragrance.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def fragrance_params
    params.require(:fragrance).permit(:user_id, :brand_id, :name, :product_image_data, :description, :retail_price, :release_date, :gender, :ingredients, :top_notes, :middle_notes, :base_notes, :accords, :product_url)
  end
end
