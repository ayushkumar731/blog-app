class Article < ApplicationRecord
  include ActionView::Helpers::AssetTagHelper
  include Sluggable
  require './lib/image_url'
  
  after_create :set_img_url


  extend FriendlyId
  friendly_id :url_slug, use: :sequentially_slugged

  has_many :comments,as: :commentable, dependent: :destroy
  has_one_attached :image
  belongs_to :user
  validates :title, 
    presence: true,
    length: { minimum: 5 }

  def set_img_url
    content = ImageUrl.new(self.title,self.text)
    self.link = content.image_url_added
    self.save!
  end
end
