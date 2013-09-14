# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Course < ActiveRecord::Base

  include Authority::Abilities

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :sessions, dependent: :destroy
  has_many :enrollments, through: :sessions
  has_many :leaderships, dependent: :destroy

  self.authorizer_name = 'CourseAuthorizer'

  validates :name, presence: true

end
