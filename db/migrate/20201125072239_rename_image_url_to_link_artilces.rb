class RenameImageUrlToLinkArtilces < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :image_url, :link
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
