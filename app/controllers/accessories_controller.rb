class AccessoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized

  # GET /accessories
  def index
    @pagy, @accessories = pagy(Accessory.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @accessories.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    authorize @accessories.load
  end

  # GET /accessories/1
  def show
  end

  # GET /accessories/new
  def new
    # if @user_on_personal_account
    #   redirect_to accessories_path, alert: "You cannot make a new product listings with your personal account."
    # else
      @accessory = Accessory.new
      authorize @accessory
    # end
  end

  # GET /accessories/1/edit
  def edit
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /accessories
  def create
    # if @user_on_personal_account
    #   redirect_to accessories_path, alert: "You cannot create product listings with your personal account."
    # else
      @accessory = Accessory.new(accessory_params.merge(user_id: current_user.id))
      authorize @accessory
      if @accessory.save
        redirect_to @accessory, notice: "Accessory was successfully created."
      else
        render :new
      end
    # end
  end

  # PATCH/PUT /accessories/1
  def update
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    else
      if @accessory.update(accessory_params)
        redirect_to @accessory, notice: "Accessory was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /accessories/1
  def destroy
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot delete product listings with your personal account."
    else
      @accessory.destroy
      redirect_to accessories_url, notice: "Accessory was successfully destroyed."
    end
  end

  def collection # acts_as_favoritor
    if current_account.personal?
      if current_user.favorited?(@accessory)
        current_user.unfavorite(@accessory, scope: :favorite)
        redirect_to(accessory_path(@accessory), flash: { warning: "You removed the product #{@accessory.name} from your favorites." })
      else
        current_user.favorite(@accessory, scope: :collection)
        redirect_to(accessory_path(@accessory), flash: { success: "You added the product #{@accessory.name} to your favorites!" })
      end
    else
      redirect_to accessory_path(@accessory), alert: "You can only add an item to your collection on your personal account."
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @accessory
      current_user.unfavorite(@accessory, scope: :favorite)
      redirect_to(accessory_path(@accessory), flash: { warning: "You removed the product #{@accessory.name} from your favorites." })
    else
      current_user.favorite(@accessory, scope: :favorite)
      redirect_to(accessory_path(@accessory), flash: { success: "You added the product #{@accessory.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @accessory
      @accessory.unliked_by(current_user)
      redirect_to(accessory_path(@accessory), flash: { warning: "You unliked the product: #{@accessory.name}." })
    elsif current_user.id != @accessory.user_id
      @accessory.liked_by(current_user)
      redirect_to(accessory_path(@accessory), flash: { success: "You like the product: #{@accessory.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
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
      params.require(:accessory).permit(:user_id, :brand_id, :name, { product_images_attributes: [] }, :description, :retail_price, :retail_price, :type_of, :gender, :materials, :primary_color, :secondary_color, :product_url)
    end

    def set_user_on_personal_account
      @user_on_personal_account = current_account.personal?
    end

end
