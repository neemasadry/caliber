# To deliver this notification:
#
# NewProduct.with(post: @post).deliver_later(current_user)
# NewProduct.with(post: @post).deliver(current_user)

class NewProduct < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add your delivery methods
  #
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  param :product

  # Define helper methods to make rendering easier.
  #
  # `message` and `url` are used for rendering in the navbar

  def message
    t(".message", brand: params[:product].brand.name, product: params[:product].name)
  end

  def url
    # You can use any URL helpers here such as:
    # post_path(params[:post])
    polymorphic_path(params[:product])
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
    }
  end
end
