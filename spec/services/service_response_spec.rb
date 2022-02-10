require 'rails_helper'

describe ServiceResponse do


  it 'should create true response' do
    response = described_class.new(true, data: 'test')

    expect(response.success?).to eq(true)

  end

  it 'should create false response' do
    response = described_class.new(false, error: StandardError.new('StandardError test'))

    expect(response.success?).to eq(false)
    expect(response.error?).to eq(true)

    expect(response.error_massage).to eq('StandardError test')
  end

end
