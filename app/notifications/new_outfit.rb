# To deliver this notification:
#
# NewOutfit.with(post: @post).deliver_later(current_user)
# NewOutfit.with(post: @post).deliver(current_user)

class NewOutfit < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add your delivery methods
  #
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post
  param :outfit

  # Define helper methods to make rendering easier.
  #
  # `message` and `url` are used for rendering in the navbar

  def message
    if params[:outfit].brand.present?
      t(".with_brand", user: params[:outfit].user.username, outfit: params[:outfit].name, brand: params[:outfit].brand.name)
    else
      t(".without_brand", user: params[:outfit].user.username, outfit: params[:outfit].name)
    end
  end

  def url
    # You can use any URL helpers here such as:
    # post_path(params[:post])
    outfit_path(params[:outfit])
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
    }
  end
end
