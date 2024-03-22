# Weather app

## Coding Assignment

### Requirements:

- Must be done in Ruby on Rails
- Accept an address as input
- Retrieve forecast data for the given address. This should include, at minimum, the current temperature (Bonus points - Retrieve high/low and/or extended forecast)
- Display the requested forecast details to the user
- Cache the forecast details for 30 minutes for all subsequent requests by zip codes. Display indicator if result is pulled from cache.

### Assumptions:

- This project is open to interpretation
- Functionality is a priority over form
- If you get stuck, complete as much as you can

### Submission:

- Use a public source code repository (GitHub, etc) to store your code
- Send us the link to your completed code

## Setup

Because I noticed in the job description that the position will be supporting Rails 5 and 6 apps, I created a new Rails
app using Rails 6 instead of the latest version 7. I also reduced the number of dependencies to the minimum I feel is
necessary to demonstrate this application.

```shell
rails _6.1.7.7_ new Weather \
  --skip-action-cable \
  --skip-action-mailbox \
  --skip-action-mailer \    
  --skip-action-text \
  --skip-active-storage \
  --skip-bootsnap \
  --skip-javascript \
  --skip-spring \
  --skip-system-test \
  --skip-turbolinks \
  --skip-webpack-install
```

## Configuration

### Weather API key

You will need to set up the app with a valid API key for the weather service. For security reasons, this cannot be
commited to the repository with the application code.

For demonstrating this app, just use the local settings override file as needed by
the [Config gem](https://github.com/rubyconfig/config).

1. Go to [Weather API](https://www.weatherapi.com) and get your free API key.
2. Copy `config/settings.local.sample.yml` to `config/settings.local.yml` using this command:
   - `cp config/settings.local.sample.yml config/settings.local.yml`
3. Replace the value for `WEATHER_API_KEY` with your API key.

In production, the API key will be stored as a secret or as an environment variable, which is the default setup in this
application.


