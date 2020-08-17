# To deliver this notification:
#
# NewReview.with(post: @post).deliver_later(current_user)
# NewReview.with(post: @post).deliver(current_user)

class NewReview < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  #deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add your delivery methods
  #
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Format
  def to_database
    {
      type: self.class.name,
      params: params,
      account: Current.account
    }
  end

  # def to_action_cable
  #   {
  #     type: self.class.name,
  #     params: params,
  #     account: Current.account
  #   }
  # end

  # Add required params
  #
  param :review

  # Define helper methods to make rendering easier.
  #
  # `message` and `url` are used for rendering in the navbar

  def message
    t(".message")
  end

  def url
    # You can use any URL helpers here such as:
    # post_path(params[:post])
    polymorphic_path([params[:review].reviewable, params[:review]])
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
    }
  end
end
