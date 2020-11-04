class Article < ApplicationRecord
    has_many :comments,as: :commentable, dependent: :destroy
    has_one_attached :image
    validates :title, 
        presence: true,
        length: { minimum: 5 }
end
