class Funny < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
		# :storage => :s3, 
		# :bucket => 'finallyfunny', 
		# :s3_credentials => S3_CREDENTIALS
		# :storage => :s3, 
		# :bucket => ENV['finallyfunny']
	# validates :image, presence: true 
	# validates :description, presence: true	
	do_not_validate_attachment_file_type :image 
		

	validates :image, presence: true
	validates :description, presence: true
end