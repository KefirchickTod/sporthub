require "rails_helper"

describe Surveys::Answers::Create do
  subject { described_class.new(option, user) }

  include_context "survey_answer"

  context "when valid params" do
    it { expect(subject.run).to be_truthy }
  end

  context "when invalid user" do
    let(:user) { nil }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

  context "when invalid option" do
    let(:option) { nil }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end
end
