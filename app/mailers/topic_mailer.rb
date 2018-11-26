class TopicMailer < ApplicationMailer
  def topic_mail(topic)
    @topic = topic
    
  mail to: @topic.user.email, subject:"投稿完了メール"
  end
end