class ImageUrl

  attr_accessor :title, :subtitle

  def initialize(title,subtitle)
    @title = title
    @subtitle = subtitle
  end

  def image_url_added
    return "https://ogi.sh/article?eyebrow=27%20AUGUST&title=#{@title}&subtitle=#{@subtitle}&unsplashId=gGX1fJkmw3k"
  end

end