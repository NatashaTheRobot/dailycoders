# == Schema Information
#
# Table name: lessons
#
#  id             :integer          not null, primary key
#  session_id     :integer
#  overview       :text
#  date_available :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Lesson do
  it { should belong_to :session }
  it { should have_many(:tasks).dependent(:destroy) }
  it { should have_many(:completions).through(:tasks) }
end
