class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :slug
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    add_index :courses, :slug, unique: true
  end
end
