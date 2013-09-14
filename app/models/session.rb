# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class Session < ActiveRecord::Base
  belongs_to :course

  has_many :enrollments, dependent: :destroy

  validates :start_date, presence: true
end
