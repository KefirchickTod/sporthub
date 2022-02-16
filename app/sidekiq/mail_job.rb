class MailJob
  include Sidekiq::Job

  # For each user send letters
  #
  # @param[Array[User]]
  def perform(users)
    users.each do |user|
      # @type user User
      # user.send
    end
  end
end
