class CosmeticsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_cosmetic, only: [:show, :edit, :update, :destroy]

  # GET /cosmetics
  def index
    @pagy, @cosmetics = pagy(Cosmetic.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @cosmetics.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    authorize @cosmetics
    @cosmetics.load
  end

  # GET /cosmetics/1
  def show
    votable_on_show_action
  end

  # GET /cosmetics/new
  def new
    @cosmetic = Cosmetic.new
    authorize @cosmetic
  end

  # GET /cosmetics/1/edit
  def edit
    if @user_on_personal_account
      redirect_to cosmetics_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /cosmetics
  def create
    @cosmetic = Cosmetic.new(cosmetic_params)
    @cosmetic.user = current_user

    authorize @cosmetic

    if @cosmetic.save
      redirect_to @cosmetic, notice: "Cosmetic was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /cosmetics/1
  def update
    if @user_on_personal_account
      redirect_to cosmetics_path, alert: "You cannot edit product listings with your personal account."
    else
      if @cosmetic.update(cosmetic_params)
        redirect_to @cosmetic, notice: "Cosmetic was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /cosmetics/1
  def destroy
    if @user_on_personal_account
      redirect_to cosmetics_path, alert: "You cannot delete product listings with your personal account."
    else
      @cosmetic.destroy
      redirect_to cosmetics_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal?
      if current_user.collected?(params[:controller], @cosmetic)
        current_user.remove_from_collection("Cosmetic", @cosmetic)
        redirect_to(cosmetic_path(@cosmetic), alert: "You removed the product #{@cosmetic.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Cosmetic", @cosmetic)
        redirect_to(cosmetic_path(@cosmetic), flash: { success: "You added the product #{@cosmetic.name} to your Accessories Collection!" })
      end
    else
      redirect_to cosmetic_path(@cosmetic), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @cosmetic
      current_user.unfavorite(@cosmetic, scopes: [:favorite, :product, :cosmetic])
      redirect_to(cosmetic_path(@cosmetic), flash: { warning: "You removed the product #{@cosmetic.name} from your favorites." })
    else
      current_user.favorite(@cosmetic, scopes: [:favorite, :product, :cosmetic])
      redirect_to(cosmetic_path(@cosmetic), flash: { success: "You added the product #{@cosmetic.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @cosmetic
      @cosmetic.unliked_by(current_user)
      redirect_to(cosmetic_path(@cosmetic), flash: { warning: "You unliked the product: #{@cosmetic.name}." })
    elsif current_user.id != @cosmetic.user_id
      @cosmetic.liked_by(current_user)
      redirect_to(cosmetic_path(@cosmetic), flash: { success: "You like the product: #{@cosmetic.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_cosmetic
      @cosmetic = Cosmetic.friendly.find(params[:id])
      authorize @cosmetic
    end

    # Only allow a trusted parameter "white list" through.
    def cosmetic_params
      params.require(:cosmetic).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :type_of, :gender, :ingredients, :product_url)
    end

    def set_user_on_personal_account
      @user_on_personal_account = current_account.personal?
    end
end
