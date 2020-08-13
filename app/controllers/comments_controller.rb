class CommentsController < ApplicationController
  before_action :authenticate_user!

  # POST /comments
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

    if @comment.save
      redirect_to @commentable, success: "Your comment was successfully posted!"
    else
      redirect_to @commentable, alert: "There was an error in posting your comment."
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = @commentable.comments.find(params[:id])

    if @comment.user == current_user && @comment.account == current_account
      @comment.destroy
      redirect_to @commentable, warning: 'Comment has been deleted.'
    else
      redirect_to @commentable, alert: "You are not allowed to perform that action!"
    end
  end

  def like # acts_as_votable
    if current_account.personal? && @comment.deleted == false
      if current_user.liked? @comment
        @comment.unliked_by(current_user)
        redirect_to(polymorphic_path([@commentable, @comment]), flash: { warning: "You unliked this comment." })
      elsif current_user.id != @comment.user_id
        @comment.liked_by(current_user)
        redirect_to(polymorphic_path([@commentable, @comment]), flash: { success: "You like #{@comment.user.username}'s comment." })
      else
        redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
      end
    else
      redirect_to review_path(@review), flash: { danger: "You can only Like an existing comment using your personal account." }
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:commentable_type, :commentable_id, :user_id, :account_id, :brand_id, :parent_id, :body, :deleted)
    end

end
