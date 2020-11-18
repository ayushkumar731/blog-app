class AddUserTypeToUserModel < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :integer, default: 0, null: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
