# spec/controllers/forecasts_controller_spec.rb

require 'rails_helper'

RSpec.describe ForecastsController, type: :controller do
  before(:each) do
      @user = FactoryBot.create(:user) # Assuming you have a User model
      sign_in @user # Sign in the user using Devise
  end
    
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns all forecasts to @forecasts' do
      forecasts = FactoryBot.create_list(:forecast, 3) # Assuming you have FactoryBot set up
      get :index
      expect(assigns(:forecasts)).to eq(forecasts)
    end
  end

  describe 'POST #create' do
    it 'redirects to the show page on successful forecast retrieval' do
      allow(controller).to receive(:retrieve_forecast).and_return(FactoryBot.build(:forecast))
      post :create, params: { address: 'Example Address' }
      expect(response).to redirect_to(assigns(:forecast_data))
    end

    it 'assigns the forecast data to @forecast_data on successful retrieval' do
      forecast = FactoryBot.build(:forecast)
      allow(controller).to receive(:retrieve_forecast).and_return(forecast)
      post :create, params: { address: 'Example Address' }
      expect(assigns(:forecast_data)).to eq(forecast)
    end

    it 'assigns the extended forecast data to @extended_forecast if available' do
      forecast = FactoryBot.build(:forecast)
      extended_forecast = FactoryBot.build(:extended_forecast)
      allow(controller).to receive(:retrieve_forecast).and_return(forecast)
      allow(controller).to receive(:fetch_extended_forecast).and_return(extended_forecast)
      post :create, params: { address: 'Example Address' }
      expect(assigns(:extended_forecast)).to eq(extended_forecast)
    end

    it 'redirects to the root path and sets @cached to true if no forecast data is retrieved' do
      allow(controller).to receive(:retrieve_forecast).and_return(nil)
      post :create, params: { address: 'Invalid Address' }
      expect(response).to redirect_to(root_path)
      expect(assigns(:cached)).to be_truthy
    end
  end
end
