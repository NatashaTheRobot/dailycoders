class AddBioMentorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text, limit: 16777215
    add_column :users, :mentor, :boolean
    add_index :users, :mentor
  end
end
