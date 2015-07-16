class Listing < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true
	validates :description, presence: true


	# specify what dropbox settings you want to adhere by, based on what environment you are in
	if Rails.env.development?
  	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
  else
	  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
									  	:storage => :dropbox,
									    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),

 # So this extra line means that if I upload a bag.jpg file, it’s first going be sorted into a folder based on whether it’s a medium, a thumb, or an original size. Then, it’s going to name it id_bag.jpg where id is just the id number of the listing that we’re creating. Now this id part is pretty important because it makes sure that each file is given a unique file name. 


									    :path => ":style/:id_:filename"
	end
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


	validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates_attachment_presence :image
end


