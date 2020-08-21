class AccessoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_accessory, only: [:show, :edit, :update, :destroy, :like, :favorite, :collect]

  # GET /accessories
  def index
    @pagy, @accessories = pagy(Accessory.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @accessories.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    authorize @accessories.load
  end

  # GET /accessories/1
  def show
    votable_on_show_action
  end

  # GET /accessories/new
  def new
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot make a new product listings with your personal account."
    else
      @accessory = Accessory.new
      authorize @accessory
    end
  end

  # GET /accessories/1/edit
  def edit
    if !@user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /accessories
  def create
    @accessory = Accessory.new(accessory_params)
    @accessory.user = current_user

    authorize @accessory

    if @accessory.save
      NewProduct.with(product: @accessory).deliver_later(@accessory.brand.favoritors(scope: :brand_follow))
      redirect_to @accessory, notice: "Accessory was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /accessories/1
  def update
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    end

    authorize @accessory

    if @accessory.update(accessory_params)
      redirect_to @accessory, notice: "Accessory was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /accessories/1
  def destroy
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot delete product listings with your personal account."
    else
      @accessory.destroy
      redirect_to accessories_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal? && user_signed_in?
      if current_user.collected?(params[:controller], @accessory)
        current_user.remove_from_collection("Accessory", @accessory)
        redirect_to(accessory_path(@accessory), alert: "You removed the product #{@accessory.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Accessory", @accessory)
        redirect_to(accessory_path(@accessory), flash: { success: "You added the product #{@accessory.name} to your Accessories Collection!" })
      end
    else
      redirect_to accessory_path(@accessory), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_account.personal? && user_signed_in?
      if current_user.favorited? @accessory
        current_user.unfavorite(@accessory, scopes: [:favorite, :product, :accessory])
        redirect_to(accessory_path(@accessory), flash: { warning: "You removed the product #{@accessory.name} from your favorites." })
      else
        current_user.favorite(@accessory, scopes: [:favorite, :product, :accessory])
        redirect_to(accessory_path(@accessory), flash: { success: "You added the product #{@accessory.name} to your favorites!" })
      end
    else
      redirect_to accessory_path(@accessory), flash: { danger: "You can only Favorite an item using your personal account." }
    end
  end

  def like # acts_as_votable
    if current_account.personal? && user_signed_in?
      if current_user.liked? @accessory
        @accessory.unliked_by(current_user)
        redirect_to(accessory_path(@accessory), flash: { warning: "You unliked the product: #{@accessory.name}." })
      elsif current_user.id != @accessory.user_id
        @accessory.liked_by(current_user)
        redirect_to(accessory_path(@accessory), flash: { success: "You like the product: #{@accessory.name}!" })
      else
        redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
      end
    else
      redirect_to accessory_path(@accessory), flash: { danger: "You can only Like an item using your personal account." }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @accessory = Accessory.friendly.find(params[:id])
      authorize @accessory
    end

    # Only allow a trusted parameter "white list" through.
    def accessory_params
      params.require(:accessory).permit(:user_id, :brand_id, :name, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
    end

    def set_user_on_personal_account
      @user_on_personal_account = current_account.personal?
    end

end
