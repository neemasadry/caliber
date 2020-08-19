class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SetCurrentRequestDetails
  include SetLocale
  include Jumpstart::Controller
  include Accounts::SubscriptionStatus
  include Users::NavbarNotifications
  include Users::TimeZone
  include Pagy::Backend
  include CurrentHelper
  include Sortable
  include Pundit # Added

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!
  before_action :set_paper_trail_whodunnit # 'paper_trail' gem

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  #after_action :verify_authorized, unless: :devise_controller?

  protected

  # To add extra fields to Devise registration, add the attribute names to `extra_keys`
  def configure_permitted_parameters
    extra_keys = [:avatar, :name, :username, :date_of_birth, :gender, :country_code, :time_zone, :preferred_language]
    signup_keys = extra_keys + [:terms_of_service, :invite, owned_accounts_attributes: [:name]]
    devise_parameter_sanitizer.permit(:sign_up, keys: signup_keys)
    devise_parameter_sanitizer.permit(:account_update, keys: extra_keys)
    devise_parameter_sanitizer.permit(:accept_invitation, keys: extra_keys)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  # Helper method for verifying authentication in a before_action, but redirecting to sign up instead of login
  def authenticate_user_with_sign_up!
    unless user_signed_in?
      store_location_for(:user, request.fullpath)
      redirect_to new_user_registration_path, alert: t("create_an_account_first")
    end
  end

  def require_current_account_admin
    unless current_account_admin?
      redirect_to root_path, alert: t("must_be_an_admin")
    end
  end

  ### App Specific ###

  def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
   redirect_to(request.referrer || root_path)
  end

  # votable_on_show_action referencing /views/votable folder name
  def votable_on_show_action
    if user_signed_in?
      if request.filtered_parameters["controller"] == 'user_profiles'
        if current_user.favorited?(@user_profile, scope: :user_follow)
          @following_status = true
        else
          @following_status = false
        end

        if current_user.favorited?(@user_profile, scope: :watch)
          @watching_status = true
        else
          @watching_status = false
        end
      elsif request.filtered_parameters["controller"] == 'brands'
        if current_user.liked? @brand
          @like_status = true
        else
          @like_status = false
        end

        if current_user.favorited?(@brand, scope: :brand_follow)
          @following_status = true
        else
          @following_status = false
        end
      elsif request.filtered_parameters["controller"] == 'recipes'
        if current_user.liked? @recipe
          @like_status = true
        else
          @like_status = false
        end

        if current_user.favorited?(@recipe, scope: :favorite)
          @favorite_status = true
        else
          @favorite_status = false
        end
      elsif request.filtered_parameters["controller"] == 'reviews'
        if current_user.liked? @review
          @like_status = true
        else
          @like_status = false
        end

        if current_user.favorited?(@review, scope: :favorite)
          @favorite_status = true
        else
          @favorite_status = false
        end
      elsif request.filtered_parameters["controller"] == 'guides'
        if current_user.liked? @guide
          @like_status = true
        else
          @like_status = false
        end

        if current_user.favorited?(@guide, scope: :favorite)
          @favorite_status = true
        else
          @favorite_status = false
        end
      elsif request.filtered_parameters["controller"] == 'catalogs'
        if current_user.liked? @catalog
          @like_status = true
        else
          @like_status = false
        end

        if current_user.favorited?(@catalog, scope: :favorite)
          @favorite_status = true
        else
          @favorite_status = false
        end
      elsif request.filtered_parameters["controller"] == 'outfits'
        if current_user.liked? @outfit
          @like_status = true
        else
          @like_status = false
        end

        if current_user.favorited?(@outfit, scope: :favorite)
          @favorite_status = true
        else
          @favorite_status = false
        end
      else
        # Check liked? and favorited? for all product models
        product_controller_categories = ["accessories", "bottoms", "cosmetics", "dresses", "fragrances", "jewelries", "shoes", "tops"]

        product_controller_categories.each do |product_controller|
          if request.filtered_parameters["controller"] == product_controller
            product_instance_var = instance_variable_get("@#{product_controller.singularize}")

            if current_user.liked?(product_instance_var)
              @like_status = true
            else
              @like_status = false
            end

            if current_user.favorited?(product_instance_var, scope: :favorite)
              @favorite_status = true
            else
              @favorite_status = false
            end

            if current_user.collected?(product_controller, product_instance_var)
              @collected_status = true
            else
              @collected_status = false
            end
          end # if request.filtered_parameters["controller"] == product_controller
        end # product_controller_categories.each

      end # check which controller

    end # user_signed_in?
  end # voteable_on_show_action

end
