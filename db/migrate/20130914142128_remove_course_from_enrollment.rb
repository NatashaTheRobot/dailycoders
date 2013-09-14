class RemoveCourseFromEnrollment < ActiveRecord::Migration
  def change
    remove_column :enrollments, :course_id
    add_column :enrollments, :session_id, :integer
    add_index :enrollments, [:user_id, :session_id], unique: true
  end
end
