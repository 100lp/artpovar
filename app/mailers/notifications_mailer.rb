class NotificationsMailer < ActionMailer::Base
  def new_message(message)
  	@message = message
  	mail(to: 'nadezhda_ilina@art-povar.ru')
  end
end
