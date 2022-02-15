RSpec.shared_context "survey" do
  let(:question) { Faker::Games::ElderScrolls.weapon + "?" }
  let(:options) do
    [

      %w[Yes No][rand(0..1)],

      %w[Yes No][rand(0..1)]

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
      %w[Yes No][rand(0..1)],
      %w[Yes No][rand(0..1)]

      # surveys_id: survey.id
    ]
  end
  let(:params) { answer }
end

RSpec.shared_context "survey_answer" do
  let(:user) { create(:user) }
  let(:option) { create(:survey_option) }
end
