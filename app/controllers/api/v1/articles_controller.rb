class Api::V1::ArticlesController < ApplicationController
  # GET /articles
  def index
   @articles = Article.all
  end
end