require "rails_helper"

describe Categories::Create do
  subject { described_class.new(params) }

  include_context 'categories'

  context 'when valid params' do
    it { expect(subject.call).to be_kind_of(Category) }
  end
  context 'when invalid params' do
    let(:params) do
      { title: category.title }
    end
    it { expect { subject.call }.to raise_error(ServiceException) }
  end

end
