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
  it { should have_many(:sessions).through(:enrollments) }
  it { should have_many(:courses).through(:sessions) }
  it { should have_many :leaderships }

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
      session = FactoryGirl.create :session, course: @course
      FactoryGirl.create :enrollment, user: @user, session: session
      @user.enrolled_in?(@course).should be_true
    end
  end

  describe '#admin_for?(course)' do
    before do
      @user = User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
      @course = FactoryGirl.create :course
    end

    it "returns false when the user is not a course leader" do
      @user.admin_for?(@course).should be_false
    end

    it "returns true when the user is a course admin" do
      FactoryGirl.create :leadership, course: @course, user: @user
      @user.admin_for?(@course).should be_true
    end

  end

  describe "#all_courses" do
    before do
      @user = User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
      @course = FactoryGirl.create :course
    end

    context "when the user is not a course admin and is not enrolled in any courses" do
      it "returns no courses" do
        @user.all_courses.count.should eq 0
      end
    end

    context "when the user is the course admin" do
      before do
        FactoryGirl.create :leadership, user: @user, course: @course
      end
      it "returns the courses the user is an admin for" do
        @user.all_courses.count.should eq 1
      end
    end

    context "when the user is enrolled in the course" do
      before do
        session = FactoryGirl.create :session, course: @course
        FactoryGirl.create :enrollment, user: @user, session: session
      end
      it "returns the courses the user is enrolled in" do
        @user.all_courses.count.should eq 1
      end
    end

    context "when the user is enrolled in one course and is an admin for another" do
      before do
        FactoryGirl.create :leadership, user: @user, course: @course
        course = FactoryGirl.create :course
        session = FactoryGirl.create :session, course: course
        FactoryGirl.create :enrollment, user: @user, session: session
      end

      it "returns all the courses the user is enrolled in and is an admin for" do
        @user.all_courses.count.should eq 2
      end
    end

  end

end
