
SurveyOption.delete_all

survey = Survey.all

25.times do
  SurveyOption.create(
    answer: Faker::Book.author,
    surveys_id: survey.sample.id
  )
end