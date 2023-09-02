# spec/factories/forecasts.rb
FactoryBot.define do
    factory :forecast do
      address { 'India' }
      current_temperature { 25.0 }
      high_temperature { 30.0 }
      low_temperature { 20.0 }
      cached_at { Time.now }
    end
  end
  
  # spec/factories/extended_forecasts.rb (if needed)
  
  FactoryBot.define do
    factory :extended_forecast do
      # Define attributes for extended forecast if necessary
    end
  end
  