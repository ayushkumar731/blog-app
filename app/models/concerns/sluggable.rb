module Sluggable
  extend ActiveSupport::Concern
  included do
    after_create :slug_added
  end

  def slug_added
    self.slug = self.title.gsub(' ', '-')
    self.save!
  end
end