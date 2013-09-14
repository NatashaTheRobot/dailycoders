class RemoveStartDateEndDateFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :start_date
    remove_column :courses, :end_date
  end
end
