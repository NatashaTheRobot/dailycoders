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
  self.authorizer_name = 'CourseAuthorizer'

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :sessions, dependent: :destroy
  has_many :enrollments, through: :sessions
  has_many :leaderships, dependent: :destroy

  validates :name, presence: true

  def slug_candidates
    [
        :name,
        [:name, Bazaar.super_adj],
        [:name, Bazaar.adj]
    ]
  end
end
