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

class Group < ActiveRecord::Base
end
