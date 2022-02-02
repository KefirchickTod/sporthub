require 'rails_helper'

RSpec.describe Service do
  it "should run the service" do
    service = object_double(Service.new, call: true)

    allow(service).to receive(:run) {
      ServiceResponse.new(true, data: nil)
    }
    expect(service.call).to eq(true)

    status = service.run

    expect(status).to be_a_kind_of(ServiceResponse)
    expect(status.success?).to eq(true)
  end

  it "should raise an error if not implemented method call" do
    service = Service.new

    expect { service.call }.to raise_error("This method is not implemented")
    # expect(service.call).to eq(false)
  end
end
