require 'rails_helper'

describe Service do
  subject { described_class.new }

  let(:success) { ServiceResponse.new(true, data: nil) }

  context 'when success done' do
    it 'should run service' do
      service = object_double(subject, call: true)

      allow(service).to receive(:run).and_return(success)

      expect(service.run).to be_a_kind_of(ServiceResponse)
      expect(service.run.success?).to be_truthy

    end
  end

  # context 'when service get raise error' do
  #  it 'should raise error' do
  #    service = double(subject, call: true, run: true )

  #    allow(service).to receive(:call) {
  #      raise ServiceException.new("Error")
  #    }

  #    expect { service.call }.to raise_error(ServiceException)
  #    expect(service.run.error?).to be_truthy

  #  end
  #end

  context 'when service method not implemented' do
    it { expect { subject.call }.to raise_error("This method is not implemented") }
  end

end
