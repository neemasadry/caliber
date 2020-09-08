class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_body_part_group, only: [:show, :edit, :update, :destroy]
  before_action :set_body_part, only: [:show, :edit, :update, :destroy]
  before_action :set_category_group, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    # Body Part
    @pagy_body_part_groups, @body_part_groups = pagy(BodyPartGroup.sort_by_params(params[:sort], sort_direction), page_param: "body_part_group_page")
    @pagy_body_parts, @body_parts = pagy(BodyPart.sort_by_params(params[:sort], sort_direction), page_param: "body_part_page")
    # Categorization
    @pagy_category_groups, @category_groups = pagy(CategoryGroup.sort_by_params(params[:sort], sort_direction), page_param: "category_group_page")
    @pagy_categories, @categories = pagy(Category.sort_by_params(params[:sort], sort_direction), page_param: "category_page")
    @pagy_subcategories, @subcategories = pagy(Subcategory.sort_by_params(params[:sort], sort_direction), page_param: "subcategory_page")

    @categories_index_array = [
      { results: @body_part_groups, pagy: @pagy_body_part_groups, category_name: "Body Part Group", fa_icon: "fa-users-class" },
      { results: @body_parts, pagy: @pagy_body_parts, category_name: "Body Part", fa_icon: "fa-child" },
      { results: @category_groups, pagy: @pagy_category_groups, category_name: "Category Group", fa_icon: "fa-th-list" },
      { results: @categories, pagy: @pagy_categories, category_name: "Category", fa_icon: "fa-list" },
      { results: @subcategories, pagy: @pagy_subcategories, category_name: "Subcategory", fa_icon: "fa-stream" }
    ]

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @categories.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @body_part_groups.load
    @body_parts.load
    @category_groups.load
    @categories.load
    @subcategories.load
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @body_part_group = BodyPartGroup.new
    @body_part = BodyPart.new
    @category_group = CategoryGroup.new
    @category = Category.new
    @subcategory = Subcategory.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @body_part_group = BodyPartGroup.new(body_part_group_params)
    @body_part = BodyPart.new(body_part_params)
    @category_group = CategoryGroup.new(category_group_params)
    @category = Category.new(category_params)
    @subcategory = Subcategory.new(subcategory_params)

    if @category_group.save && @category.save && @subcategory.save
      redirect_to @category, flash: { success: "Category was successfully created." }
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, flash: { success: "Category was successfully updated." }
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, flash: { warning: "Category was destroyed." }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_body_part_group
    @body_part_group = BodyPartGroup.find(params[:id])
  end

  def set_body_part
    @body_part = BodyPart.find(params[:id])
  end

  def set_category_group
    @category_group = CategoryGroup.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def body_part_group_params
    params.require(:body_part_group).permit(:name, :ancestry)
  end

  def body_part_params
    params.require(:body_part).permit(:name, :ancestry)
  end

  def category_group_params
    params.require(:category_group).permit(:name, :ancestry)
  end

  def category_params
    params.require(:category).permit(:name, :ancestry)
  end

  def subcategory_params
    params.require(:subcategory).permit(:name, :ancestry)
  end
end
