class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :session, index: true
      t.text :overview
      t.datetime :date_available

      t.timestamps
    end
    add_index :lessons, :date_available
  end
end
