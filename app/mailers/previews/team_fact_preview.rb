class TeamFactPreview < ActionMailer::Preview
  def daily_fact
    TeamFactMailer.with(user: User.all.sample, fact: "Hello it world").daily_fact
  end
end
