class ProfilesController < ApplicationController
  prepend_view_path(File.join(Rails.root, 'app/views/profiles/'))
  layout 'application'
  before_action :authenticate_user!
  before_action :set_profile, except: [:index]

  def index
    if current_user.admin?
      @profiles = User.all
      @profiles.load
    else
      redirect_to root_path, flash: { danger: "Authorization failed. Restricted access." }
    end
  end

  def show
    skip_authorization
    votable_on_show_action
    # Output title of page with users first and last name
    @title = "#{@profile.first_name} #{@profile.last_name}'s Profile"

    # Determine if the user currently signed in is viewing their own profile
    if (current_user != @profile)
      @my_profile = false
    else
      @my_profile = true
    end
  end # show

  def follow
    skip_authorization

    if current_user != @profile
      if current_user.favorited?(@profile, scope: :user_follow)
        current_user.unfavorite(@profile, scope: :user_follow)
        redirect_to(profile_path(@profile), flash: { warning: "You are no longer following #{@profile.username}." })
      else

        current_user.favorite(@profile, scope: :user_follow)

        # from custom Notification solution
        # Create notification for recipient
        #Notification.create(recipient: @profile, actor: current_user, action: "following", notifiable: @profile)

        redirect_to(profile_path(@profile), flash: { success: "You are now following #{@profile.username}!" })
      end
    else
      redirect_to(profile_path(@profile), flash: { error: "You cannot follow the same account you are logged in as!" })
    end
    #redirect_to(profile_path(@profile), flash: { error: "You must sign in to your account to follow this user!" })
  end

  def watch
    skip_authorization

    if current_user != @profile
      if current_user.favorited?(@profile, scope: :follow)
        if current_user.favorited?(@profile, scope: :watch)
          current_user.unfavorite(@profile, scope: :watch)
          redirect_to(profile_path(@profile), flash: { warning: "Notifications disabled for #{@profile.name.full}." })
        else
          current_user.favorite(@profile, scope: :watch)
          redirect_to(profile_path(@profile), flash: { success: "Notifications enabled for #{@profile.name.full}!" })
        end
      else
        redirect_to(profile_path(@profile), flash: { danger: "You must be following #{@profile.name.full} in order to enable notifications from this account!" })
      end # if current_user following @profile
    else
      redirect_to(profile_path(@profile))
    end

  end # watch

  # def watch
  #   if current_user != @profile
  #     if current_user.favorited?(@profile, scope: :follow)
  #       if current_user.favorited?(@profile, scope: :watch)
  #         current_user.unfavorite(@profile, scope: :watch)
  #         redirect_to(profile_path(@profile), flash: { warning: "Notifications disabled for #{@profile.name.full}." })
  #       else
  #         current_user.favorite(@profile, scope: :watch)
  #         redirect_to(profile_path(@profile), flash: { success: "Notifications enabled for #{@profile.name.full}!" })
  #       end
  #     else
  #       redirect_to(profile_path(@profile), flash: { danger: "You must be following #{@profile.name.full} in order to enable notifications from this account!" })
  #     end # if current_user following @profile
  #   else
  #     redirect_to(profile_path(@profile))
  #   end

  # end # watch

  private

    def set_profile
      @profile = User.friendly.find(params[:id])
    end

end
