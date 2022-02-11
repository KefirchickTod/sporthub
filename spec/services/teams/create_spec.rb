require "rails_helper"

describe Teams::Create do
  subject { described_class.new(params) }

  include_context "teams"

  context "when valid all params" do
    it { expect(subject.run.success?).to eq(true) }
  end

  context "when not unique title" do
    let(:title) { team.title }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end
end
