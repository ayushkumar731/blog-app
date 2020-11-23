class ArticlesPresenter < ApplicationPresenter


  def previewText
    @model.text.slice(0,150)
  end
end