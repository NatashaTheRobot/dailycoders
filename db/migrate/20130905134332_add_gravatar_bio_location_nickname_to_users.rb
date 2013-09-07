class AddGravatarBioLocationNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gravatar_id, :string
    add_column :users, :location, :string
    add_column :users, :nickname, :string
    add_column :users, :email, :string
  end
end
