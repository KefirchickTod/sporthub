require "rails_helper"

describe Articles::Create do
  subject { described_class.new(params, user_id) }

  include_context 'articles'

  let(:user_id) { user.id }

  context 'when valid all params' do

    it { expect(subject.run.success?).to be_truthy }
  end

  context 'when invalid user id' do
    let(:user_id) { 1012312342 }
    it 'should raise service exception' do
      expect { subject.call }.to raise_error(ServiceException)
    end
  end

  context 'when invalid form params' do
    let(:params) do
      { title: "#{Faker::Book.title}#{rand(0..2523234)}" }
    end
    it 'should raise service exception for invalid form data' do
      expect { subject.call }.to raise_error(ServiceException)
    end
  end

end
