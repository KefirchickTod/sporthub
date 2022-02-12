RSpec.shared_context "survey" do
  let(:question) { Faker::Games::ElderScrolls.weapon + "?" }
  let(:options) do
    [
      {
        answer: %w[Yes No][rand(0..1)]
      },
      {
        answer: %w[Yes No][rand(0..1)]
      }
    ]
  end

  let(:params) do
    {
      question: question,
      active_from: Faker::Date.between(from: Date.today.prev_month, to: Date.today),
      active_to: Faker::Date.between(from: Date.today, to: Date.today.next_month),
      status: "published",
      options: options
    }
  end
end

RSpec.shared_context "survey_options" do
  let!(:survey) { create(:survey) }
  let(:answer) do
    [
      {
        answer: %w[Yes No][rand(0..1)]
      },
      {
        answer: %w[Yes No][rand(0..1)]
      }
      # surveys_id: survey.id
    ]
  end
  let(:params) { answer }
end
