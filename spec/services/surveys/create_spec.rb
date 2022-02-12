require "rails_helper"

describe Surveys::Create do
  subject { described_class.new(params) }

  include_context "survey"

  context "when valid params" do
    it { expect(subject.call).to be_truthy }
  end

  context "when invalid params" do
    let(:question) { nil }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

  context "when empty options" do
    let(:options) { [] }
    it { expect { subject.call }.to raise_error(ActiveRecord::Rollback) }
  end
end
