require "rails_helper"

describe Users::Teams::Create do
  subject { described_class.new(user, params) }

  let!(:user) { create(:user) }
  let(:params) { [create(:team).id, create(:team).id, create(:team).id] }

  context "when correct teams list" do
    it { expect(subject.run.success?).to be_truthy }
  end

  context "when get empty teams list" do
    let(:params) { [] }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

  context "when get incorrect teams id" do
    let(:params) { [1233214] }
    it { expect { subject.call }.to raise_error(ActiveRecord::RecordNotFound) }
  end

  context "when get not array and type teams list" do
    let(:params) { "Hello world" }
    it { expect { subject.call }.to raise_error(ActiveRecord::RecordNotFound) }
  end

  context "when get only one param" do
    let(:params) { create(:team).id }
    it { expect(subject.run.success?).to be_truthy }
  end
end
