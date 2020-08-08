class Posts::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Post.find(params[:guide_id])
    end
end
