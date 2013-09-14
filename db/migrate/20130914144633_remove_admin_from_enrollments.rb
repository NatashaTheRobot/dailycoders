class RemoveAdminFromEnrollments < ActiveRecord::Migration
  def change
    remove_column :enrollments, :admin
  end
end
