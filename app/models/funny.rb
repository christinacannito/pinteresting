class Funny < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" } # here add the default url if a person doesn't want to add an image // :default_url => "/images/:style/missing.png"
	# copied from the paperclip github - will create a thumbnail and full size image
	# a pin has an attached image
	do_not_validate_attachment_file_type :image 
end