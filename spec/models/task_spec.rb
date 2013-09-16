# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  details    :text
#  lesson_id  :integer
#  summary    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Task do
  it { should belong_to :lesson }
  it { should have_many(:completions).dependent(:destroy) }
end
