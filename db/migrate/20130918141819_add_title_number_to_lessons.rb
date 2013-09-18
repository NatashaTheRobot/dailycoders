class AddTitleNumberToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :title, :string
    add_column :lessons, :number, :integer
    add_index :lessons, :number, unique: true
  end
end
