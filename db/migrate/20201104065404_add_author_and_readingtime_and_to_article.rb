class AddAuthorAndReadingtimeAndToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :author, :string
    add_column :articles, :readingtime, :string
    add_column :articles, :date, :date
  end
end
