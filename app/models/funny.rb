class Funny < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :image, 
		:style => { :medium => "300x300>", :thumb => "100x100>" },
		# :storage => :s3, 
		:bucket => ENV['finallyfunny']
	# validates :image, presence: true 
	# validates :description, presence: true	
	do_not_validate_attachment_file_type :image 
end