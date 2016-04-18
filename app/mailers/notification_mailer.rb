class NotificationMailer < ApplicationMailer
  default from: 'no-reply@thefirehoseproject.com'

  def post_created(post)
    @post = post
    mail(to: @post.user.email, 
      subject: "You created Post #{@post.title} at #{@post.created_at}")
  end
end
