class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  # GET /guides
  def index
    @pagy, @guides = pagy(Guide.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @guides.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @guides.load
  end

  # GET /guides/1
  def show
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides
  def create
    @guide = Guide.new(guide_params)

    if @guide.save
      redirect_to @guide, notice: "Guide was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /guides/1
  def update
    if @guide.update(guide_params)
      redirect_to @guide, notice: "Guide was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /guides/1
  def destroy
    @guide.destroy
    redirect_to guides_url, notice: "Guide was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_guide
    @guide = Guide.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def guide_params
    params.require(:guide).permit(:user_id, :account_id, :brand_id, :title, :body, :category, :subcategory_one, :subcategory_two)
  end
end
