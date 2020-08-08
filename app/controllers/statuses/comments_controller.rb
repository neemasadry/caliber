class Guides::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Status.friendly.find(params[:guide_id])
    end
end
