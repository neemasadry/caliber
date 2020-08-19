# To deliver this notification:
#
# NewCatalog.with(post: @post).deliver_later(current_user)
# NewCatalog.with(post: @post).deliver(current_user)

class NewCatalog < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add your delivery methods
  #
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :catalog

  # Define helper methods to make rendering easier.
  #
  # `message` and `url` are used for rendering in the navbar

  def message
    if params[:catalog].brand.present?
      t(".with_brand", title: params[:catalog].title, user: params[:catalog].user.username, brand: params[:catalog].brand.name)
    else
      t(".without_brand", title: params[:catalog].title, user: params[:catalog].user.username)
    end
  end

  def url
    # You can use any URL helpers here such as:
    catalog_path(params[:catalog])
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
    }
  end
end
