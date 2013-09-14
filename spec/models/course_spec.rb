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

require 'spec_helper'

describe Course do

  it { should validate_presence_of :name }
  it { should have_many(:sessions).dependent(:destroy) }
  it { should have_many(:enrollments).through(:sessions) }
  it { should have_many(:leaderships).dependent(:destroy) }

end
