class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.boolean :private

      t.timestamps
    end
  end
end
