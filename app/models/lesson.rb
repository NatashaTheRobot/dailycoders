# == Schema Information
#
# Table name: lessons
#
#  id             :integer          not null, primary key
#  session_id     :integer
#  overview       :text
#  date_available :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

class Lesson < ActiveRecord::Base
  belongs_to :session

  has_many :tasks, dependent: :destroy
  has_many :completions, through: :tasks
end
