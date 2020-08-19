# To deliver this notification:
#
# NewGuide.with(post: @post).deliver_later(current_user)
# NewGuide.with(post: @post).deliver(current_user)

class NewGuide < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add required params
  param :guide

  # Define helper methods to make rendering easier.
  # `message` and `url` are used for rendering in the navbar

  def message
    t(".new_guide", user: params[:guide].user.username, guide: params[:guide].title)
  end

  def url
    # You can use any URL helpers here such as:
    # post_path(params[:post])
    guide_path(params[:guide])
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
    }
  end
end
