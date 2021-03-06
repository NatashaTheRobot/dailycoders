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
#  slug       :string(255)
#

class Session < ActiveRecord::Base

  include Authority::Abilities
  self.authorizer_name = 'SessionAuthorizer'

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :course

  has_many :enrollments, dependent: :destroy
  has_many :lessons,  dependent: :destroy

  validates :start_date, presence: true

  def slug_candidates
    [
        Bazaar.super_object,
        [Bazaar.adj, Bazaar.super_item],
        [Bazaar.super_adj, Bazaar.item],
        Bazaar.object
    ]
  end

  def sorted_lessons
    self.lessons.sort! { |lesson1, lesson2| lesson1.number <=> lesson2.number }
  end
end
