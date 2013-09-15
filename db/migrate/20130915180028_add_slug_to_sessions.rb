class AddSlugToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :slug, :string
    add_index :sessions, :slug, unique: true
  end
end
