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

  describe ".create_with_omniauth" do
    it "successfully creates a user from the omniauth response" do
      expect {
        User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
      }.to change{ User.count }.by(1)
    end
    it "correctly assigns all the attributes" do
      user = User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
      user.provider.should eq 'github'
      user.uid.should eq '12345'
      user.name.should eq 'natasha'
      user.gravatar_id.should eq '123456789'
      user.location.should eq 'San Francisco'
      user.nickname.should eq 'NatashaTheRobot'
      user.email.should eq 'hi@natashatherobot.com'
    end
  end

end
