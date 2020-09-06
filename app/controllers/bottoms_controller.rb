class BottomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_bottom, only: [:show, :edit, :update, :destroy]
  before_action :set_users_outfits, only: [:show, :outfit]

  after_action :verify_authorized

  # GET /bottoms
  def index
    @pagy, @bottoms = pagy(Bottom.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @bottoms.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    authorize @bottoms.load
  end

  # GET /bottoms/1
  def show
    votable_on_show_action
  end

  # GET /bottoms/new
  def new
    @bottom = Bottom.new
    authorize @bottom
  end

  # GET /bottoms/1/edit
  def edit
    if @user_on_personal_account
      redirect_to bottoms_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /bottoms
  def create
    @bottom = Bottom.new(bottom_params)
    @bottom.user = current_user

    authorize @bottom

    if @bottom.save
      NewProduct.with(product: @bottom).deliver_later(@bottom.brand.favoritors(scope: :brand_follow))
      redirect_to @bottom, notice: "Bottom was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /bottoms/1
  def update
    if @user_on_personal_account
      redirect_to bottoms_path, alert: "You cannot edit product listings with your personal account."
    else
      if @bottom.update(bottom_params)
        redirect_to @bottom, notice: "Bottom was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /bottoms/1
  def destroy
    if @user_on_personal_account
      redirect_to bottoms_path, alert: "You cannot delete product listings with your personal account."
    else
      @bottom.destroy
      redirect_to bottoms_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal?
      if current_user.collected?(params[:controller], @bottom)
        current_user.remove_from_collection("Bottom", @bottom)
        redirect_to(bottom_path(@bottom), alert: "You removed the product #{@bottom.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Bottom", @bottom)
        redirect_to(bottom_path(@bottom), flash: { success: "You added the product #{@bottom.name} to your Accessories Collection!" })
      end
    else
      redirect_to bottom_path(@bottom), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @bottom
      current_user.unfavorite(@bottom, scopes: [:favorite, :product, :bottom])
      redirect_to(bottom_path(@bottom), flash: { warning: "You removed the product #{@bottom.name} from your favorites." })
    else
      current_user.favorite(@bottom, scopes: [:favorite, :product, :bottom])
      redirect_to(bottom_path(@bottom), flash: { success: "You added the product #{@bottom.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @bottom
      @bottom.unliked_by(current_user)
      redirect_to(bottom_path(@bottom), flash: { warning: "You unliked the product: #{@bottom.name}." })
    elsif current_user.id != @bottom.user_id
      @bottom.liked_by(current_user)
      redirect_to(bottom_path(@bottom), flash: { success: "You like the product: #{@bottom.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bottom
    @bottom = Bottom.friendly.find(params[:id])
    authorize @bottom
  end

  def set_users_outfits
    if user_signed_in?
      @users_outfits = Outfit.all.where(user_id: current_user.id, account_id: current_account.id)
    end
  end

  # Only allow a trusted parameter "white list" through.
  def bottom_params
    params.require(:bottom).permit(:user_id, :brand_id, :name, :description, :retail_price, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end

  def set_user_on_personal_account
    @user_on_personal_account = current_account.personal?
  end
end
