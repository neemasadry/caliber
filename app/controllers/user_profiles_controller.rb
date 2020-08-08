class UserProfilesController < ApplicationController
  prepend_view_path(File.join(Rails.root, 'app/views/user_profiles/'))
  layout 'application'
  before_action :authenticate_user! #, only: [:index, :show, :follow, :watch]
  before_action :set_user_profile #, only: [:show, :follow, :watch]


  def index
    @user_profiles = User.all
  end

  def show
    #votable_on_show_action
    # Output title of page with users first and last name
    @title = "#{@user_profile.first_name} #{@user_profile.last_name}'s Profile"

    # Determine if the user currently signed in is viewing their own profile
    if (current_user != @user_profile)
      @my_profile = false
    else
      @my_profile = true
    end
  end # show

  def follow
    if current_user != @user_profile
      if current_user.favorited?(@user_profile, scope: :follow)
        current_user.unfavorite(@user_profile, scope: :follow)
        redirect_to(user_profile_path(@user_profile), flash: { warning: "You are no longer following #{@user_profile.name.full}." })
      else

        current_user.favorite(@user_profile, scope: :follow)

        # from custom Notification solution
        # Create notification for recipient
        #Notification.create(recipient: @user_profile, actor: current_user, action: "following", notifiable: @user_profile)

        redirect_to(user_profile_path(@user_profile), flash: { success: "You are now following #{@user_profile.name.full}!" })
      end
    else
      redirect_to(user_profile_path(@user_profile), flash: { error: "You cannot follow the same account you are logged in as!" })
    end
    #redirect_to(user_profile_path(@user_profile), flash: { error: "You must sign in to your account to follow this user!" })
  end

  def watch

    if current_user != @user_profile
      if current_user.favorited?(@user_profile, scope: :follow)
        if current_user.favorited?(@user_profile, scope: :watch)
          current_user.unfavorite(@user_profile, scope: :watch)
          redirect_to(user_profile_path(@user_profile), flash: { warning: "Notifications disabled for #{@user_profile.name.full}." })
        else
          current_user.favorite(@user_profile, scope: :watch)
          redirect_to(user_profile_path(@user_profile), flash: { success: "Notifications enabled for #{@user_profile.name.full}!" })
        end
      else
        redirect_to(user_profile_path(@user_profile), flash: { danger: "You must be following #{@user_profile.name.full} in order to enable notifications from this account!" })
      end # if current_user following @user_profile
    else
      redirect_to(user_profile_path(@user_profile))
    end

  end # watch

  # def watch
  #   if current_user != @user_profile
  #     if current_user.favorited?(@user_profile, scope: :follow)
  #       if current_user.favorited?(@user_profile, scope: :watch)
  #         current_user.unfavorite(@user_profile, scope: :watch)
  #         redirect_to(user_profile_path(@user_profile), flash: { warning: "Notifications disabled for #{@user_profile.name.full}." })
  #       else
  #         current_user.favorite(@user_profile, scope: :watch)
  #         redirect_to(user_profile_path(@user_profile), flash: { success: "Notifications enabled for #{@user_profile.name.full}!" })
  #       end
  #     else
  #       redirect_to(user_profile_path(@user_profile), flash: { danger: "You must be following #{@user_profile.name.full} in order to enable notifications from this account!" })
  #     end # if current_user following @user_profile
  #   else
  #     redirect_to(user_profile_path(@user_profile))
  #   end

  # end # watch

  private

    def set_user_profile
      @user_profile = User.friendly.find(params[:id])
    end

end
