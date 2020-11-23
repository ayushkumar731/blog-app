class Article < ApplicationRecord
  include Sluggable

  has_many :comments,as: :commentable, dependent: :destroy
  has_one_attached :image
  belongs_to :user
  validates :title, 
    presence: true,
    length: { minimum: 5 }
end
