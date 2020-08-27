class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @pagy, @categories = pagy(Category.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @categories.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @categories.load
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Category was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def category_params
    params.require(:category).permit(:user_id, :account_id, :category_group_id, :name, :subcategory_count, :brands_count, :accessories_count, :bottoms_count, :cosmetics_count, :dresses_count, :fragrances_count, :jewelries_count, :shoes_count, :suits_count, :tops_count, :total_products_count, :reviews_count, :guides_count, :outfits_count, :catalogs_count)
  end
end
