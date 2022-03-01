class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  # @param[User] user
  # @param[Article] article
  def initialize(user, article)
    @user = user
    @article = article
  end

  def update?
    @user.admin? || @user.moderator? || @user.id == @article.users_id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(aasm_state: "published")
      end
    end
  end
end
