class TeamFactMailer < ApplicationMailer
  def daily_fact
    @user = params[:user]
    @fact = params[:fact]

    mail(to: @user.email, subject: "Daily team fact, #{Team.count}")
  end
end
