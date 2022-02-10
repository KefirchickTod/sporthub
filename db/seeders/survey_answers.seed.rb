options = SurveyOption.all
user = User.all

150.times do
  SurveyAnswer.create(
    users_id: user.sample.id,
    survey_options_id: options.sample.id
  )
end
