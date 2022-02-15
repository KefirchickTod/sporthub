require 'rails_helper'

describe Surveys::Delete do
  subject { described_class.new(survey) }

  context 'when success was finding survey' do
    let(:survey) { create(:survey) }
    it { expect(subject.run).to be_truthy }
  end

  context 'when get invalid survey' do
    let(:survey) { nil }
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

end
