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
#  slug        :string(255)
#  admin       :boolean
#

require 'spec_helper'

describe User do

  it { should have_many :enrollments }
  it { should have_many(:courses).through(:enrollments) }

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

  describe '#enrolled_in?(course)' do

    before do
      @user = User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
      @course = FactoryGirl.create :course
    end

    it "returns false if the user is not enrolled in a course" do
      @user.enrolled_in?(@course).should be_false
    end

    it "returns true if the user is enrolled in a course" do
      Enrollment.create(user: @user, course: @course)
      @user.enrolled_in?(@course).should be_true
    end
  end

  describe '#admin_for?(course)' do
    before do
      @user = User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
      @course = FactoryGirl.create :course
      @enrollment = Enrollment.create(user: @user, course: @course)
    end

    it "returns false when the user is not enrolled in the course" do
      @enrollment.destroy!
      @user.admin_for?(@course).should be_false
    end

    it "returns false when the user is not a course admin" do
      @user.admin_for?(@course).should be_false
    end

    it "returns true when the user is a course admin" do
      @enrollment.admin = true
      @enrollment.save!
      @user.admin_for?(@course).should be_true
    end

  end

end
