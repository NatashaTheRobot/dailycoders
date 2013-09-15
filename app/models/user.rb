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

class User < ActiveRecord::Base

  include Authority::UserAbilities

  extend FriendlyId
  friendly_id :nickname, use: :slugged

  has_many :enrollments
  has_many :sessions, through: :enrollments
  has_many :courses, through: :sessions

  has_many :leaderships

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']

      auth_info = auth['info']
      user.name = auth_info['name']
      user.email = auth_info['email']
      user.nickname = auth_info["nickname"]

      extra_info = auth['extra']['raw_info']
      user.location = extra_info['location']
      user.gravatar_id = extra_info['gravatar_id']
    end
  end

  def enrolled_in?(course)
    self.courses.include?(course)
  end

  def in_session?(session)
    self.sessions.include?(session)
  end

  def admin_for?(course)
    leaderships = self.leaderships.select { |leadership| leadership.course == course }
    leaderships.count > 0
  end

  # includes courses that might not have sessions yet but the user is a leader for
  def all_courses
    courses = self.courses.to_a
    self.leaderships.each do |leadership|
      courses << leadership.course unless courses.include?(leadership.course)
    end
    return courses
  end
end
