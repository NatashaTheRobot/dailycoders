# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  provider    :string(255)
#  uid         :string(255)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  gravatar_id :string(255)
#  location    :string(255)
#  nickname    :string(255)
#  email       :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
