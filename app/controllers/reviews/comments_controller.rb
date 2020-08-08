class Reviews::CommentsController < CommentsController
  # include ReviewsHelper
  before_action :set_commentable

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

    @comment.save!
    redirect_to polymorphic_path([@reviewable, @commentable]), info: "Your comment was successfully posted!"
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
end
