class NotificationsMailer < ActionMailer::Base
  default from: "message@art-povar.ru"

  def new_message(message)
  	@message = message
  	mail(to: 'nadezhda_ilina@art-povar.ru')
  end
end
