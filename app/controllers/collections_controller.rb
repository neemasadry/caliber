class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :set_collection_owner, only: [:index, :show, :destroy]
  before_action :set_collection, only: [:show, :destroy]
  before_action :set_collection_items, only: [:show]

  # GET /collections
  def index
    user = User.find_by(username: params[:user_profile_id])
    users_collections = user.collections.all

    @pagy, @collections = pagy(users_collections.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @collections.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @collections.load
  end

  # GET /collections/1
  def show
  end

  # # GET /collections/new
  # def new
  #   @collection = Collection.new
  # end

  # # GET /collections/1/edit
  # def edit
  # end

  # # POST /collections
  # def create
  #   if current_account.personal?
  #     @collection = Collection.new(collection_params)
  #     @collection.user = current_user

  #     if @collection.save
  #       redirect_to @collection, notice: "Collection was successfully created."
  #     else
  #       render :new
  #     end
  #   else
  #     redirect_to collections_path, alert: "You can only create a Collection through your personal account."
  #   end
  # end

  # # PATCH/PUT /collections/1
  # def update
  #   if current_account.personal?
  #     if @collection.update(collection_params)
  #       redirect_to @collection, notice: "Collection was successfully updated."
  #     else
  #       render :edit
  #     end
  #   else
  #     redirect_to collections_path, alert: "You can only update a Collection through your personal account."
  #   end
  # end

  # DELETE /collections/1
  def destroy
    @collection.collection_items.destroy_all
    redirect_to collections_url, notice: "Collection was successfully destroyed."
  end

  private

    def set_collection_owner
      @collection_owner = User.find_by(username: params[:user_profile_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
      authorize @collection
    end

    # Find all collection_items associated with this Collection object
    def set_collection_items
      @collection_items = CollectionItem.all.where(collectable_item_type: @collection.collection_type, collection_id: @collection.id)
    end

    # Only allow a trusted parameter "white list" through.
    def collection_params
      params.require(:collection).permit(:user_id, :collection_type, :total_items, :total_price)
    end
end
