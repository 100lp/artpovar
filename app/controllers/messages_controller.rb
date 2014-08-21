class MessagesController < ApplicationController
	before_filter :help
	def help
    @gallery_nav = [ new_path, ugolki_dushi_path, sozvezdii_slona_path, lady_path, homo_insectarium_path, about_path ]
  end
	def new
	  @message = Message.new
	end

	def create
	  @message = Message.new(params[:message])
	  
	  if @message.valid?
	    NotificationsMailer.new_message(@message).deliver
	    redirect_to(contacts_path, :notice => "Message was successfully sent.")
	  else
	    redirect_to(contacts_path, :notice => "Please fill all fields.")
	  end
	end
end
