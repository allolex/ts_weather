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
