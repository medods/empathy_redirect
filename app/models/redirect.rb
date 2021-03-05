class Redirect < ApplicationRecord
	before_create :create_template

	def create_template
		puts "template creating"
	end

end
