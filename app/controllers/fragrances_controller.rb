class FragrancesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_fragrance, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized

  # GET /fragrances
  def index
    @pagy, @fragrances = pagy(Fragrance.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @fragrances.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @fragrances.load
  end

  # GET /fragrances/1
  def show
    votable_on_show_action
  end

  # GET /fragrances/new
  def new
    @fragrance = Fragrance.new
    authorize @fragrance
  end

  # GET /fragrances/1/edit
  def edit
    if @user_on_personal_account
      redirect_to fragrances_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /fragrances
  def create
    @fragrance = Fragrance.new(fragrance_params)
    @fragrance.user = current_user

    authorize @fragrance

    if @fragrance.save
      redirect_to @fragrance, notice: "Fragrance was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /fragrances/1
  def update
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    else
      if @fragrance.update(fragrance_params)
        redirect_to @fragrance, notice: "Fragrance was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /fragrances/1
  def destroy
    if @user_on_personal_account
      redirect_to fragrances_path, alert: "You cannot delete product listings with your personal account."
    else
      @fragrance.destroy
      redirect_to fragrances_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal?
      if current_user.collected?(params[:controller], @fragrance)
        current_user.remove_from_collection("Fragrance", @fragrance)
        redirect_to(fragrance_path(@fragrance), alert: "You removed the product #{@fragrance.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Fragrance", @fragrance)
        redirect_to(fragrance_path(@fragrance), flash: { success: "You added the product #{@fragrance.name} to your Accessories Collection!" })
      end
    else
      redirect_to fragrance_path(@fragrance), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @fragrance
      current_user.unfavorite(@fragrance, scope: :favorite)
      redirect_to(fragrance_path(@fragrance), flash: { warning: "You removed the product #{@fragrance.name} from your favorites." })
    else
      current_user.favorite(@fragrance, scope: :favorite)
      redirect_to(fragrance_path(@fragrance), flash: { success: "You added the product #{@fragrance.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @fragrance
      @fragrance.unliked_by(current_user)
      redirect_to(fragrance_path(@fragrance), flash: { warning: "You unliked the product: #{@fragrance.name}." })
    elsif current_user.id != @fragrance.user_id
      @fragrance.liked_by(current_user)
      redirect_to(fragrance_path(@fragrance), flash: { success: "You like the product: #{@fragrance.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fragrance
    @fragrance = Fragrance.friendly.find(params[:id])
    authorize @fragrance
  end

  # Only allow a trusted parameter "white list" through.
  def fragrance_params
    params.require(:fragrance).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :release_date, :gender, :ingredients, :top_notes, :middle_notes, :base_notes, :accords, :product_url)
  end

  def set_user_on_personal_account
    @user_on_personal_account = current_account.personal?
  end
end
