class SessionAuthorizer < ApplicationAuthorizer

  #   :create => 'creatable',
  #   :read   => 'readable',
  #   :update => 'updatable',
  #   :delete => 'deletable'

  # only approved users can create a session
  def creatable_by?(user)
    user.admin_for?(resource.course)
  end

  # only user enrolled in the session or course admin have read access
  def readable_by?(user)
    user.in_session?(resource) || user.admin_for?(resource.course)
  end

  # only the course admins can update the sessions
  def updatable_by?(user)
    user.admin_for?(resource.course)
  end

  # only the course admins can delete the sessions
  def deletable_by?(user)
    user.admin_for?(resource.course)
  end

end