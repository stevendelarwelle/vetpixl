class Pin < ActiveRecord::Base
  
	
	acts_as_votable
  acts_as_taggable
  belongs_to :user
  has_attached_file :image, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  
end
