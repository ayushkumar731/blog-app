class Article < ApplicationRecord
  include Sluggable

  extend FriendlyId
  friendly_id :url_slug, use: :sequentially_slugged

  has_many :comments,as: :commentable, dependent: :destroy
  has_one_attached :image
  belongs_to :user
  validates :title, 
    presence: true,
    length: { minimum: 5 }
end
