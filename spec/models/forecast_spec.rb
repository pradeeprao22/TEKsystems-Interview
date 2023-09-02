# spec/models/forecast_spec.rb

require 'rails_helper'

RSpec.describe Forecast, type: :model do
  it 'is valid with valid attributes' do
    forecast = FactoryBot.build(:forecast)
    expect(forecast).to be_valid
  end

  it 'is not valid without an address' do
    forecast = FactoryBot.build(:forecast, address: nil)
    expect(forecast).not_to be_valid
  end

  # Add more validation tests as needed
end
