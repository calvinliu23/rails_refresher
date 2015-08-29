class Contact < ActiveRecord::Base
	has_no_table

	attr_accessor :name, :string
	attr_accessor :email, :string
	attr_accessor :content, :string

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :content
	validates_format_of :email, :with => /([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})/i
	validates_length_of :content, :maximum => 500
end

