class SuitsController < ApplicationController
  before_action :set_suit, only: [:show, :edit, :update, :destroy]

  # GET /suits
  def index
    @pagy, @suits = pagy(Suit.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @suits.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @suits.load
  end

  # GET /suits/1
  def show
  end

  # GET /suits/new
  def new
    @suit = Suit.new
  end

  # GET /suits/1/edit
  def edit
  end

  # POST /suits
  def create
    @suit = Suit.new(suit_params)

    if @suit.save
      redirect_to @suit, notice: "Suit was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /suits/1
  def update
    if @suit.update(suit_params)
      redirect_to @suit, notice: "Suit was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /suits/1
  def destroy
    @suit.destroy
    redirect_to suits_url, notice: "Suit was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_suit
    @suit = Suit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def suit_params
    params.require(:suit).permit(:user_id, :account_id, :brand_id, :top_id, :bottom_id, :name, :description, :retail_price, :gender, :materials, :primary_color, :secondary_color, :product_url, :jacket_breasted_style, :jacket_number_of_buttons, :jacket_lapel_style, :jacket_pocket_style, :jacket_ticket_pocket, :jacket_vents_style, :jacket_sleeve_buttons, :trouser_waistband_style, :trouser_pleats, :trouser_cuff)
  end
end
