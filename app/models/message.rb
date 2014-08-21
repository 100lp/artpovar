class Message
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :name, :email, :body

	validates :name, :email, :body, :presence => true
	validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => false
	validates_length_of :body, :maximum => 2500, :minimum => 1
	
	def initialize(attributes = {})
	  attributes.each do |name, value|
	    send("#{name}=", value)
	  end
	end

	def persisted?
	  false
	end
end
