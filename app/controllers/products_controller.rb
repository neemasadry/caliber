class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_on_personal_account, if: :user_signed_in?
  before_action :set_product, only: [:show, :edit, :update, :destroy, :like, :favorite, :collect, :outfit]
  before_action :set_users_outfits, only: [:show, :outfit]

  # GET /products
  def index
    # @pagy, @products = pagy(Product.sort_by_params(params[:sort], sort_direction))
    # @products.load

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @products.any? in the view will use the loaded records to check existence instead of making an extra DB call.

    @pagy_accessories, @accessories = pagy(Accessory.sort_by_params(params[:sort], sort_direction), page_param: "accessories_page")
    @pagy_bottoms, @bottoms = pagy(Bottom.sort_by_params(params[:sort], sort_direction), page_param: "bottoms_page")
    @pagy_cosmetics, @cosmetics = pagy(Cosmetic.sort_by_params(params[:sort], sort_direction), page_param: "cosmetics_page")
    @pagy_dresses, @dresses = pagy(Dress.sort_by_params(params[:sort], sort_direction), page_param: "dresses_page")
    @pagy_fragrances, @fragrances = pagy(Fragrance.sort_by_params(params[:sort], sort_direction), page_param: "fragrances_page")
    @pagy_jewelries, @jewelries = pagy(Jewelry.sort_by_params(params[:sort], sort_direction), page_param: "jewelries_page")
    @pagy_shoes, @shoes = pagy(Shoe.sort_by_params(params[:sort], sort_direction), page_param: "shoes_page")
    @pagy_suits, @suits = pagy(Suit.sort_by_params(params[:sort], sort_direction), page_param: "suits_page")
    @pagy_tops, @tops = pagy(Top.sort_by_params(params[:sort], sort_direction), page_param: "tops_page")

    @accessories.load
    @bottoms.load
    @cosmetics.load
    @dresses.load
    @fragrances.load
    @jewelries.load
    @shoes.load
    @suits.load
    @tops.load
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  def collect # acts_as_favoritor
    if current_account.personal? && user_signed_in?
      if current_user.collected?(params[:controller], @product)
        current_user.remove_from_collection(@product.productable_type, @product)
        redirect_to(accessory_path(@product), alert: "You removed the product #{@product.name} from your #{@product.productable_type.pluralize} Collection." )
      else
        current_user.add_to_collection(@product.productable_type, @product)
        redirect_to(accessory_path(@product), flash: { success: "You added the product #{@product.name} to your #{@product.productable_type.pluralize} Collection!" })
      end
    else
      redirect_to accessory_path(@product), flash: { danger: "You can only add an item to your Collection on your personal account." }
    end
  end

  def favorite # acts_as_favoritor
    if current_account.personal? && user_signed_in?
      if current_user.favorited? @product
        current_user.unfavorite(@product, scopes: [:favorite, :product, :accessory])
        redirect_to(accessory_path(@product), flash: { warning: "You removed the product #{@product.name} from your favorites." })
      else
        current_user.favorite(@product, scopes: [:favorite, :product, :accessory])
        redirect_to(accessory_path(@product), flash: { success: "You added the product #{@product.name} to your favorites!" })
      end
    else
      redirect_to accessory_path(@product), flash: { danger: "You can only Favorite an item using your personal account." }
    end
  end

  def like # acts_as_votable
    if current_account.personal? && user_signed_in?
      if current_user.liked? @product
        @product.unliked_by(current_user)
        redirect_to(accessory_path(@product), flash: { warning: "You unliked the product: #{@product.name}." })
      elsif current_user.id != @product.user_id
        @product.liked_by(current_user)
        redirect_to(accessory_path(@product), flash: { success: "You like the product: #{@product.name}!" })
      else
        redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
      end
    else
      redirect_to accessory_path(@product), flash: { danger: "You can only Like an item using your personal account." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def set_users_outfits
    if user_signed_in?
      @users_outfits = Outfit.all.where(user_id: current_user.id, account_id: current_account.id)
    end
  end


  # Only allow a trusted parameter "white list" through.
  def product_params
    params.require(:product).permit(:name, :productable_id, :productable_type, :user_id, :account_id, :brand_id)
  end

  def set_user_on_personal_account
    @user_on_personal_account = current_account.personal?
  end
end
