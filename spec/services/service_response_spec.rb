require 'rails_helper'

RSpec.describe ServiceResponse do

  it 'should create true response' do
    response = ServiceResponse.new(true, data: 'test')

    expect(response.success?).to eq(true)

  end

  it 'should create false response' do
    response = ServiceResponse.new(false, error: StandardError.new('StandardError test'))

    expect(response.success?).to eq(false)
    expect(response.error?).to eq(true)

    expect(response.error_massage).to eq('StandardError test')
  end

end
