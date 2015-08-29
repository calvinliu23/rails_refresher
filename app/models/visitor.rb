class Visitor < ActiveRecord::Base
	has_no_table
	attr_accessor :email, :string
	validates_presence_of :email
	validates_format_of :email, :with => /([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})/i

	def subscribe
		mailchimp =  Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
		result = mailchimp.lists.subscribe({
			:id => ENV['MAILCHIMP_LIST_ID'],
			:email => {:email => self.email},
			:double_optin => false,
			:update_existing => true,
			:send_welcome => true
			})
		Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
	end
end