class ShoesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]

  # after_action :verify_authorized

  # GET /shoes
  def index
    @pagy, @shoes = pagy(Shoe.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @shoes.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @shoes.load
  end

  # GET /shoes/1
  def show
    votable_on_show_action
  end

  # GET /shoes/new
  def new
    @shoe = Shoe.new
    authorize @shoe
  end

  # GET /shoes/1/edit
  def edit
    if @user_on_personal_account
      redirect_to shoes_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /shoes
  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.user = current_user

    authorize @shoe

    if @shoe.save
      redirect_to @shoe, notice: "Shoe was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /shoes/1
  def update
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    else
      if @shoe.update(shoe_params)
        redirect_to @shoe, notice: "Shoe was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /shoes/1
  def destroy
    if @user_on_personal_account
      redirect_to shoes_path, alert: "You cannot delete product listings with your personal account."
    else
      @shoe.destroy
      redirect_to shoes_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal?
      if current_user.collected?(params[:controller], @shoe)
        current_user.remove_from_collection("Shoe", @shoe)
        redirect_to(shoe_path(@shoe), alert: "You removed the product #{@shoe.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Shoe", @shoe)
        redirect_to(shoe_path(@shoe), flash: { success: "You added the product #{@shoe.name} to your Accessories Collection!" })
      end
    else
      redirect_to shoe_path(@shoe), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @shoe
      current_user.unfavorite(@shoe, scope: :favorite)
      redirect_to(shoe_path(@shoe), flash: { warning: "You removed the product #{@shoe.name} from your favorites." })
    else
      current_user.favorite(@shoe, scope: :favorite)
      redirect_to(shoe_path(@shoe), flash: { success: "You added the product #{@shoe.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @shoe
      @shoe.unliked_by(current_user)
      redirect_to(shoe_path(@shoe), flash: { warning: "You unliked the product: #{@shoe.name}." })
    elsif current_user.id != @shoe.user_id
      @shoe.liked_by(current_user)
      redirect_to(shoe_path(@shoe), flash: { success: "You like the product: #{@shoe.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shoe
    @shoe = Shoe.friendly.find(params[:id])
    authorize @shoe
  end

  # Only allow a trusted parameter "white list" through.
  def shoe_params
    params.require(:shoe).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end

  def set_user_on_personal_account
    @user_on_personal_account = current_account.personal?
  end
end
