class Video < ActiveRecord::Base
  belongs_to :category
  # validates :title, :description, presence: :true
  validates_presence_of :title, :description, :cover_image_url
end
