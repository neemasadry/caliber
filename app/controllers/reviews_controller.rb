class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_reviewable

  # GET /reviews
  def index
    @pagy, @reviews = pagy(Review.where({reviewable: @reviewable}), items: 10)

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @reviews.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @reviews.load
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new(reviewable: @reviewable)
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params.merge(user_id: current_user.id, reviewable: @reviewable))

    if @review.save
      redirect_to [@reviewable, @review], notice: "Review was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: "Review was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: "Review was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:reviewable_id, :reviewable_type, :user_id, :title, :body, :quality, :value, :compliment, :ratings)
    end

    # Search for parent model to build new_XXX_review_path
    def set_reviewable
      reviewable_type = params[:model_name].constantize
      reviewable_foreign_key = params[:model_name].foreign_key
      reviewable_id = params[reviewable_foreign_key]

      @reviewable = reviewable_type.friendly.find(reviewable_id)
    end # set_reviewable

end
