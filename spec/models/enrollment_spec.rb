# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  admin      :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Enrollment do

  it { should belong_to :user }
  it { should belong_to :course }
  it { should validate_uniqueness_of(:user_id).scoped_to(:course_id) }

end
