# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  session_id :integer
#

class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :session

  validates :user_id, :uniqueness => { :scope => :session_id }
end
