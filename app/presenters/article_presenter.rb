class ArticlePresenter < SimpleDelegator
  def initialize(model,view)
    @model = model
    @view = view
    super(@model)
  end

  def previewText
    @model.text.slice(0,150)
  end

  def addArticle
    if @view.user_signed_in? && @view.current_user.admin?
      @view.link_to 'New article', @view.new_article_path ,:class=>"text-decoration-none btn btn-primary ml-5"
    end
  end
  
end