require "rails_helper"

describe Categories::Update do
  subject { described_class.new(id, params) }

  include_context 'categories'

  context 'when valid params for update' do
    let(:id) { category.id }
    it { expect(subject.call).to be_a_kind_of(Category) }
  end

  context 'when invalid params for update' do
    context 'when invalid id' do
      let(:id) { 12300322 }
      it 'should raise exception and get error response' do
        expect { subject.call }.to raise_error(ServiceException)
      end
    end
    context 'when invalid params' do
      let(:id) { category.id }
      let(:params) do {title: category.title, id: id, parent_id: -1} end
      it 'should raise exception and get error response' do
        expect(subject.run.error?).to be_truthy
      end
    end
  end

end