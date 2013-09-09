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
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

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
