class OutfitsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_outfit, only: [:show, :edit, :update, :destroy, :like, :favorite]

  # after_action :verify_authorized

  # GET /outfits
  def index
    @pagy, @outfits = pagy(Outfit.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @outfits.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @outfits.load
  end

  # GET /outfits/1
  def show
    @outfit_items = @outfit.outfit_items.all
  end

  # GET /outfits/new
  def new
    @outfit = Outfit.new
  end

  # GET /outfits/1/edit
  def edit
  end

  # POST /outfits
  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user
    @outfit.account = current_account
    @outfit.brand = current_account.brand if !current_account.personal?

    if @outfit.save
      redirect_to @outfit, notice: "Outfit was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /outfits/1
  def update
    if @outfit.update(outfit_params)
      redirect_to @outfit, notice: "Outfit was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /outfits/1
  def destroy
    @outfit.destroy
    redirect_to outfits_url, notice: "Outfit was successfully destroyed."
  end

  # def catalog # acts_as_favoritor
  #   if current_account.personal? && user_signed_in?
  #     if current_user.collected?(params[:controller], @accessory)
  #       current_user.remove_from_collection("Accessory", @accessory)
  #       redirect_to(accessory_path(@accessory), alert: "You removed the product #{@accessory.name} from your Accessories Collection." )
  #     else
  #       current_user.add_to_collection("Accessory", @accessory)
  #       redirect_to(accessory_path(@accessory), flash: { success: "You added the product #{@accessory.name} to your Accessories Collection!" })
  #     end
  #   else
  #     redirect_to accessory_path(@accessory), flash: { danger: "You can only add an item to your Collection on your personal account." }
  #   end
  # end

  def favorite # acts_as_favoritor
    if current_account.personal? && user_signed_in?
      if current_user.favorited? @outfit
        current_user.unfavorite(@outfit, scopes: [:favorite, :outfit])
        redirect_to(outfit_path(@outfit), flash: { warning: "You removed the product #{@outfit.name} from your favorites." })
      else
        current_user.favorite(@outfit, scopes: [:favorite, :outfit])
        redirect_to(outfit_path(@outfit), flash: { success: "You added the product #{@outfit.name} to your favorites!" })
      end
    else
      redirect_to outfit_path(@outfit), flash: { danger: "You can only Favorite an item using your personal account." }
    end
  end

  def like # acts_as_votable
    if current_account.personal? && user_signed_in?
      if current_user.liked? @outfit
        @outfit.unliked_by(current_user)
        redirect_to(outfit_path(@outfit), flash: { warning: "You unliked the product: #{@outfit.name}." })
      elsif current_user.id != @outfit.user_id
        @outfit.liked_by(current_user)
        redirect_to(outfit_path(@outfit), flash: { success: "You like the product: #{@outfit.name}!" })
      else
        redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
      end
    else
      redirect_to outfit_path(@outfit), flash: { danger: "You can only Like an item using your personal account." }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_outfit
      @outfit = Outfit.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def outfit_params
      params.require(:outfit).permit(:user_id, :account_id, :brand_id, :name, :description, :season, :occasion, :dress_code, :total_number_of_products, :total_price, outfit_items_attributes: [:_destroy, :id, :productable_type, :productable_id, :outfit_id, :body_part])
    end
end
