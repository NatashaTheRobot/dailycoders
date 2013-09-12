# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class Course < ActiveRecord::Base

  include Authority::Abilities

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :enrollments

  self.authorizer_name = 'CourseAuthorizer'

  validates :name, presence: true
  validates :start_date, presence: true

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
        :name,
        [:name, :start_date],
        [:name, :start_date, :end_date]
    ]
  end
end
