class Outfits::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Outfit.friendly.find(params[:outfit_id])
    end
end
