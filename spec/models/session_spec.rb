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

require 'spec_helper'

describe Session do
  it { should belong_to :course }
  it { should validate_presence_of :start_date }
  it { should have_many(:enrollments).dependent(:destroy) }
end
