# To deliver this notification:
#
# NewComment.with(post: @post).deliver_later(current_user)
# NewComment.with(post: @post).deliver(current_user)

class NewComment < ApplicationNotification
  # Database delivery is already added in ApplicationNotification
  deliver_by :action_cable, format: :to_websocket, channel: "NotificationChannel"

  # Add your delivery methods
  #
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  param :comment
  param :commentable

  # Define helper methods to make rendering easier.
  #
  # `message` and `url` are used for rendering in the navbar

  def message
    if params[:reviewable].present?
      t(".with_reviewable", user: params[:comment].user.username, reviewable_name: params[:reviewable].name, brand: params[:reviewable].brand.name)
    else
      t(".without_reviewable", title: params[:commentable].title, commentable_type: params[:comment].commentable_type.downcase, user: params[:comment].user.username)
    end
  end

  def url
    if params[:reviewable].present?
      polymorphic_path([params[:reviewable], params[:commentable]])
    else
      polymorphic_path(params[:commentable])
    end
  end

  # Include account_id to make sure notification only triggers if user is signed in to that account
  def to_websocket
    {
      account_id: record.account_id,
      html: ApplicationController.render(partial: "notifications/notification", locals: {notification: record})
    }
  end
end
