# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  session_id :integer
#

require 'spec_helper'

describe Enrollment do

  it { should belong_to :user }
  it { should belong_to :session }
  it { should validate_uniqueness_of(:user_id).scoped_to(:session_id) }

end
