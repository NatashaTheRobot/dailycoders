class CourseAuthorizer < ApplicationAuthorizer

  #   :create => 'creatable',
  #   :read   => 'readable',
  #   :update => 'updatable',
  #   :delete => 'deletable'

  # only approved users can create a course
  def self.creatable_by?(user)
    user.admin?
  end

  # only user enrolled in the course have read access
  def readable_by?(user)
    user.enrolled_in?(resource)
  end

  # only the course admins can update the course
  def updatable_by?(user)
    user.admin_for?(resource)
  end

  # only the course admins can delete the course
  def deletable_by?(user)
    user.admin_for?(resource)
  end

end