require "rails_helper"

describe Surveys::Options::Create do
  subject { described_class.new(survey, params) }

  include_context "survey_options"

  context "when valid params" do
    it { expect(subject.run.success?).to be_truthy }
  end

  context "when incorrect answer" do
    let(:answer) { nil }
    it { expect(subject.run.error?).to be_truthy }
  end

  context "when invalid survey" do
    let!(:survey) { nil }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

  context "when empty options" do
    let(:answer) { [] }
    it { expect { subject.call }.to raise_error(Surveys::Options::EmptyOptionsException) }
  end
end
