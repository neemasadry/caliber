class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :user_already_reviewed?, only: [:index, :new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy, :like]
  before_action :set_reviewable
  before_action :user_is_brand_owner?

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
    if @user_already_reviewed || @user_is_brand_owner
      redirect_to polymorphic_path([@reviewable, Review]), alert: "You already reviewed this product."
    else
      @review = Review.new(reviewable: @reviewable)
    end
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    if @user_already_reviewed || @user_is_brand_owner
      redirect_to polymorphic_path([@reviewable, Review]), alert: "You already reviewed this product."
    else

      @review = Review.new(review_params.merge(user_id: current_user.id, reviewable: @reviewable))

      if @review.save
        redirect_to [@reviewable, @review], notice: "Review was successfully created."
      else
        render :new
      end

    end # did user already review OR is the user an owner of the Brand?
  end # create

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

  def like # acts_as_votable
    if current_account.personal? && user_signed_in?
      if current_user.liked? @review
        @review.unliked_by(current_user)
        redirect_to(polymorphic_path([@reviewable, @review]), flash: { warning: "You unliked the review: #{@review.title}." })
      elsif current_user.id != @review.user_id
        @review.liked_by(current_user)
        redirect_to(polymorphic_path([@reviewable, @review]), flash: { success: "You like the review: #{@review.title}!" })
      else
        redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
      end
    else
      redirect_to review_path(@review), flash: { danger: "You can only Like a review using your personal account." }
    end
  end

  private

    def user_is_brand_owner?
      # Returns a CollectionProxy, like #<ActiveRecord::Associations::CollectionProxy [#<AccountUser id: 13, account_id: 13, user_id: 7, roles: {"admin"=>true}, created_at: "2020-08-06 14:29:29", updated_at: "2020-08-06 14:29:29">]>
      brand_owners = @reviewable.brand.account.account_users
      account_owner = @reviewable.brand.account.owner_id

      brand_owners.each do |brand_owner|
        if current_user.id == brand_owner.user_id || current_user.id == account_owner
          return @user_is_brand_owner = true
        end
      end

      @user_is_brand_owner = false

    end

    def user_already_reviewed?
      reviewed = Review.find_by(user: current_user.id)
      if reviewed.present?
        @user_already_reviewed = true
        @review = reviewed
      else
        @user_already_reviewed = false
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.friendly.find(params[:id])
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
