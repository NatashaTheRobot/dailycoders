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
  has_many :courses, through: :enrollments

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

  def admin_for?(course)

    if self.enrolled_in?(course)
      admin_enrollments = self.enrollments.select { |enrollment| enrollment.course == course && enrollment.admin}
      return true if admin_enrollments.count > 0
    end

    return false
  end
end
