class DressesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_dress, only: [:show, :edit, :update, :destroy]

  #after_action :verify_authorized

  # GET /dresses
  def index
    @pagy, @dresses = pagy(Dress.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @dresses.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @dresses.load
  end

  # GET /dresses/1
  def show
    votable_on_show_action
  end

  # GET /dresses/new
  def new
    @dress = Dress.new
    authorize @dress
  end

  # GET /dresses/1/edit
  def edit
    if @user_on_personal_account
      redirect_to dresses_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /dresses
  def create
    @dress = Dress.new(dress_params)
    @dress.user = current_user

    authorize @dress

    if @dress.save
      redirect_to @dress, notice: "Dress was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /dresses/1
  def update
    if @user_on_personal_account
      redirect_to dresses_path, alert: "You cannot edit product listings with your personal account."
    else
      if @dress.update(dress_params)
        redirect_to @dress, notice: "Dress was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /dresses/1
  def destroy
    if @user_on_personal_account
      redirect_to dresses_path, alert: "You cannot delete product listings with your personal account."
    else
      @dress.destroy
      redirect_to dresses_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal?
      if current_user.collected?(params[:controller], @dress)
        current_user.remove_from_collection("Dress", @dress)
        redirect_to(dress_path(@dress), alert: "You removed the product #{@dress.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Dress", @dress)
        redirect_to(dress_path(@dress), flash: { success: "You added the product #{@dress.name} to your Accessories Collection!" })
      end
    else
      redirect_to dress_path(@dress), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @dress
      current_user.unfavorite(@dress, scopes: [:favorite, :product, :dress])
      redirect_to(dress_path(@dress), flash: { warning: "You removed the product #{@dress.name} from your favorites." })
    else
      current_user.favorite(@dress, scopes: [:favorite, :product, :dress])
      redirect_to(dress_path(@dress), flash: { success: "You added the product #{@dress.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @dress
      @dress.unliked_by(current_user)
      redirect_to(dress_path(@dress), flash: { warning: "You unliked the product: #{@dress.name}." })
    elsif current_user.id != @dress.user_id
      @dress.liked_by(current_user)
      redirect_to(dress_path(@dress), flash: { success: "You like the product: #{@dress.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dress
    @dress = Dress.friendly.find(params[:id])
    authorize @dress
  end

  # Only allow a trusted parameter "white list" through.
  def dress_params
    params.require(:dress).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end

  def set_user_on_personal_account
    @user_on_personal_account = current_account.personal?
  end
end
