class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :course, index: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
