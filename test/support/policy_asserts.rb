# frozen_string_literal: true

module PolicyAsserts
  def assert_permit(user, record, action)
    msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted"
    assert permit(user, record, action), msg
  end

  def refute_permit(user, record, action)
    msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
    assert_not permit(user, record, action), msg
  end

  def permit(user, record, action)
    index = self.class.name.index('Policy')
    klass = self.class.name[0, index + 6]
    klass.constantize.new(user, record).public_send("#{action}?")
  end
end
