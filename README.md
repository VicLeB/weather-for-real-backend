# WEATHER FOR REAL

This app intends to provide users with weather data as well as a social feed of what the weather is really like in their area.

This repository was built as the Rails REST API for the weather for real project and is hosted on Heroku

See [Frontend Repo](https://github.com/VicLeB/weather-for-real-frontend) for details and Checkout the app live on [Github pages](https://vicleb.github.io/weather-for-real-frontend/)

Technologies used:
* Ruby on Rails
* PostgreSQL DB
* Active Storage

Gems installed:
* aws-sdk-s3
* rest-client
* jwt
* bcrypt
* dotenv-rails

## Getting started
scripts to start application
* `bundle install`
* `rails active_storage:install`
* `rails db:migrate`
* `rails server`

**Note: to post and retrieve image data locally, you will need to create your own aws S3 bucket and enter your credentials in the storage.yml file. Alternatively to use Active storage alone for file/ image submission navigate to config/environments/development.rb and add the following:

    config.active_storage.service = :local


 Other wise see the app hosted on [Github pages](https://vicleb.github.io/weather-for-real-frontend/) to see this feature in action.

## Why did I use all those gems?
* aws-sdk-s3: was utilized to enable file/ image upload capabilities when in the production setting on heroku
* rest-client: used to enable calls to an external API from the backend environment see [weather controller](https://github.com/VicLeB/weather-for-real-backend/blob/main/app/controllers/weather_controller.rb).
* jwt: enables the use of JSON Web Tokens to authenticate users on login
* bcrypt: used to provide a level of security to user passwords. This will hash the password so it will not be stored in plain text, which would pose a threat to user account security
* dotenv-rails: allows for the use of .env file in ruby and retrieval of data stored in this file throughout the API

### Model ralationships
See Relationship diagram [here](https://dbdiagram.io/d/630d23960911f91ba5ee034c)

Note: due to the use of active storage for image file upload, when active_storage is installed, three additional tables are generated as seen in the [schema.rb](https://github.com/VicLeB/weather-for-real-backend/blob/main/db/schema.rb). The images are associated with each post with the use of

    has_one_attached :image

seen in [post.rb](https://github.com/VicLeB/weather-for-real-backend/blob/main/app/models/post.rb)