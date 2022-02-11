require "rails_helper"

describe Teams::Delete do
  subject { described_class.new(id) }

  include_context "teams"

  context "when valid delete params" do
    let(:id) { team.id }
    it { expect(subject.run.success?).to be_truthy }
  end

  context "when invalid delete params" do
    let(:id) { 100123322 }
    it { expect(subject.run.error?).to be_truthy }
  end
end
