# == Schema Information
#
# Table name: completions
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Completion do
  it { should belong_to :user }
  it { should belong_to :task }
end
