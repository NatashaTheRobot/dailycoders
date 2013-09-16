# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  details    :text
#  lesson_id  :integer
#  summary    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
  belongs_to :lesson
  has_many :completions, dependent: :destroy
end
