class Video < ActiveRecord::Base
  belongs_to :category
  # validates :title, :description, presence: :true
  validates_presence_of :title, :description, :cover_image_url

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    word = search_term.downcase
    where("title LIKE ?", "%#{word}%").order("created_at DESC")
  end

end
