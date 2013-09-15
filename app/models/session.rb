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

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :course

  has_many :enrollments, dependent: :destroy

  validates :start_date, presence: true

  def slug_candidates
    [
        Bazaar.super_object,
        [Bazaar.adj, Bazaar.super_item],
        [Bazaar.super_adj, Bazaar.item],
        Bazaar.object
    ]
  end
end
