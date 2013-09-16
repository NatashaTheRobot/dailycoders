class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :url
      t.text :details
      t.references :lesson, index: true
      t.string :summary

      t.timestamps
    end
  end
end
