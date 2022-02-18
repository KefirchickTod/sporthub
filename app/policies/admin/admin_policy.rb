# frozen_string_literal: true

class AdminPolicy
  attr_reader :user, :record

  # @param[User] user
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.present? && @user.admin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
