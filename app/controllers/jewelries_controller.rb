class JewelriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_jewelry, only: [:show, :edit, :update, :destroy]

  # after_action :verify_authorized

  # GET /jewelries
  def index
    @pagy, @jewelries = pagy(Jewelry.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @jewelries.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @jewelries.load
  end

  # GET /jewelries/1
  def show
    votable_on_show_action
  end

  # GET /jewelries/new
  def new
    @jewelry = Jewelry.new
    authorize @jewelry
  end

  # GET /jewelries/1/edit
  def edit
    if @user_on_personal_account
      redirect_to jewelries_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /jewelries
  def create
    @jewelry = Jewelry.new(jewelry_params)
    @jewelry.user = current_user

    authorize @jewelry

    if @jewelry.save
      redirect_to @jewelry, notice: "Jewelry was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /jewelries/1
  def update
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    else
      if @jewelry.update(jewelry_params)
        redirect_to @jewelry, notice: "Jewelry was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /jewelries/1
  def destroy
    if @user_on_personal_account
      redirect_to jewelries_path, alert: "You cannot delete product listings with your personal account."
    else
      @jewelry.destroy
      redirect_to jewelries_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal?
      if current_user.collected?(params[:controller], @jewelry)
        current_user.remove_from_collection("Jewelry", @jewelry)
        redirect_to(jewelry_path(@jewelry), alert: "You removed the product #{@jewelry.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Jewelry", @jewelry)
        redirect_to(jewelry_path(@jewelry), flash: { success: "You added the product #{@jewelry.name} to your Accessories Collection!" })
      end
    else
      redirect_to jewelry_path(@jewelry), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @jewelry
      current_user.unfavorite(@jewelry, scope: :favorite)
      redirect_to(jewelry_path(@jewelry), flash: { warning: "You removed the product #{@jewelry.name} from your favorites." })
    else
      current_user.favorite(@jewelry, scope: :favorite)
      redirect_to(jewelry_path(@jewelry), flash: { success: "You added the product #{@jewelry.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @jewelry
      @jewelry.unliked_by(current_user)
      redirect_to(jewelry_path(@jewelry), flash: { warning: "You unliked the product: #{@jewelry.name}." })
    elsif current_user.id != @jewelry.user_id
      @jewelry.liked_by(current_user)
      redirect_to(jewelry_path(@jewelry), flash: { success: "You like the product: #{@jewelry.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jewelry
    @jewelry = Jewelry.friendly.find(params[:id])
    @authorize @jewelry
  end

  # Only allow a trusted parameter "white list" through.
  def jewelry_params
    params.require(:jewelry).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end

  def set_user_on_personal_account
    @user_on_personal_account = current_account.personal?
  end
end
