# TekSystems Interview Weather Forecast App

## App Screenshot

A simple Ruby on Rails application that allows users to retrieve weather forecasts based on an address. The app integrates with the OpenWeatherMap API to provide current weather data and supports caching of forecasts for improved performance.

## Features

    Input an address to retrieve weather forecasts.
    Displays the current temperature, high/low temperatures, and extended forecast data (if available).
    Caches forecast details for 30 minutes to reduce API requests.
    Provides an indicator when the result is pulled from the cache.
    Integrates with Devise for user authentication (customize as needed).

## Getting Started
### Prerequisites

    Ruby (version 3.1.2)
    Ruby on Rails (version 7.0.1)
    Bundler 
    OpenWeatherMap API Key

## Installation

1. Clone the repository:

```
git clone https://github.com/yourusername/weather-forecast-app.git
cd weather-forecast-app
```

2. Install dependencies:

```
bundle install

```

3. Set up your environment variables:

   . Create a .env file in the project root and add your OpenWeatherMap API key:

   ```
   OPENWEATHERMAP_API_KEY=c2043c269c2b17032bf2d657cdbccb7b

   . Update the database configuration in config/database.yml as needed.

4. Initialize the database:

  ```
  rails db:migrate
  ```

5. Start the Rails server:

  ```
  rails server
  ```

6. Access the application in your web browser at http://localhost:3000.


## Usage

    Sign up or log in to your account.
    Enter an address in the provided form and click "Get Forecast."
    View the weather forecast details.
    Cached results will display an indicator.

## Testing

Run the test suite to ensure the application is functioning correctly:
   ```
    bundle exec rspec
   ```

## Usage

1. Sign up or log in to your account.
2. Enter an address in the provided form and click "Get Forecast."
3. View the weather forecast details.
4. Cached results will display an indicator. 

## Testing

Run the test suite to ensure the application is functioning correctly:

```
bundle exec rspec
```

#### Note
60% of the tests are covered

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
Acknowledgments

    Thanks to OpenWeatherMap for providing weather data.
    Built with Ruby on Rails.
    Inspired by Your Inspiration Web.

# Contact

For questions or feedback, please contact Pradeep Rao.