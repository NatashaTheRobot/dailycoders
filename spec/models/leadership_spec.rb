# == Schema Information
#
# Table name: leaderships
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Leadership do
  it { should belong_to :user }
  it { should belong_to :course }
end
