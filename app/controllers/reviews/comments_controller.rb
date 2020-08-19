class Reviews::CommentsController < CommentsController
  # include ReviewsHelper
  before_action :set_commentable
  # around_action only: :create do
  #   set_brand_owners_for_notifications(false)
  # end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.account = current_account
    @comment.deleted = false

    unless current_account.personal?
      @comment.brand = current_account.brand
    else
      @comment.brand = nil
    end

    if @comment.parent_id == nil
      @comment.parent_id = 0
    end

    if @comment.save!
      NewComment.with(reviewable: @reviewable, commentable: @commentable, comment: @comment).deliver_later(@commentable.user)
      NewComment.with(reviewable: @reviewable, commentable: @commentable, comment: @comment).deliver_later(@brand_owners)

      redirect_to polymorphic_path([@reviewable, @commentable]), flash: { success: "Your comment was successfully posted!" }
    else
      redirect_to polymorphic_path([@reviewable, @commentable]), flash: { danger: "Error: Comment could not be posted. Please try again later." }
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])

    if @comment.user == current_user && @comment.account == current_account
      @comment.destroy
      redirect_to polymorphic_path([@reviewable, @commentable]), warning: 'Comment has been deleted.'
    else
      redirect_to polymorphic_path([@reviewable, @commentable]), danger: "You are not allowed to perform that action!"
    end
  end

  private

    def set_commentable
      @klass = [Accessory, Bottom, Cosmetic, Dress, Fragrance, Jewelry, Shoe, Top].detect { |c| params["#{c.name.underscore}_id"] }
      if @klass.present?
        # Means the path is nested twice for one of the product types; path resembles "product/:product_id/reviews/:review_id/"
        #@commentable = Review.find_by(reviewable_type: "#{klass.name}", reviewable_id: params["#{klass.name.underscore}_id"])

        #@review = Review.friendly.find(params[:review_id])
        @reviewable = @klass.friendly.find(params["#{@klass.name.underscore}_id"])

        @commentable = Review.friendly.find(params[:review_id])
      # else
        # Means the path is only nested once; path would resemble guides/2/
        # @commentable = Review.find(params[:id])
      end
    end

  def set_brand_owners_for_notifications(with_current_user = false, comment)
    if with_current_user
      # Includes all brand owners EXCEPT the current_user
      brand_account_users = @reviewable.brand.account.account_users.map do |account_user|
        next if account_user.user == current_user
      end
    else
      # Includes all brand owners INCLUDING the current_user
      brand_account_users = @reviewable.brand.account.account_users
    end

    @brand_owners = brand_account_users.map(&:user)

    return @brand_owners
  end
end
