class CreateLeaderships < ActiveRecord::Migration
  def change
    create_table :leaderships do |t|
      t.references :course, index: true
      t.references :user, index: true

      t.timestamps
    end
    add_index :leaderships, [:user_id, :course_id], unique: true
  end
end
