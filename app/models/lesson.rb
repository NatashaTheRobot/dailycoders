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
#  title          :string(255)
#  number         :integer
#

class Lesson < ActiveRecord::Base
  belongs_to :session

  validates :number, uniqueness: true

  has_many :tasks, dependent: :destroy
  has_many :completions, through: :tasks
end
