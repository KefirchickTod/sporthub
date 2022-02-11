require "rails_helper"

describe Teams::Update do
  subject { described_class.new(id, params) }

  include_context "teams"

  context "when params is valid" do
    let(:id) { team.id }
    it { expect(subject.run.success?).to be_truthy }
  end

  context "when params is invalid" do
    let(:id) { 100599100599 }
    it { expect(subject.run.error?).to be_truthy }
  end
end
