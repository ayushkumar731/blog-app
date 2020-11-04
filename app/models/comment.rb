class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :commentable, polymorphic: true, touch: true
  has_many :comments, as: :commentable
  has_many :comments, dependent: :destroy, as: :commentable
end
