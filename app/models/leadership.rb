# == Schema Information
#
# Table name: leaderships
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Leadership < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  validates :user_id, :uniqueness => { :scope => :course_id }
end
