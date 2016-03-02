class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_attached_file :image, preserve_files: "false", styles: { medium: "300x300>", thumb: "100x100>" }
	
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true
end
