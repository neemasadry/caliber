class TopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_top, only: [:show, :edit, :update, :destroy]

  # after_action :verify_authorized

  # GET /tops
  def index
    @pagy, @tops = pagy(Top.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @tops.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @tops.load
  end

  # GET /tops/1
  def show
    votable_on_show_action
  end

  # GET /tops/new
  def new
    @top = Top.new
    authorize @top
  end

  # GET /tops/1/edit
  def edit
    if @user_on_personal_account
      redirect_to tops_path, alert: "You cannot edit product listings with your personal account."
    end
  end

  # POST /tops
  def create
    @top = Top.new(top_params)
    @top.user = current_user

    authorize @top

    if @top.save
      NewProduct.with(product: @top).deliver_later(@top.brand.favoritors(scope: :brand_follow))
      redirect_to @top, notice: "Top was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /tops/1
  def update
    if @user_on_personal_account
      redirect_to accessories_path, alert: "You cannot edit product listings with your personal account."
    else
      if @top.update(top_params)
        redirect_to @top, notice: "Top was successfully updated."
      else
        render :edit
      end
    end
  end

  # DELETE /tops/1
  def destroy
    if @user_on_personal_account
      redirect_to tops_path, alert: "You cannot delete product listings with your personal account."
    else
      @top.destroy
      redirect_to tops_url, notice: "Product was successfully destroyed."
    end
  end

  def collect # acts_as_favoritor
    if current_account.personal?
      if current_user.collected?(params[:controller], @top)
        current_user.remove_from_collection("Top", @top)
        redirect_to(top_path(@top), alert: "You removed the product #{@top.name} from your Accessories Collection." )
      else
        current_user.add_to_collection("Top", @top)
        redirect_to(top_path(@top), flash: { success: "You added the product #{@top.name} to your Accessories Collection!" })
      end
    else
      redirect_to top_path(@top), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_user.favorited? @top
      current_user.unfavorite(@top, scopes: [:favorite, :product, :top])
      redirect_to(top_path(@top), flash: { warning: "You removed the product #{@top.name} from your favorites." })
    else
      current_user.favorite(@top, scopes: [:favorite, :product, :top])
      redirect_to(top_path(@top), flash: { success: "You added the product #{@top.name} to your favorites!" })
    end
  end

  def like # acts_as_votable
    if current_user.liked? @top
      @top.unliked_by(current_user)
      redirect_to(top_path(@top), flash: { warning: "You unliked the product: #{@top.name}." })
    elsif current_user.id != @top.user_id
      @top.liked_by(current_user)
      redirect_to(top_path(@top), flash: { success: "You like the product: #{@top.name}!" })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_top
    @top = Top.friendly.find(params[:id])
    authorize @top
  end

  # Only allow a trusted parameter "white list" through.
  def top_params
    params.require(:top).permit(:user_id, :brand_id, :name, :description, :retail_price, :type, :gender, :materials, :primary_color, :secondary_color, :product_url)
  end

  def set_user_on_personal_account
    @user_on_personal_account = current_account.personal?
  end
end
