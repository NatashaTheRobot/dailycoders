# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image_url   :string(255)
#  description :text
#  private     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"
end
